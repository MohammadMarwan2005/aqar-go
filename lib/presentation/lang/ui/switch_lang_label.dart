import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/lang_cubit.dart';

class SwitchLangLabel extends StatelessWidget {
  const SwitchLangLabel({super.key});

  final disableLanguages = false;

  @override
  Widget build(BuildContext context) {
    if (disableLanguages) return const SizedBox.shrink();

    return BlocBuilder<LangCubit, LangState>(
      builder: (context, state) {
        if (state is LangLoaded) {
          return Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              OutlinedButton(
                  onPressed: () {
                    context.read<LangCubit>().toggleLang(context);
                  },
                  child: Text(state.getLabel())),
            ],
          );
        } else {
          return const SizedBox();
        }
      },
    );

  }
}
