import 'package:aqar_go/presentation/lang/app_localization.dart';
import 'package:aqar_go/presentation/lang/cubit/lang_cubit.dart';
import 'package:aqar_go/presentation/routing/app_router.dart';
import 'package:aqar_go/presentation/theme/cubit/theme_cubit.dart';
import 'package:aqar_go/presentation/theme/dark_blue_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'common/di/get_it.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LangCubit>(create: (context) => getIt()),
        BlocProvider<ThemeCubit>(create: (context) => ThemeCubit(getIt())),
      ],
      child: BlocBuilder<LangCubit, LangState>(
        builder: (langCubitContext, langState) {
          return langState.when(
            initial: () => _LoadingApp(),
            success: (lang) {
              return BlocBuilder<ThemeCubit, ThemeState>(
                builder: (context, themeState) {
                  return themeState.when(
                    initial: () => _LoadingApp(),
                    success: (theme) {
                      return MaterialApp.router(
                        locale: (lang != null) ? Locale(lang) : null,
                        supportedLocales: const [Locale('en'), Locale('ar')],
                        localizationsDelegates: const [
                          AppLocalizations.delegate,
                          GlobalMaterialLocalizations.delegate,
                          GlobalWidgetsLocalizations.delegate,
                          GlobalCupertinoLocalizations.delegate,
                        ],
                        title: "AqarGo",
                        theme: theme?.getThemeData() ?? DarkBlueTheme.light(),
                        darkTheme: theme?.getThemeData() ?? DarkBlueTheme.dark(),
                        debugShowCheckedModeBanner: false,
                        routerConfig: appRouter,
                        localeResolutionCallback: (
                          deviceLocale,
                          supportedLocales,
                        ) {
                          for (var locale in supportedLocales) {
                            if (deviceLocale != null &&
                                deviceLocale.languageCode ==
                                    locale.languageCode) {
                              return deviceLocale;
                            }
                          }
                          return supportedLocales.first;
                        },
                      );
                    },
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}

class _LoadingApp extends StatelessWidget {
  const _LoadingApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(body: Center(child: CircularProgressIndicator())),
    );
  }
}
