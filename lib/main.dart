import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';

import 'controllers/AppController.dart';
import 'pages/authPage.dart';
import 'pages/mainPage.dart';

void main() async {
  Get.put(AppController());
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  
  // final AppController appController = Get.find<AppController>();
  
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: () => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          
          textTheme: GoogleFonts.poppinsTextTheme(
            Theme.of(context).textTheme,
          ),
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
        ),
        home: AuthPage(),
        // home: Auth(),
      ),
      designSize: const Size(390, 844),
    );
  }
}
