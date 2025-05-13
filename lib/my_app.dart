import 'package:aqar_go/common/helpers/logging_helper.dart';
import 'package:aqar_go/presentation/lang/app_localization.dart';
import 'package:aqar_go/presentation/lang/lang_cubit.dart';
import 'package:aqar_go/presentation/lang/lang_state.dart';
import 'package:aqar_go/presentation/routing/app_router.dart';
import 'package:aqar_go/presentation/theme/dark_blue_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'common/di/get_it.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider<LangCubit>(create: (context) => getIt())],
      child: BlocBuilder<LangCubit, LangState>(
        builder: (context, langState) {
          if (langState is LangLoaded) {
            return MaterialApp.router(
              locale: Locale(langState.lang),
              supportedLocales: const [Locale('en'), Locale('ar')],
              localizationsDelegates: const [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              title: "AqarGo",
              theme: DarkBlueTheme.light(),
              darkTheme: DarkBlueTheme.dark(),
              debugShowCheckedModeBanner: false,
              routerConfig: appRouter,
              localeResolutionCallback: (deviceLocale, supportedLocales) {
                for (var locale in supportedLocales) {
                  if (deviceLocale != null &&
                      deviceLocale.languageCode == locale.languageCode) {
                    return deviceLocale;
                  }
                }
                return supportedLocales.first;
              },
            );
          } else {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              home: Scaffold(body: Center(child: CircularProgressIndicator())),
            );
          }
        },
      ),
    );
  }
}
