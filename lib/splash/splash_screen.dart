import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orderapp/generated/assets.dart';
import 'package:orderapp/routes/app_pages.dart';
import 'package:orderapp/utils/app_colors.dart';
import 'package:orderapp/utils/text_style.dart';

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
    await Future.delayed(const Duration(seconds: 3));
    Get.offAllNamed(Routes.login);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: AppColors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(width: 200, child: Image.asset(Assets.imagesLogo)),
            Text(
              'OrderApp',
              style: textStyleW700(size.width * 0.042, AppColors.blackText),
            ),
          ],
        ),
      ),
    );
  }
}
