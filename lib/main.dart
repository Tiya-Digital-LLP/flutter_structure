import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orderapp/routes/app_pages.dart';
import 'package:orderapp/utils/app_colors.dart';
import 'package:permission_handler/permission_handler.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    requestSmsPermission();
  }

  Future<void> requestSmsPermission() async {
    PermissionStatus status = await Permission.sms.request();

    if (status.isGranted) {
      //
    } else {
      exit(0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      // ignore: deprecated_member_use
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
      child: GetMaterialApp(
        title: 'Order App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          bottomSheetTheme: BottomSheetThemeData(
            backgroundColor: AppColors.background,
          ),
          dialogTheme: const DialogThemeData(backgroundColor: Colors.white),
        ),
        getPages: AppPages.routes,
        debugShowCheckedModeBanner: false,
        initialRoute: Routes.splash,
      ),
    );
  }
}
