part of 'telegram_link_cubit.dart';

@freezed
class TelegramLinkState with _$TelegramLinkState {
  const factory TelegramLinkState.loading() = _Loading;

  const factory TelegramLinkState.success({required AqarGoLinks links}) = _Success;

  const factory TelegramLinkState.error({required DomainError error}) = _Error;
}

extension TelegramLinkStateExtension on TelegramLinkState {
  AqarGoLinks getLink() {
    if (this is _Success) return (this as _Success).links;
    return AqarGoLinks(telegram: getTelegramUrl("aqargo"), github: getGithubRepoLink("MohammadMarwan2005", "aqar-go"));
  }
}
