import 'package:paipfood_package/paipfood_package.dart';

class HttpUtils {
  HttpUtils._();

  static Map<String, dynamic> headerUpsert = {
    "Prefer": ["resolution=merge-duplicates", "return=representation"],
  };

  static BaseOptions geoapifyBaseOptions = BaseOptions(baseUrl: "https://api.geoapify.com/");
  static BaseOptions bucketSupabase = BaseOptions(baseUrl: "https://vipwbbuyhszmxdjsclzg.supabase.co/storage/v1/", headers: {
    "Authorization": "Bearer ${Env.supaApiKey}",
    "Content-Type": "application/json",
  });

  static Map<String, dynamic> headerAuth(AuthModel auth) => {
        "Authorization": "Bearer ${auth.accessToken}",
      };

  static Map<String, dynamic> headerUpsertAuth(AuthModel auth) => {
        "Authorization": "Bearer ${auth.accessToken}",
        "Prefer": ["resolution=merge-duplicates", "return=representation"],
      };

  static String filterVisible(bool visible) => "&visible=eq.$visible";
  static String queryIsDeleted(bool isDeleted) => "is_deleted=eq.$isDeleted";
}
