import 'package:smartsoil/core/networking/end_boint.dart';

/// Resolves an image path coming from the API into a usable URL.
///
/// If the value is already a full URL (starts with `http://` or `https://`)
/// it is returned unchanged. Otherwise [baseUrl] is prepended, which is the
/// behaviour the app relies on for images served from its own backend.
String resolveImageUrl(String? path) {
  if (path == null || path.isEmpty) return '';
  if (path.startsWith('http://') || path.startsWith('https://')) {
    return path;
  }
  return '$baseUrl$path';
}
