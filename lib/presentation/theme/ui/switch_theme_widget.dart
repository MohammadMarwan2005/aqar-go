import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/theme_cubit.dart';

class SwitchThemeWidget extends StatelessWidget {
  const SwitchThemeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        context.read<ThemeCubit>().switchTheme(context);
      },
      icon: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          return Icon(state.getOppositeIconData(context));
        },
      ),
    );
  }
}
