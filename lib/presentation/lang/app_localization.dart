import 'package:aqar_go/domain/model/domain_error.dart';

import '../../common/helpers/logging_helper.dart';
import 'package:flutter/cupertino.dart';

part 'strings/ar_lang_map.dart';
part 'strings/en_lang_map.dart';

class AppLocalizations {
  final Locale? locale;

  AppLocalizations({
    this.locale,
  });

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
  _AppLocalizationsDelegate();

  late Map<String, String> _localizedStrings;

  Future loadLanguage() async {
    Map<String, String> langMap = {};
    switch(locale!.languageCode) {
      case "en":
        langMap = _enLangMap;
        break;
      case "ar":
        langMap = _arLangMap;
        break;
      default:
        langMap = _arLangMap;
        break;
    }
    _localizedStrings = langMap;
    debugLog(_localizedStrings.toString());
  }
  String translate(String key, {Map<String, String>? params}) {
    String? template = _localizedStrings[key];
    if (template == null) return key;

    if (params != null) {
      params.forEach((paramKey, value) {
        template = template!.replaceAll('{$paramKey}', value);
      });
    }

    return template!;
  }
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en', 'ar'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    AppLocalizations localizations = AppLocalizations(locale: locale);
    await localizations.loadLanguage();
    return localizations;
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<AppLocalizations> old) =>
      false;
}

extension TranslateX on String {
  String tr(BuildContext context, {Map<String, String>? params}) {
    return AppLocalizations.of(context)?.translate(this, params: params) ?? this;
  }
}