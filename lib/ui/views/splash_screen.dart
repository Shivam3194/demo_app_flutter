import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../custom_files/app_colors.dart';
import '../bloc/home_bloc/home_view.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({
    super.key,
  });

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const HomeView(),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 1;
    final width = MediaQuery.of(context).size.width * 1;
    return Material(
      child: Container(
        color: const Color(0xFF001F3F),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "  Travel 🌍",
                style: GoogleFonts.dancingScript(
                  letterSpacing: 0.6,
                  color: Colors.white,
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 40),
              RichText(
                text: TextSpan(
                  style: GoogleFonts.archivo(
                    letterSpacing: .6,
                    color: Colors.white,
                    fontSize: 18.0,
                  ),
                  children: const [
                    TextSpan(text: "  Find Your Dream\n"),
                    WidgetSpan(child: SizedBox(height: 15)),
                    TextSpan(text: "Destination With Us"),
                  ],
                ),
              ),
              SizedBox(height: height * .07),
              const SpinKitChasingDots(
                color: AppColors.blue,
                size: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
