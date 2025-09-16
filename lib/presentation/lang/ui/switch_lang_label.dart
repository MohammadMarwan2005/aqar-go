import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/lang_cubit.dart';

class SwitchLangLabel extends StatelessWidget {
  const SwitchLangLabel({super.key});

  @override
  Widget build(BuildContext context) {
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
                  child: Text(state.getLabel(context))),
            ],
          );
        } else {
          return const SizedBox();
        }
      },
    );

  }
}
