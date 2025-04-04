import 'package:dua_ruqiyah/presentation/home/ui/home_page.dart';
import 'package:dua_ruqiyah/presentation/main_app_shell.dart';
import 'package:dua_ruqiyah/presentation/memorization/ui/memorization_screen.dart';
import 'package:dua_ruqiyah/presentation/bookmark/ui/bookmark_screen.dart';
import 'package:dua_ruqiyah/presentation/alldua/ui/all_dua_screen.dart';
import 'package:dua_ruqiyah/presentation/selfruqiyah/ui/selfruqiyah_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:get/get.dart';
import 'core/di/service_locator.dart';
import 'core/theme/app_theme.dart';
import 'presentation/screens/dhikr_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupDependencies();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
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
          theme: AppTheme.light,
          home: const MainAppShell(),
          getPages: [
            GetPage(name: '/', page: () => const MainAppShell()),
            GetPage(name: '/home', page: () => const HomePage()),
            GetPage(name: '/bookmark', page: () => const BookmarkScreen()),
            GetPage(
              name: '/memorization',
              page: () => const MemorizationScreen(),
            ),
            GetPage(name: '/alldua', page: () => const AllDuaScreen()),
            GetPage(
              name: '/selfruqiyah',
              page: () => const SelfRuqiyahScreen(),
            ),
          ],
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
