#!/usr/bin/env python3
"""
Upload plant-disease treatment medicines to the SmartSoil store backend.

What it does:
  1. Logs in with your email/password  -> gets an auth token (data.token)
  2. For each product in products.json:
       - generates a clean labeled product image (via placehold.co)
       - uploads it to the `add-product` endpoint as multipart/form-data

Run:
  pip install requests
  python upload_medicines.py --base-url https://YOUR-SERVER/ --email you@mail.com --password yourpass

Notes:
  - --base-url must end with a slash, e.g. https://abcd.ngrok-free.app/
  - The ngrok free URL changes every time you restart ngrok, so pass the
    current one. (Update lib/core/networking/end_boint.dart with the same URL
    so the app talks to the same server.)
"""

import argparse
import json
import os
import sys
import tempfile

try:
    import requests
except ImportError:
    sys.exit("Missing dependency. Run:  pip install requests")

# Endpoints (must match lib/core/networking/end_boint.dart)
LOGIN_ENDPOINT = "login"
ADD_PRODUCT_ENDPOINT = "add-product"

NGROK_HEADERS = {"ngrok-skip-browser-warning": "true"}


def login(base_url, email, password):
    url = base_url + LOGIN_ENDPOINT
    print(f"-> Logging in as {email} ...")
    resp = requests.post(
        url,
        data={"email": email, "password": password},  # multipart/form fields
        headers=NGROK_HEADERS,
        timeout=30,
    )
    resp.raise_for_status()
    body = resp.json()
    token = (body.get("data") or {}).get("token")
    if not token:
        sys.exit(f"Login failed, no token in response:\n{json.dumps(body, indent=2)}")
    print("   Login OK, token received.")
    return token


def _hex_to_rgb(h):
    h = h.lstrip("#")
    return tuple(int(h[i:i + 2], 16) for i in (0, 2, 4))


def _solid_png(rgb, size=600):
    """Pure-Python solid-color PNG (no dependencies, works offline)."""
    import struct
    import zlib

    r, g, b = rgb
    row = b"\x00" + bytes([r, g, b]) * size       # filter byte + RGB pixels
    raw = row * size
    comp = zlib.compress(raw, 9)

    def chunk(typ, data):
        c = struct.pack(">I", len(data)) + typ + data
        return c + struct.pack(">I", zlib.crc32(typ + data) & 0xFFFFFFFF)

    sig = b"\x89PNG\r\n\x1a\n"
    ihdr = struct.pack(">IIBBBBB", size, size, 8, 2, 0, 0, 0)  # 8-bit, RGB
    return sig + chunk(b"IHDR", ihdr) + chunk(b"IDAT", comp) + chunk(b"IEND", b"")


def make_image(product, workdir):
    """Generate a labeled product image and save it locally. Returns file path."""
    color = product.get("color", "4CAF50")
    rgb = _hex_to_rgb(color)
    path = os.path.join(workdir, product["name"].replace(" ", "_") + ".png")

    # Preferred: a nice labeled image using Pillow (if installed).
    try:
        from PIL import Image, ImageDraw, ImageFont
        import textwrap

        img = Image.new("RGB", (600, 600), rgb)
        draw = ImageDraw.Draw(img)
        try:
            font = ImageFont.truetype("DejaVuSans-Bold.ttf", 40)
            small = ImageFont.truetype("DejaVuSans.ttf", 26)
        except Exception:
            font = ImageFont.load_default()
            small = font
        lines = textwrap.wrap(product["name"], width=14)
        y = 230 - (len(lines) * 25)
        for line in lines:
            w = draw.textlength(line, font=font)
            draw.text(((600 - w) / 2, y), line, fill="white", font=font)
            y += 50
        cat = product.get("category", "").upper()
        w = draw.textlength(cat, font=small)
        draw.text(((600 - w) / 2, 420), cat, fill="white", font=small)
        img.save(path)
        return path
    except Exception:
        pass

    # Fallback: pure-Python solid color PNG (no deps, offline).
    with open(path, "wb") as f:
        f.write(_solid_png(rgb))
    return path


def add_product(base_url, token, product, image_path):
    url = base_url + ADD_PRODUCT_ENDPOINT
    headers = {"Authorization": f"Bearer {token}", **NGROK_HEADERS}
    fields = {
        "name": product["name"],
        "price": str(product["price"]),
        "description": product["description"],
        "tags": product["tags"],
    }
    with open(image_path, "rb") as fh:
        img_bytes = fh.read()
    fname = os.path.basename(image_path)
    # 'image' = main image, 'images' = gallery (repeated field for a list)
    files = [
        ("image", (fname, img_bytes, "image/png")),
        ("images", (fname, img_bytes, "image/png")),
    ]
    resp = requests.post(url, data=fields, files=files, headers=headers, timeout=60)
    resp.raise_for_status()
    return resp


def main():
    ap = argparse.ArgumentParser(description="Seed the store with plant medicines.")
    ap.add_argument("--base-url", required=True, help="Server URL ending with / (e.g. https://xxxx.ngrok-free.app/)")
    ap.add_argument("--email", required=True, help="Login email")
    ap.add_argument("--password", required=True, help="Login password")
    ap.add_argument("--products", default=os.path.join(os.path.dirname(__file__), "products.json"))
    args = ap.parse_args()

    base_url = args.base_url if args.base_url.endswith("/") else args.base_url + "/"

    with open(args.products, encoding="utf-8") as f:
        products = json.load(f)

    token = login(base_url, args.email, args.password)

    workdir = tempfile.mkdtemp(prefix="seed_imgs_")
    ok, failed = 0, 0
    for i, product in enumerate(products, 1):
        try:
            print(f"[{i}/{len(products)}] {product['name']} ...", end=" ")
            image_path = make_image(product, workdir)
            add_product(base_url, token, product, image_path)
            print("uploaded.")
            ok += 1
        except requests.HTTPError as e:
            failed += 1
            print(f"FAILED ({e.response.status_code}): {e.response.text[:200]}")
        except Exception as e:  # noqa: BLE001
            failed += 1
            print(f"FAILED: {e}")

    print(f"\nDone. {ok} uploaded, {failed} failed.")
    if ok:
        print("Open the Store tab in the app (pull to refresh) to see them.")


if __name__ == "__main__":
    main()
