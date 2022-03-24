import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../controllers/AppController.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class LoadingPage extends StatefulWidget {
  const LoadingPage({ Key? key }) : super(key: key);

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('NIS Ranking'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Theme.of(context).accentColor,
      ),
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(0.w, 0.h, 0.w, 15.h),
              //height: 75.0,
              child: SpinKitSquareCircle(
                color: Colors.white,
                size: 50.0.w,
              ),
            ),
            SizedBox(
              height: 35.h,
              child: DefaultTextStyle(
                style: TextStyle(
                  fontFamily: 'Roboto',
                  color: Colors.white,
                  fontSize: 28.sp,
                  fontWeight: FontWeight.bold,
                ),
                child: AnimatedTextKit(
                  repeatForever: true,
                  animatedTexts: [
                    FadeAnimatedText('Идёт подключение'),
                    FadeAnimatedText('Ещё немного'),
                    FadeAnimatedText('Подожди'),
                    FadeAnimatedText('Скоро запустится'),
                    FadeAnimatedText('Арлан топ'),
                  ],
                  onTap: () {
                    print("Tap Event");
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}