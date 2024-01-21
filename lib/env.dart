class Env {
  static String passwordDefault = const String.fromEnvironment('PASSWORD_DEFAULT');

  static String supaApiKey = const String.fromEnvironment('SUPA_API_KEY');

  static String supaBaseUrl = const String.fromEnvironment('SUPA_BASE_URL');

  static String geoapifyBaseUrl = const String.fromEnvironment('GEOAPIFY_BASE_URL');

  static String geoapifyApiKey = const String.fromEnvironment('GEOAPIFY_API_KEY');

  static String mapboxlight = const String.fromEnvironment('MAPBOX_LIGHT');

  static String mapboxDark = const String.fromEnvironment('MAPBOX_DARK');

  static String mapboxApiKey = const String.fromEnvironment('MAPBOX_API_KEY');
  static String dataBase = const String.fromEnvironment('DATA_BASE');
}
