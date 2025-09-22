import 'package:aqar_go/presentation/helper/url_helper.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/model/domain_error.dart';
import '../../../domain/repo/contact_repo.dart';

part 'telegram_link_cubit.freezed.dart';
part 'telegram_link_state.dart';

class TelegramLinkCubit extends Cubit<TelegramLinkState> {
  final ContactRepo _contactRepo;

  TelegramLinkCubit(this._contactRepo)
    : super(const TelegramLinkState.loading());

  fetchLink() async {
    final result = await _contactRepo.getTelegramLink();
    result.when(
      onSuccess: (successData) {
        emit(TelegramLinkState.success(link: successData));
      },
      onError: (error) {
        emit(TelegramLinkState.error(error: error));
      },
    );
  }
}
