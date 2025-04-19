import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'core/constants/app_color.dart';
import 'core/di/dependence_initializer.dart';
import 'core/routes/routing_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DependenceInitializer.dependenceInjection();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      transitionDuration: const Duration(milliseconds: 300),
      defaultTransition: Transition.fadeIn,
      title: 'Json Placeholder',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.mainColor),
        useMaterial3: true,
      ),
      getPages: RoutingManagement.routes,
    );
  }
}
