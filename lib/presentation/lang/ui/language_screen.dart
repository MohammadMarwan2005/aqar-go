import 'package:aqar_go/presentation/lang/app_localization.dart';
import 'package:aqar_go/presentation/widgets/screen_horizontal_padding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/lang_cubit.dart';

class LanguageScreen extends StatelessWidget {
  const LanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("App Language".tr(context))),
      body: SafeArea(
        child: ScreenPadding(
          child: BlocBuilder<LangCubit, LangState>(
            builder: (context, state) {
              return PopupMenuButton<String>(
                icon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Icon(Icons.language, size: 32),
                      SizedBox(width: 16),
                      Text(state.getCurrentLangName(context)),
                      SizedBox(width: 16),
                      Icon(
                        Icons.arrow_drop_down,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ],
                  ),
                ),
                itemBuilder:
                    (BuildContext context) => <PopupMenuEntry<String>>[
                      PopupMenuItem<String>(
                        value: "ar",
                        child: _buildItem(
                          "Arabic".tr(context),
                          context,
                          state.getCurrentLangCodeAsString() == "ar",
                        ),
                      ),
                      PopupMenuItem<String>(
                        value: "en",
                        child: _buildItem(
                          "English".tr(context),
                          context,
                          state.getCurrentLangCodeAsString() == "en",
                        ),
                      ),
                      PopupMenuItem<String>(
                        value: "system",
                        child: _buildItem(
                          "System Default".tr(context),
                          context,
                          state.getCurrentLangCodeAsString() == null,
                        ),
                      ),
                    ],
                onSelected: (String value) {
                  final finalValue = value == "system" ? null : value;
                  context.read<LangCubit>().emitLanguage(finalValue);
                },
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildItem(String title, BuildContext context, bool isSelected) {
    return Row(
      children: [
        SizedBox(width: 12),
        Text(title),
        if (isSelected) ...[Spacer(), Icon(Icons.check, color: Colors.green)],
      ],
    );
  }
}
