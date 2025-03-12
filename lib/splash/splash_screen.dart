import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orderapp/generated/assets.dart';
import 'package:orderapp/routes/app_pages.dart';
import 'package:orderapp/utils/app_colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToNextScreen();
  }

  Future<void> _navigateToNextScreen() async {
    await Future.delayed(const Duration(milliseconds: 500));
    Get.offAllNamed(Routes.login);
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: AppColors.white,
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).padding.top + size.height * 0.25,
            ),
            Image.asset(Assets.imagesLogo),
            Expanded(child: Container()),
            Align(
              alignment: Alignment.bottomCenter,
              child: Image.asset(Assets.imagesSplashImage),
            ),
          ],
        ),
      ),
    );
  }
}
