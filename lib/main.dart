import 'package:demo_app_flutter/ui/views/single_user_page.dart';
import 'package:demo_app_flutter/ui/views/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../../custom_files/app_colors.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.seedBlue),
      ),
      home: const SplashScreen(),
      routes: {
        '/first': (context) => SingleUserPage(),
      },
    );
  }
}

const spinkit = SpinKitChasingDots(
  color: AppColors.blue,
  size: 40.0,
);
