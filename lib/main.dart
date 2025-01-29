import 'package:eventely/core/routes/app_routes.dart';
import 'package:eventely/core/services/local_storage_services.dart';
import 'package:eventely/core/theme/app_theme_manager.dart';
import 'package:flutter/material.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();

 await LocalStorageServices.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Evently Time Management',
      debugShowCheckedModeBanner: false,
      theme:AppThemeManager.lightTheme,
      onGenerateRoute: AppRoutes.onGeneratedRoute,
    );
  }
}
