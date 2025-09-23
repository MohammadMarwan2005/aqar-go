import 'package:aqar_go/presentation/helper/url_helper.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../data/model/links/aqar_go_links.dart';

import '../../../domain/model/domain_error.dart';
import '../../../domain/repo/contact_repo.dart';

part 'telegram_link_cubit.freezed.dart';
part 'telegram_link_state.dart';

class TelegramLinkCubit extends Cubit<TelegramLinkState> {
  final ContactRepo _contactRepo;

  TelegramLinkCubit(this._contactRepo)
    : super(const TelegramLinkState.loading()) {
    fetchLink();
  }

  fetchLink() async {
    emit(const TelegramLinkState.loading());
    final result = await _contactRepo.getAqarGoLinks();
    result.when(
      onSuccess: (successData) {
        emit(TelegramLinkState.success(links: successData));
      },
      onError: (error) {
        emit(TelegramLinkState.error(error: error));
      },
    );
  }
}
