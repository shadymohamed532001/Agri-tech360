# مستند تسليم للمطور (Mobile / Flutter)

مشروع: **SmartSoil – Agri-tech360**
الموضوع: (1) إصلاح ظهور الصور  (2) إضافة أدوية علاج أمراض النباتات للـ Store

---

## 1) إصلاح مشكلة الصور (Image URLs)

### المشكلة
الكود كان بيركّب لينك الصورة كده: `'$baseUrl${plant.image}'`.
لكن الـ API بقى يرجّع **لينك كامل** (مثال: `https://images.pexels.com/...`).
فالنتيجة كانت لينك غلط: `https://...ngrok.../https://images.pexels.com/...` ← الصورة مبتظهرش.

### الحل
أضفنا helper مشترك بيقرّر: لو اللينك بيبدأ بـ `http` يستخدمه زي ما هو، غير كده يضيف `baseUrl`.

**ملف جديد:** `lib/core/helper/image_url_helper.dart`
```dart
String resolveImageUrl(String? path) {
  if (path == null || path.isEmpty) return '';
  if (path.startsWith('http://') || path.startsWith('https://')) return path;
  return '$baseUrl$path';
}
```

### Getters اتضافت للموديلات
- `lib/Feature/explor/data/models/explor_plant_models.dart` → `imageUrl1` / `imageUrl2`
- `lib/Feature/store/data/models/store_product_model.dart` → `imageUrl` / `imageUrls`

### الملفات اللي اتعدّلت (بقت تستخدم الـ getters بدل `'$baseUrl...'`)
| الملف | قبل | بعد |
|------|------|------|
| `core/widgets/popular_card.dart` | `'$baseUrl${plant.plantImage_1}'` | `plant.imageUrl1` |
| `Feature/explor/.../custom_explor_card.dart` | `'$baseUrl${plant.plantImage_1}'` | `plant.imageUrl1` |
| `Feature/details/widgets/plant_details_view_body.dart` | `'$baseUrl${plant.plantImage_1}'` | `plant.imageUrl1` |
| `Feature/details/widgets/information_sliver_app_bar.dart` | `'$baseUrl${plant.plantImage_2}'` | `plant.imageUrl2` |
| `Feature/store/presentation/widgets/traidment_card.dart` | `'$baseUrl${productModel.image}'` | `productModel.imageUrl` |
| `Feature/details/widgets/product_image_slider.dart` | `'$baseUrl${productModel.images[i]}'` | `productModel.imageUrls[i]` |
| `Feature/details/widgets/rating_and_description.dart` | `'$baseUrl${...images[index]}'` | `productModel.imageUrls[index]` |
| `Feature/checkout/.../product_card.dart` | `'$baseUrl${storeProductModel.image}'` | `storeProductModel.imageUrl` |

> ملاحظة: شِلنا import الـ `end_boint.dart` من الملفات اللي مابقتش تستخدم `baseUrl`.
> **مفيش تغيير في:** favorites / classification / recommend-crop (موديلات مختلفة، نفس الإصلاح يتعمل لو احتجنا).

### للتأكد
```
flutter pub get
flutter analyze
flutter run
```

---

## 2) إضافة الأدوية للـ Store

الـ Store بياخد المنتجات من السيرفر (`GET /products`) وبيضيف عن طريق (`POST /add-product`) برفع صور (multipart).
عشان كده ضفنا **سكريبت رفع** جاهز بدل ما ندخل كل منتج يدوي من التطبيق.

### الملفات
- `products.json` — 12 منتج في 4 فئات (فطرية / حشرية / بكتيرية / أسمدة ومنشطات).
- `upload_medicines.py` — لوجين → توكن → يولّد صورة لكل منتج → يرفعه.

### تفاصيل الـ API المستخدمة (متطابقة مع الكود)
- `POST login` → multipart فيه `email`, `password` → التوكن في `data.token`.
- `POST add-product` → multipart فيه: `name`, `price`, `description`, `tags`, `image` (ملف رئيسي), `images` (معرض، متكرر).
- Header مهم: `ngrok-skip-browser-warning: true`، و `Authorization: Bearer <token>`.

### خطوات التشغيل
1. شغّل السيرفر + ngrok، وخُد الرابط الجديد (لازم ينتهي بـ `/`).
2. حدّث نفس الرابط في `lib/core/networking/end_boint.dart` (سطر `baseUrl`).
3. ```
   pip install requests        # و اختياري: pip install Pillow
   python upload_medicines.py --base-url https://NEW-URL.ngrok-free.app/ --email EMAIL --password PASS
   ```
4. افتح تبويب الـ Store واعمل refresh.

---

## مفتوح / محتاج إجراء
- **السيرفر (ngrok) كان مقفول وقت التسليم** → لازم يتشغّل علشان الرفع يتم.
- رابط ngrok المجاني بيتغير كل تشغيل → لازم يتحدّث في `end_boint.dart` كل مرة.
- لو السيرفر رجّع **422** عند الرفع → الحقول المطلوبة مختلفة؛ يتشاف رد السيرفر ويتظبط `fields`/`files` في السكريبت.
