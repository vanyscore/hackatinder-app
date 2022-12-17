import 'package:fl_app/app_colors.dart';
import 'package:fl_app/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:vk_bridge/vk_bridge.dart';

class SimpleLogger implements Logger {
  @override
  void d(Object message) {
    print('vk_bridge.d: $message');
  }

  @override
  void e(Object message) {
    print('vk_bridge.e: $message');
  }
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  VKBridge.instance.setLogger(SimpleLogger());
  VKBridge.instance.init().then((value) {
    print('vkBridge initialized? $value');
  });

  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: AppColors.main,
      ),
      routes: {'/': (context) => const SplashScreen()},
    );
  }
}
