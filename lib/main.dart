import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:news/core/utils/app_routes.dart';
import 'package:news/core/utils/app_theme.dart';
import 'package:news/home/category_details/category_details.dart';
import 'package:news/home/home_page.dart';
import 'package:news/providers/theme_provider.dart';
import 'package:news/translations/codegen_loader.g.dart';
import 'package:provider/provider.dart';
import 'package:timeago/timeago.dart' as timeago;
// flutter pub run easy_localization:generate -S "assets/translations" -O "lib/translations"
// flutter pub run easy_localization:generate -S "assets/translations" -O "lib/translations" -o "locale_keys.g.dart" -f keys
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  timeago.setLocaleMessages("en", timeago.EnMessages());
  timeago.setLocaleMessages("ar", timeago.ArMessages());
  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ar')],
      path: 'assets/translations',
      fallbackLocale: const Locale('en'),
      assetLoader: CodegenLoader(),
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ],
        child: MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeProvider.appTheme,
      routes: {
        AppRoutes.categoryDetailsScreen:(context) => CategoryDetails(),
        AppRoutes.homeScreen:(context) => HomePage(),
      },
      initialRoute: AppRoutes.homeScreen,
    );
  }
}
