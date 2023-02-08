// ignore_for_file: depend_on_referenced_packages
import 'package:flutter/material.dart';
import 'package:pos/configs/app_config.dart';
import 'package:pos/configs/route.dart';
import 'package:pos/providers/language_provider.dart';
import 'package:pos/providers/theme_provider.dart';
import 'package:pos/views/pages/vocabulary/vocabulary_category_page.dart';
import 'package:provider/provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:page_transition/page_transition.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
        startLocale: AppConfig.defaultLocale,
        supportedLocales: AppConfig.localesSupport,
        path: 'assets/translations',
        fallbackLocale: AppConfig.defaultLocale,
        useOnlyLangCode: true,
        child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        ChangeNotifierProvider(create: (context) => LanguageProvider()),
      ],
      builder: (context, _) {
        // auto get theme provider from shared preferences
        final themeProvider = Provider.of<ThemeProvider>(context);
        final languageProvider = Provider.of<LanguageProvider>(context);
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'POS APP',
          themeMode: themeProvider.themeMode,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: languageProvider.currentLanguage,
          onGenerateRoute: (settings) {
            var route = routes[settings.name];
            var arguments = settings.arguments;

            switch (settings.name) {
              // details add arguments in here
              case '/vocabulary/category':
                return PageTransition(
                  child: VocabularyCategoryPage(arguments: arguments),
                  type: route['transition'],
                  alignment: route['alignment'],
                  childCurrent: VocabularyCategoryPage(arguments: arguments),
                  settings: settings,
                  duration: Duration(
                    milliseconds: route['duration'],
                  ),
                );
              // default just return not arguments
              default:
                return PageTransition(
                  child: route['route_path'],
                  type: route['transition'],
                  alignment: route['alignment'],
                  childCurrent: route['route_path'],
                  settings: settings,
                  duration: Duration(
                    milliseconds: route['duration'],
                  ),
                );
            }
          },
        );
      },
    );
  }
}
