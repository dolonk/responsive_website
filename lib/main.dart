import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:device_preview/device_preview.dart';
import 'package:responsive_website/route/route_config.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  if (kDebugMode) {
    WidgetsFlutterBinding.ensureInitialized();
    debugPrintScheduleBuildForStacks = false;
  }

  setPathUrlStrategy();
  runApp(const MyApp());
  //runApp(DevicePreview(enabled: true, builder: (context) => const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // ✅ Wrap with ScreenUtilInit
    return ScreenUtilInit(
      designSize: const Size(1920, 1080), // Desktop design base
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp.router(
          title: 'Build Storm',
          debugShowCheckedModeBanner: false,

          // Device Preview support
          locale: DevicePreview.locale(context),
          builder: DevicePreview.appBuilder,

          // Theme
          theme: ThemeData(
            primarySwatch: Colors.blue,
            fontFamily: 'Roboto',
            useMaterial3: true,
          ),

          // 🚀 GoRouter Configuration
          routerConfig: RouteConfig.router,
        );
      },
    );
  }
}
