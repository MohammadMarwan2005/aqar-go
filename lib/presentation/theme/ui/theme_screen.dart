import 'package:aqar_go/presentation/lang/app_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/theme_cubit.dart';

class ThemeScreen extends StatelessWidget {
  const ThemeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("App Theme".tr(context))),
      body: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          return PopupMenuButton<String>(
            icon: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Icon(state.getIconData(context), size: 32),
                  SizedBox(width: 16),
                  Text(state.getCurrentThemeName(context)),
                  SizedBox(width: 16),
                  Icon(
                    Icons.arrow_drop_down,
                    color: Theme.of(context).colorScheme.primary,
                  )
                ],
              ),
            ),
            itemBuilder:
                (BuildContext context) => <PopupMenuEntry<String>>[
                  PopupMenuItem<String>(
                    value: "light",
                    child: _buildItem(
                      CubitTheme.light.name.tr(context),
                      Icon(Icons.light_mode, color: Colors.amber),
                      context,
                      state.getCurrentTheme() == CubitTheme.light,
                    ),
                  ),
                  PopupMenuItem<String>(
                    value: "dark",
                    child: _buildItem(
                      CubitTheme.dark.name.tr(context),
                      Icon(Icons.dark_mode, color: Colors.blueGrey),
                      context,
                      state.getCurrentTheme() == CubitTheme.dark,
                    ),
                  ),
                  PopupMenuItem<String>(
                    value: "system",
                    child: _buildItem(
                      "System Default".tr(context),
                      const Icon(Icons.settings_suggest, color: Colors.green),
                      context,
                      state.getCurrentTheme() == null,
                    ),
                  ),
                ],
            onSelected: (String value) {
              final toParseValue = value == "system" ? null : value;
              final theme = ThemeCubit.parse(toParseValue);
              context.read<ThemeCubit>().emitAndSaveTheme(theme);
            },
          );
        },
      ),
    );
  }

  Widget _buildItem(
    String title,
    Icon icon,
    BuildContext context,
    bool isSelected,
  ) {
    return Row(
      children: [
        icon,
        SizedBox(width: 12),
        Text(title),
        if (isSelected) ...[Spacer(), Icon(Icons.check, color: icon.color)],
      ],
    );
  }
}
