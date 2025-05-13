import 'package:bloc/bloc.dart';
import '../../common/helpers/logging_helper.dart';
import 'package:flutter/cupertino.dart';

import '../../data/repo/local_data_repo.dart';
import 'lang_state.dart';


class LangCubit extends Cubit<LangState> {
  final LocalDataRepo _userDataRepo;

  LangCubit(this._userDataRepo) : super(const LangState.initial()) {
    debugLog('LangCubit : Creation...');
    getSavedLang();
  }

  getSavedLang() {
    final currentLang = _userDataRepo.getString(DataAccessKeys.langCodeKey);
    emit(LangState.loaded(lang: currentLang ?? "ar"));
  }

  toggleLang(BuildContext context) {
    final currentLang = getCurrentLang(context);
    var value = "en";
    if (currentLang == "en") value = "ar";
    _userDataRepo.setString(value, DataAccessKeys.langCodeKey);
    emit(LangState.loaded(lang: value));
  }

  String getCurrentLang(BuildContext context) {
    String deviceLang = Localizations.localeOf(context).languageCode;
    final currentLang = _userDataRepo.getString(DataAccessKeys.langCodeKey) ?? deviceLang;
    return currentLang;
  }
}
