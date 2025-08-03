import 'package:freezed_annotation/freezed_annotation.dart';

part 'lang_state.freezed.dart';

@freezed
sealed class LangState with _$LangState {
  const factory LangState.initial() = LangInitial;
  const factory LangState.loaded({required String lang}) = LangLoaded;
}

extension LangLoadedX on LangLoaded {
  String getLabel() {
    if (lang == null || lang == "en") return "العربية";
    return "English";
  }

  R when<R>({
    required R Function() initial,
    required R Function() loaded,
  }) {
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
    required R Function(String lang) success,
  }) {
    return switch (this) {
      LangInitial() => initial(),
      LangLoaded(:final lang) => success(lang),
    };
  }
}
