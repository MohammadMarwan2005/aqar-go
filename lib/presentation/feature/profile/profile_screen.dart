import 'package:aqar_go/common/helpers/ui_helper.dart';
import 'package:aqar_go/presentation/lang/app_localization.dart';
import 'package:aqar_go/presentation/widgets/error_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/model/profile/user_profile.dart';
import '../../widgets/loading_screen.dart';
import '../../widgets/screen_horizontal_padding.dart';
import 'cubit/profile_cubit.dart';
import 'widgets/profile_content.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Profile".tr(context))),
      body: SafeArea(
        child: SingleChildScrollView(
          child: ScreenPadding(
            child: BlocBuilder<ProfileCubit, ProfileState>(
              builder: (context, state) {
                return state.when(
                  loading: () {
                    return LoadingScreen();
                  },
                  error: (domainError) {
                    return ErrorMessage(
                      error: domainError,
                      onTryAgain: () {
                        context.read<ProfileCubit>().fetchProfile();
                      },
                    );
                  },
                  success: (profile) {
                    return ProfileContent(userProfile: profile);
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

