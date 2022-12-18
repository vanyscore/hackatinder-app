import 'package:dio/dio.dart';
import 'package:fl_app/events/events_screen.dart';
import 'package:fl_app/matcher/match_screen.dart';
import 'package:fl_app/profile/profile_screen.dart';
import 'package:fl_app/repos/user_repo.dart';
import 'package:fl_app/splash/splash_screen.dart';
import 'package:fl_app/styles/app_colors.dart';
import 'package:fl_app/team/team_control_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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

  // VKBridge.instance.setLogger(SimpleLogger());
  // VKBridge.instance.init().then((value) {
  //   print('vkBridge initialized? $value');
  // });

  runApp(App());
}

class App extends StatelessWidget {
  App({super.key});

  final dio = Dio(
    BaseOptions(baseUrl: 'http://10.11.167.53:8000'),
  )..interceptors.add(LogInterceptor());

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) => dio,
      child: MultiProvider(
        providers: [
          Provider(
            create: (context) => UserRepo(dio: dio),
          )
        ],
        child: MaterialApp(
          theme: ThemeData(
            primaryColor: AppColors.main,
            appBarTheme: const AppBarTheme(
              backgroundColor: AppColors.main,
            ),
            fontFamily: 'Open-Sans',
          ),
          initialRoute: '/',
          routes: {
            '/': (context) => const SplashScreen(),
            '/profile': (context) => const ProfileScreen(),
            '/events': (context) => const EventsScreen(),
            '/match': (context) => const MatchScreen(),
            '/team': (context) => const TeamControlScreen(),
          },
        ),
      ),
    );
  }
}
