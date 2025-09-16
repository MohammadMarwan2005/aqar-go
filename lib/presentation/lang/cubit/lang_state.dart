part of 'lang_cubit.dart';

@freezed
sealed class LangState with _$LangState {
  const factory LangState.initial() = LangInitial;

  const factory LangState.loaded({required String? lang}) = LangLoaded;
}

extension LangLoadedX on LangLoaded {
  String getLabel(BuildContext context) {
    if (lang == "en") return "العربية";
    if(lang == "ar") return "English";
    return "Switch Language".tr(context);
  }

  R when<R>({required R Function() initial, required R Function() loaded}) {
    switch (this) {
      case LangInitial():
        return initial();
      case LangLoaded():
        return loaded();
    }
  }
}

extension LangStateX on LangState {
  R when<R>({
    required R Function() initial,
    required R Function(String? lang) success,
  }) {
    return switch (this) {
      LangInitial() => initial(),
      LangLoaded(:final lang) => success(lang),
    };
  }

  String? getCurrentLangCodeAsString() {
    return switch (this) {
      LangInitial() => null,
      LangLoaded(:final lang) => lang,
    };
  }

  String getCurrentLangName(BuildContext context) {
    final currentLang = getCurrentLangCodeAsString();
    if(currentLang == null) return "System Default".tr(context);
    return switch (currentLang) {
      "en" => "English",
      "ar" => "العربية",
      String() => "Unknown Language",
    };
  }
}
