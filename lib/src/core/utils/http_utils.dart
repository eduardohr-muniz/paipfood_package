import 'package:paipfood_package/paipfood_package.dart';

class HttpUtils {
  HttpUtils._();

  static Map<String, dynamic> headerUpsert = {
    "Prefer": ["resolution=merge-duplicates", "return=representation"],
  };
  static Map<String, dynamic> headerAuth(AuthModel auth) => {
        "Authorization": "Bearer ${auth.accessToken}",
      };

  static Map<String, dynamic> headerUpsertAuth(AuthModel auth) => {
        "Authorization": "Bearer ${auth.accessToken}",
        "Prefer": ["resolution=merge-duplicates", "return=representation"],
      };

  static String filterVisible(bool visible) => "&visible=eq.$visible";
}
