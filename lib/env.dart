import 'package:paipfood_package/paipfood_dependencies.dart';

class Env {
  static Future<void> init() async => await dotenv.load();
  static String get passwordDefault => _get('PASSWORD_DEFAULT');
  static String get supaApiKey => _get('SUPA_API_KEY');
  static String get supaBaseUrl => _get('SUPA_BASE_URL');
  static String get geoapifyBaseUrl => _get('GEOAPIFY_BASE_URL');
  static String get geoapifyApiKey => _get('GEOAPIFY_API_KEY');
  static String get mapboxlight => _get('MAPBOX_LIGHT');
  static String get mapboxDark => _get('MAPBOX_DARK');
  static String get mapboxApiKey => _get('MAPBOX_API_KEY');

  static String _get(String name) => dotenv.env[name] ?? '';

  // static String passwordDefault = const String.fromEnvironment('PASSWORD_DEFAULT');

  // static String supaApiKey = const String.fromEnvironment('SUPA_API_KEY');

  // static String supaBaseUrl = const String.fromEnvironment('SUPA_BASE_URL');

  // static String geoapifyBaseUrl = const String.fromEnvironment('GEOAPIFY_BASE_URL');

  // static String geoapifyApiKey = const String.fromEnvironment('GEOAPIFY_API_KEY');

  // static String mapboxlight = const String.fromEnvironment('MAPBOX_LIGHT');

  // static String mapboxDark = const String.fromEnvironment('MAPBOX_DARK');

  // static String mapboxApiKey = const String.fromEnvironment('MAPBOX_API_KEY');
}
