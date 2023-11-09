class Env {
  static String supaBaseUrl = const String.fromEnvironment('SUPA_BASE_URL');
  static String supaApiKey = const String.fromEnvironment('SUPA_API_KEY');
  static String geoapifyBaseUrl = const String.fromEnvironment('GEOAPIFY_BASE_URL');
  static String geoapifyApiKey = const String.fromEnvironment('GEOAPIFY_API_KEY');
  static String mapboxBaseUrl = const String.fromEnvironment('MAPBOX_BASE_URL');
  static String mapboxApiKey = const String.fromEnvironment('MAPBOX_API_KEY');
}
