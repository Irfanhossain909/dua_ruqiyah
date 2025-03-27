import 'package:dua_ruqiyah/presentation/home/ui/home_page.dart';
import 'package:dua_ruqiyah/presentation/main_app_shell.dart';
import 'package:dua_ruqiyah/presentation/memorization/memorization_screen.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:get/get.dart';
import 'core/di/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupDependencies();
  runApp(const DuaAndRuqyahApp());
}

class DuaAndRuqyahApp extends StatelessWidget {
  const DuaAndRuqyahApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return GetMaterialApp(
          title: 'Dua & Ruqyah App',
          theme: ThemeData(
            fontFamily: 'Roboto', // Replace with your desired font
            colorScheme: ColorScheme.fromSeed(
              seedColor: const Color(0xFF457363),
            ), // Green matching the memorization screen
            useMaterial3: true,
          ),
          home: const MainAppShell(),
          getPages: [
            GetPage(name: '/', page: () => const MainAppShell()),
            GetPage(name: '/home', page: () => const HomePage()),
            GetPage(
              name: '/memorization',
              page: () => const MemorizationScreen(),
            ),
          ],
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
