import 'package:aqar_go/presentation/feature/profile/update/update_profile_cubit.dart';
import 'package:aqar_go/presentation/lang/app_localization.dart';
import 'package:aqar_go/presentation/widgets/app_button.dart';
import 'package:aqar_go/presentation/widgets/app_text_field.dart';
import 'package:aqar_go/presentation/widgets/screen_horizontal_padding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../widgets/error_message.dart';
import '../../../widgets/loading_screen.dart';
import '../../media_picker/media_picker_cubit.dart';
import '../profile_state/profile_state.dart';
import '../show/profile_cubit.dart';
import '../widgets/profile_avatar.dart';

class UpdateProfileScreen extends StatelessWidget {
  const UpdateProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final updateProfileCubit = context.read<UpdateProfileCubit>();
    final profileCubit = context.read<ProfileCubit>();
    final mediaPickerCubit = context.read<MediaPickerCubit>();
    return Scaffold(
      appBar: AppBar(title: Text("Update Profile".tr(context))),
      body: SafeArea(
        child: ScreenPadding(
          child: BlocConsumer<UpdateProfileCubit, ProfileState>(
            listener: (context, state) {
              return state.when(
                loading: () {},
                error: (domainError) {},
                success: (profile) {
                  profileCubit.fetchProfile();
                },
              );
            },
            builder: (context, state) {
              return state.when(
                loading: () => const LoadingScreen(),
                error:
                    (domainError) => ErrorMessage(
                      error: domainError,
                      detailsWidget:
                          (details) => Column(
                            children: details.map((e) => Text(e)).toList(),
                          ),
                      onTryAgain: () {
                        updateProfileCubit.removeError();
                      },
                    ),
                success: (profile) {
                  return SingleChildScrollView(
                    child: Column(
                      children: [
                        BlocBuilder<MediaPickerCubit, MediaPickerState>(
                          builder: (
                            BuildContext context,
                            MediaPickerState mediaPickerState,
                          ) {
                            return ProfileAvatar(
                              onEditPressed: () {
                                mediaPickerCubit.pickImage(keepOld: false);
                              },
                              isPremium: profile.isPremium,
                              imageUrl: profile.imageUrl,
                              pickedImagePath:
                                  mediaPickerState.files.firstOrNull?.path,
                            );
                          },
                        ),
                        _LocalizedSizedBox(),
                        AppTextField(
                          labelText: "First Name".tr(context),
                          textEditingController:
                              updateProfileCubit.firstNameController,
                        ),
                        _LocalizedSizedBox(),
                        AppTextField(
                          labelText: "Last Name".tr(context),
                          textEditingController:
                              updateProfileCubit.lastNameController,
                        ),
                        _LocalizedSizedBox(),
                        AppTextField(
                          labelText: "Phone Number".tr(context),
                          textEditingController:
                              updateProfileCubit.phoneNumberController,
                        ),
                        _LocalizedSizedBox(),
                        _LocalizedSizedBox(),
                        AppButton(
                          onPressed: () {
                            updateProfileCubit.updateProfile(
                              mediaPickerCubit.state.files.firstOrNull,
                            );
                          },
                          text: "Update".tr(context),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}

class _LocalizedSizedBox extends StatelessWidget {
  const _LocalizedSizedBox({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: 16);
  }
}
