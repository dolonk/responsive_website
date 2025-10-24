import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'features/home/home_page.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() {
  if (kDebugMode) {
    WidgetsFlutterBinding.ensureInitialized();
    debugPrintScheduleBuildForStacks = false;
  }
  //runApp(const MyApp());
  runApp(DevicePreview(enabled: true, builder: (context) => const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      title: 'Responsive Website',
      debugShowCheckedModeBanner: false,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'Roboto'),
      home: const HomePage(),
    );
  }
}
