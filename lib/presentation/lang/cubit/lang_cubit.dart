import 'package:aqar_go/presentation/lang/app_localization.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../common/helpers/logging_helper.dart';
import '../../../data/repo/local_data_repo.dart';

part 'lang_cubit.freezed.dart';
part 'lang_state.dart';



class LangCubit extends Cubit<LangState> {
  final LocalDataRepo _userDataRepo;

  LangCubit(this._userDataRepo) : super(const LangState.initial()) {
    debugLog('LangCubit : Creation...');
    loadLang();
  }


  loadLang() async {
    // en, ar, null
    final result = getSavedLang();
    emit(LangState.loaded(lang: result));
  }

  String? getSavedLang() {
    return _userDataRepo.getString(DataAccessKeys.langCodeKey);
  }

  toggleLang(BuildContext context) {
    final currentLang = getCurrentLang(context);
    var value = currentLang;
    if (currentLang == "en") value = "ar";
    if(currentLang == "ar") value = "en";
    _saveAndEmitLang(value);
  }

  _saveAndEmitLang(String? langCode) {
    if(langCode == null) {
      _userDataRepo.removeString(DataAccessKeys.langCodeKey);
    } else {
      _userDataRepo.setString(langCode, DataAccessKeys.langCodeKey);
    }
    emit(LangState.loaded(lang: langCode));
  }

  emitLanguage(String? langCode) {
    _saveAndEmitLang(langCode);
  }

  String getCurrentLang(BuildContext context) {
    String deviceLang = deviceLocale(context);
    final currentLang = getSavedLang() ?? deviceLang;
    return currentLang;
  }

  static String deviceLocale(BuildContext context) {
    return Localizations.localeOf(context).languageCode;
  }
}
