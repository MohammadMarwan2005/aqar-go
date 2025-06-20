import 'package:aqar_go/data/repo/local_data_repo.dart';
import 'package:aqar_go/domain/model/domain_error.dart';
import 'package:aqar_go/domain/model/profile/user_profile.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../data/repo/auth_repo.dart';

part 'profile_cubit.freezed.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final LocalDataRepo _localDataRepo;
  final AuthRepo _authRepo;

  ProfileCubit(this._authRepo, this._localDataRepo) : super(const ProfileState.loading()) {
    fetchProfile();
  }

  Future<void> fetchProfile() async {
    emit(ProfileState.loading());
    final response = await _authRepo.getProfile();
    response.when(
      onSuccess: (successData) {
        emit(ProfileState.success(successData));
      },
      onError: (error) {
        emit(ProfileState.error(error));
      },
    );
  }

  void deleteToken() {
    _localDataRepo.deleteToken();
  }
}
