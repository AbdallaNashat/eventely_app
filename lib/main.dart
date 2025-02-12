import 'package:bot_toast/bot_toast.dart';
import 'package:eventely/core/routes/app_routes.dart';
import 'package:eventely/core/services/loading_services.dart';
import 'package:eventely/core/services/local_storage_services.dart';
import 'package:eventely/core/theme/app_theme_manager.dart';
import 'package:eventely/modules/layout_view/provider_settings.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await LocalStorageServices.init();

  runApp(ChangeNotifierProvider(
    create: (context) => ProviderSettings(),
    child:  MyApp(),
  ));

  configLoading();
}

class MyApp extends StatelessWidget {
   MyApp({super.key});

  ProviderSettings provider = ProviderSettings();

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ProviderSettings>(context);
    return MaterialApp(
      title: 'Evently Time Management',
      debugShowCheckedModeBanner: false,
      theme: AppThemeManager.lightTheme,
      darkTheme: AppThemeManager.darkTheme,
      themeMode: provider.currentTheme,
      onGenerateRoute: AppRoutes.onGeneratedRoute,
      builder: EasyLoading.init(
        builder: BotToastInit(),
      ),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(provider.currentLanguage),
    );
  }
}
