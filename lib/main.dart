import 'package:bot_toast/bot_toast.dart';
import 'package:eventely/core/routes/app_routes.dart';
import 'package:eventely/core/services/loading_services.dart';
import 'package:eventely/core/services/local_storage_services.dart';
import 'package:eventely/core/theme/app_theme_manager.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await LocalStorageServices.init();

  runApp(const MyApp());

  configLoading();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override

  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Evently Time Management',
      debugShowCheckedModeBanner: false,
      theme: AppThemeManager.lightTheme,
      onGenerateRoute: AppRoutes.onGeneratedRoute,
      builder: EasyLoading.init(
        builder: BotToastInit(),
      ),

    );
  }
}
