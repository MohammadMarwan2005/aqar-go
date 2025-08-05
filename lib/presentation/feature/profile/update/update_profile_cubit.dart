import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/repo/auth_repo.dart';
import '../../../../domain/model/media_file.dart';
import '../../../../domain/model/profile/user_profile.dart';
import '../../../../domain/model/resource.dart';
import '../profile_state/profile_state.dart';

class UpdateProfileCubit extends Cubit<ProfileState> {
  final AuthRepo _authRepo;
  UserProfile? cachedProfile;

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();

  UpdateProfileCubit(this._authRepo) : super(const ProfileState.loading()) {
    fetchProfile();
  }

  fetchProfile() async {
    emit(ProfileState.loading());
    final response = await _authRepo.getProfile();
    handleProfileResponse(response, cacheProfile: true);
  }

  updateProfile(MediaFile? imageToUpload) async {
    emit(ProfileState.loading());
    final response = await _authRepo.updateProfile(
      UserProfile(
        firstName: firstNameController.text,
        lastName: lastNameController.text,
        phoneNumber: phoneNumberController.text,
        imageUrl: "not important",
        userId: 0,
        isVerified: false,
        isPremium: false,
      ),
      imageToUpload,
    );
    handleProfileResponse(response);
  }

  handleProfileResponse(
    Resource<UserProfile> response, {
    bool cacheProfile = false,
  }) {
    response.when(
      onSuccess: (successData) {
        if (cacheProfile) {
          cachedProfile = successData;
        }
        fillForm(successData);
        emit(ProfileState.success(successData));
      },
      onError: (error) {
        emit(ProfileState.error(error));
      },
    );
  }

  fillForm(UserProfile profile) {
    firstNameController.text = profile.firstName;
    lastNameController.text = profile.lastName;
    phoneNumberController.text = profile.phoneNumber;
  }

  removeError() {
    if (cachedProfile != null) {
      emit(ProfileState.success(cachedProfile!));
    } else {
      fetchProfile();
    }
  }
}
