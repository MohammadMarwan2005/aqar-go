part of 'telegram_link_cubit.dart';

@freezed
class TelegramLinkState with _$TelegramLinkState {
  const factory TelegramLinkState.loading() = _Loading;

  const factory TelegramLinkState.success({required String link}) = _Success;

  const factory TelegramLinkState.error({required DomainError error}) = _Error;
}

extension TelegramLinkStateExtension on TelegramLinkState {
  String getLink() {
    if (this is _Success) return (this as _Success).link;
    return getTelegramUrl("aqargo");
  }
}
