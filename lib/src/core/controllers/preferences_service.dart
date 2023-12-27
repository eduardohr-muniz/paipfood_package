import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:paipfood_package/paipfood_package.dart';

class PreferencesService extends ChangeNotifier {
  final LocalStorage localStorage;
  PreferencesService(this.localStorage) {
    _getPreferences();
  }

  ThemeMode? themeMode = ThemeMode.system;
  Locale? currentLocale;
  PreferencesModel model = PreferencesModel(id: '');
  static String boxAndKey = "prefs";

  void changeTheme(bool isDarkTheme) {
    model = model.copyWith(isDarkMode: isDarkTheme);
    themeMode = getThemeMode;
    _savePrefs();
    notifyListeners();
  }

  Future<void> _changeMap(String languageCode) async {
    Intl.defaultLocale = languageCode;
    final String fileText = await rootBundle.loadString("lib/l10n/app_$languageCode.arb");
    mapI18n = jsonDecode(fileText);
  }

  void changeLocale(Locale locale) {
    model = model.copyWith(languageCode: locale.languageCode, countryCode: locale.countryCode);
    _changeMap(model.languageCode ?? Intl.systemLocale);
    currentLocale = locale;

    _savePrefs();
    notifyListeners();
  }

  void saveAuthModel(AuthModel authModel) {
    model = model.copyWith(authModel: authModel);
    _savePrefs();
  }

  void logOut() {
    model = model.copyWith(authModel: AuthModel());
    _savePrefs();
  }

  void _getPreferences() async {
    await localStorage.openBox(boxAndKey);
    final json = await localStorage.get(boxAndKey, key: boxAndKey);

    if (json != null) {
      model = PreferencesModel.fromJson(json);
      await _changeMap(model.languageCode ?? Intl.systemLocale);
      if (model.languageCode != null) currentLocale = Locale(model.languageCode!, model.countryCode);
      if (model.isDarkMode != null) themeMode = getThemeMode;
      if (model.authModel != null) auth_ = model.authModel!;
      notifyListeners();
    }
  }

  ThemeMode get getThemeMode => model.isDarkMode! ? ThemeMode.dark : ThemeMode.light;
  void _savePrefs() {
    localStorage.put(boxAndKey, key: boxAndKey, value: model.toJson());
  }
}
