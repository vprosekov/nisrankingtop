import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nisrankingtop/Animation/FadeAnimation.dart';
import 'package:nisrankingtop/controllers/AppController.dart';

import 'mainPage.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final AppController appController = Get.find<AppController>();
  // final AppController appController = Get.put(AppController());

  late TextEditingController iinController;
  late TextEditingController passwordController;
  late bool passwordVisibility;
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    iinController = TextEditingController();
    passwordController = TextEditingController();
    passwordVisibility = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color(0xFF878787),
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Nis Ranking',
              style: TextStyle(
                fontFamily: 'Poppins',
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  appController.getWeekdayDate()["weekday"],
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    color: Color(0xFF252E65),
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(6, 0, 0, 0),
                  child: Text(
                    appController.getWeekdayDate()["date"],
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color: Color(0xFFE2E2E2),
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w100,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: [],
        centerTitle: false,
        elevation: 0,
      ),
      backgroundColor: Color(0xFF333333),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Form(
            key: formKey,
            autovalidateMode: AutovalidateMode.disabled,
            child: Stack(
              children: [
                Container(
                  // color: Color(0xFF333333),
                  width: 500.w,
                  height: 550.h,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: Image.asset(
                        'assets/authbg.png',
                      ).image,
                    ),
                    shape: BoxShape.rectangle,
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(41.w, 100.h, 41.w, 0.h),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.w, 4.h, 0.w, 0.h),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            FadeAnimation(
                              1,
                              Text(
                                'Войти ',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  color: Color(0xFFE2E2E2),
                                  fontSize: 24.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            // * Поле ввода ИИН
                            FadeAnimation(
                              1,
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.w, 50.h, 0.w, 0.h),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: TextFormField(
                                        controller: iinController,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          isDense: true,
                                          hintText: 'ИИН',
                                          hintStyle: TextStyle(
                                            color: Color(0xFFFFFFFF),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Colors.white,
                                              width: 1,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(15.r),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Colors.white,
                                              width: 1,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(15.r),
                                          ),
                                          filled: true,
                                          fillColor: Color(0x00FFFFFF),
                                          contentPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  25.w, 15.h, 25.w, 15.h),
                                        ),
                                        style: TextStyle(
                                          fontFamily: 'Lexend Deca',
                                          color: Colors.white,
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.normal,
                                        ),
                                        textAlign: TextAlign.start,
                                        maxLines: 1,
                                        validator: (val) {
                                          if (val!.isEmpty) {
                                            return 'Введите правильный ИИН';
                                          }
                                          if (val.length < 12) {
                                            return 'Неверный ИИН';
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            // * Поле ввода пароля
                            FadeAnimation(
                              1,
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.w, 50.h, 0.w, 0.h),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: TextFormField(
                                        controller: passwordController,
                                        obscureText: !passwordVisibility,
                                        decoration: InputDecoration(
                                          isDense: true,
                                          hintText: 'Пароль',
                                          hintStyle: TextStyle(
                                            color: Color(0xFFFFFFFF),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Colors.white,
                                              width: 1,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(15.r),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Colors.white,
                                              width: 1,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(15.r),
                                          ),
                                          filled: true,
                                          fillColor: Color(0x00FFFFFF),
                                          contentPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  25.w, 0.h, 25.w, 0.h),
                                          suffixIcon: InkWell(
                                            onTap: () => setState(
                                              () => passwordVisibility =
                                                  !passwordVisibility,
                                            ),
                                            child: Icon(
                                              passwordVisibility
                                                  ? Icons.visibility_outlined
                                                  : Icons
                                                      .visibility_off_outlined,
                                              color: Colors.white,
                                              size: 22.h,
                                            ),
                                          ),
                                        ),
                                        style: TextStyle(
                                          fontFamily: 'Lexend Deca',
                                          color: Colors.white,
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.normal,
                                        ),
                                        textAlign: TextAlign.start,
                                        maxLines: 1,
                                        validator: (val) {
                                          if (val!.isEmpty) {
                                            return 'Введите пароль';
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(1, 0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.w, 20.h, 0.w, 0.h),
                                child: MaterialButton(
                                  onPressed: () {
                                    // GetX snackbar with text 'Чтобы сбросить пароль, напишите куратору'
                                    Get.snackbar(
                                      'Чтобы сбросить пароль, напишите куратору',
                                      '',
                                      snackPosition: SnackPosition.TOP,
                                      colorText: Colors.white
                                    );

                                  },
                                  child: Text(
                                    'Забыли пароль?',
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            FadeAnimation(
                              2,
                              GestureDetector(
                                onTap: () {
                                  //HapticFeedback.vibrate();
                                  // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                  //   content: Text(
                                  //       'onetap'),
                                  //   duration: Duration(seconds: 1),
                                  // ));
                                  // print "Ok" if the form is valid
                                  if (formKey.currentState!.validate()) {
                                    // If the form is valid, display a Snackbar.

                                    appController.loginFunc(iinController.text,
                                        passwordController.text);
                                  }
                                  // Get.to(() => MainPage());
                                  // if (profileController
                                  //     .getDetailedReceiptData(shortReceipt.id)
                                  //     .json
                                  //     .isEmpty)
                                  //   profileController
                                  //       .getFullData(shortReceipt.id);
                                },
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(0, 100.h, 0, 0),
                                  child: Align(
                                    alignment: AlignmentDirectional(1, 0),
                                    child: Container(
                                      width: 70.w,
                                      height: 70.h,
                                      decoration: BoxDecoration(
                                        color: Color(0xFF313969),
                                        shape: BoxShape.circle,
                                      ),
                                      child: Icon(
                                        Icons.arrow_forward,
                                        color: Colors.white,
                                        size: 36.w,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      FadeAnimation(
                        1,
                        Align(
                          alignment: AlignmentDirectional(0, 0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.w, 0.h, 0.w, 45.h),
                            child: Text(
                              'Для регистрации свяжитесь с вашим куратором',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                color: Colors.white,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
