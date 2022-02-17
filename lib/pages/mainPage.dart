import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nisrankingtop/variables/themes.dart';

class MainPage extends StatelessWidget {
  const MainPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
                  'Nis Ranking',
                  style: Themes.bodyText2.copyWith(
                    fontFamily: 'Poppins',
                    color: Color(0xFF070707),
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
        centerTitle: false,
        // elevation: 0,
        actions: [
          
          Padding(
            padding: EdgeInsets.fromLTRB(0.w, 5.h, 18.w, 0.h),
            child: Center(
              child: GestureDetector(
                    // onLongPress: ()=>Get.snackbar('Арлан Маратович и Влад Просеков', 'ТОП ТОП ТОП ТОП'),
                child: Wrap(
                        children: [
                          Text(
                            "Wed",
                            style: Themes.bodyText2.copyWith(
                              fontWeight: FontWeight.w900,
                              color: Color(0xFF252E65),
                            ),
                          ),
                          SizedBox(width: 5.w),
                          Text(
                            "10 Oct",
                            style: Themes.bodyText2.copyWith(
                              color: Color(0xFF252E65),)
                          ),
                        ],
                      ),
              ),
            ),
          )
      ]),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: 
        [
          Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 230.h,
                decoration: BoxDecoration(
                  color: Color(0xFFEEEEEE),
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: Image.asset(
                      'assets/profilebg.png',
                    ).image,
                  ),
                  shape: BoxShape.rectangle,
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(42.w, 30.h, 42.w, 0.h),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            width: 100.w,
                            height: 100.h,
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: Image.network(
                              'https://picsum.photos/seed/903/600',
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(12.w, 0.h, 0.w, 0.h),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Prosekov Vladick',
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    color: Color(0xFF070707),
                                    fontSize: 24.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  'IT Ministry',
                                  style: Themes.bodyText2.copyWith(
                                    color: Color(0xFF878787),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 25.h),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(5.w, 0.h, 0.w, 0.h),
                                child: Text(
                                  '57',
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    color: Color(0xFFF9F9F9),
                                    fontSize: 48.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                )
                              ),
                              
                              Text(
                                  'баллов',
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    color: Color(0xFFF9F9F9),
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              
                            ],
                          ),
                          Text(
                            '#36',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              color: Color(0xFFF9F9F9),
                              fontSize: 36.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
      
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20.w, 10.h, 20.w, 0.h),
                child: Column(
                  children: [
                    GestureDetector(
                    // onLongPress: () {
                    //   HapticFeedback.vibrate();
                    //   Get.snackbar(
                    //         'Арлан Влад Топ',
                    //     '',
                    //     duration: Duration(seconds:1),
                    //     snackPosition: SnackPosition.BOTTOM
                    //     );
                    // },
                    onTap: () {
                      HapticFeedback.vibrate();
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(
                            'onetap'),
                        duration: Duration(seconds: 1),
                      ));
                      // Get.to(()=>CategoryReceipts(categoryId: categoryId));
                    },
                    child: Card(
                      color: Colors.white,
                      elevation: 0,
                      margin: EdgeInsets.fromLTRB(10.w,10.h,10.w,10.h),
                      // color: Constants.cardColor,
                      shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.r),
                              // side: BorderSide(color: Colors.black12, width: 1)
                            ),
                      child: Container(
                        height: 100.h,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(5.r),
                              topRight: Radius.circular(5.r),
                              bottomLeft: Radius.circular(5.r),
                              bottomRight: Radius.circular(5.r)
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.13),
                              spreadRadius: -2.r,
                              blurRadius: 20.r,
                              offset: Offset(0, 8.h), // changes position of shadow
                            ),
                          ],
                        ),
                        padding: EdgeInsets.fromLTRB(9.5.w,12.5.h,9.5.w,0.h),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              // Container(margin: EdgeInsets.symmetric(horizontal: 15.w),child: Icon(Constants.categories[categoryId]['icon'])),
                              Padding(
                                padding:  EdgeInsets.fromLTRB(0,0,0,9.5.h),
                                child: Image.network(
                                  'https://images.unsplash.com/photo-1481349518771-20055b2a7b24?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1539&q=80',                             
                                  height: 80.h,
                                  width: 80.h,
                                  fit: BoxFit.cover
                                ),
                              ),
                              SizedBox(width: 10.w),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Рейтинг шаныраков",
                                    style: Themes.bodyText2.copyWith(
                                      fontWeight: FontWeight.w900,
                                      color: Color(0xFF070707),
                                    ),
                                  ),
                                  Container (
                                    // padding: const EdgeInsets.all(16.0),
                                    width: 180.w,
                                    child: new Column (
                                      children: <Widget>[
                                          Text(
                                            "Посмотреть рейтинг шаныраков",
                                            maxLines: 3,
                                            style: Themes.bodyText2.copyWith(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 12.sp,
                                              color: Color(0xFF070707),
                                            ),
                                          ),
                                        ],
                                    ),
                                  )
                                  
                                ]
                              )
                            ],
                          ),
                        ),
                      )
                    ),
                  ),
                  
                    GestureDetector(
                    // onLongPress: () {
                    //   HapticFeedback.vibrate();
                    //   Get.snackbar(
                    //         'Арлан Влад Топ',
                    //     '',
                    //     duration: Duration(seconds:1),
                    //     snackPosition: SnackPosition.BOTTOM
                    //     );
                    // },
                    onTap: () {
                      HapticFeedback.vibrate();
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(
                            'onetap'),
                        duration: Duration(seconds: 1),
                      ));
                      // Get.to(()=>CategoryReceipts(categoryId: categoryId));
                    },
                    child: Card(
                      color: Colors.white,
                      elevation: 0,
                      margin: EdgeInsets.fromLTRB(10.w,10.h,10.w,10.h),
                      // color: Constants.cardColor,
                      shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.r),
                              // side: BorderSide(color: Colors.black12, width: 1)
                            ),
                      child: Container(
                        height: 100.h,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(5.r),
                              topRight: Radius.circular(5.r),
                              bottomLeft: Radius.circular(5.r),
                              bottomRight: Radius.circular(5.r)
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.13),
                              spreadRadius: -2.r,
                              blurRadius: 20.r,
                              offset: Offset(0, 8.h), // changes position of shadow
                            ),
                          ],
                        ),
                        padding: EdgeInsets.fromLTRB(9.5.w,12.5.h,9.5.w,0.h),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              // Container(margin: EdgeInsets.symmetric(horizontal: 15.w),child: Icon(Constants.categories[categoryId]['icon'])),
                              Padding(
                                padding:  EdgeInsets.fromLTRB(0,0,0,9.5.h),
                                child: Image.network(
                                  'https://images.unsplash.com/photo-1481349518771-20055b2a7b24?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1539&q=80',                             
                                  height: 80.h,
                                  width: 80.h,
                                  fit: BoxFit.cover
                                ),
                              ),
                              SizedBox(width: 10.w),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Рейтинг шаныраков",
                                    style: Themes.bodyText2.copyWith(
                                      fontWeight: FontWeight.w900,
                                      color: Color(0xFF070707),
                                    ),
                                  ),
                                  Container (
                                    // padding: const EdgeInsets.all(16.0),
                                    width: 180.w,
                                    child: new Column (
                                      children: <Widget>[
                                          Text(
                                            "Посмотреть рейтинг шаныраков",
                                            maxLines: 3,
                                            style: Themes.bodyText2.copyWith(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 12.sp,
                                              color: Color(0xFF070707),
                                            ),
                                          ),
                                        ],
                                    ),
                                  )
                                  
                                ]
                              )
                            ],
                          ),
                        ),
                      )
                    ),
                  ),
                  
                    GestureDetector(
                    // onLongPress: () {
                    //   HapticFeedback.vibrate();
                    //   Get.snackbar(
                    //         'Арлан Влад Топ',
                    //     '',
                    //     duration: Duration(seconds:1),
                    //     snackPosition: SnackPosition.BOTTOM
                    //     );
                    // },
                    onTap: () {
                      HapticFeedback.vibrate();
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(
                            'onetap'),
                        duration: Duration(seconds: 1),
                      ));
                      // Get.to(()=>CategoryReceipts(categoryId: categoryId));
                    },
                    child: Card(
                      color: Colors.white,
                      elevation: 0,
                      margin: EdgeInsets.fromLTRB(10.w,10.h,10.w,10.h),
                      // color: Constants.cardColor,
                      shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.r),
                              // side: BorderSide(color: Colors.black12, width: 1)
                            ),
                      child: Container(
                        height: 100.h,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(5.r),
                              topRight: Radius.circular(5.r),
                              bottomLeft: Radius.circular(5.r),
                              bottomRight: Radius.circular(5.r)
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.13),
                              spreadRadius: -2.r,
                              blurRadius: 20.r,
                              offset: Offset(0, 8.h), // changes position of shadow
                            ),
                          ],
                        ),
                        padding: EdgeInsets.fromLTRB(9.5.w,12.5.h,9.5.w,0.h),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              // Container(margin: EdgeInsets.symmetric(horizontal: 15.w),child: Icon(Constants.categories[categoryId]['icon'])),
                              Padding(
                                padding:  EdgeInsets.fromLTRB(0,0,0,9.5.h),
                                child: Image.network(
                                  'https://images.unsplash.com/photo-1481349518771-20055b2a7b24?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1539&q=80',                             
                                  height: 80.h,
                                  width: 80.h,
                                  fit: BoxFit.cover
                                ),
                              ),
                              SizedBox(width: 10.w),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Рейтинг шаныраков",
                                    style: Themes.bodyText2.copyWith(
                                      fontWeight: FontWeight.w900,
                                      color: Color(0xFF070707),
                                    ),
                                  ),
                                  Container (
                                    // padding: const EdgeInsets.all(16.0),
                                    width: 180.w,
                                    child: new Column (
                                      children: <Widget>[
                                          Text(
                                            "Посмотреть рейтинг шаныраков",
                                            maxLines: 3,
                                            style: Themes.bodyText2.copyWith(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 12.sp,
                                              color: Color(0xFF070707),
                                            ),
                                          ),
                                        ],
                                    ),
                                  )
                                  
                                ]
                              )
                            ],
                          ),
                        ),
                      )
                    ),
                  ),
                  
                    GestureDetector(
                    // onLongPress: () {
                    //   HapticFeedback.vibrate();
                    //   Get.snackbar(
                    //         'Арлан Влад Топ',
                    //     '',
                    //     duration: Duration(seconds:1),
                    //     snackPosition: SnackPosition.BOTTOM
                    //     );
                    // },
                    onTap: () {
                      HapticFeedback.vibrate();
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(
                            'onetap'),
                        duration: Duration(seconds: 1),
                      ));
                      // Get.to(()=>CategoryReceipts(categoryId: categoryId));
                    },
                    child: Card(
                      color: Colors.white,
                      elevation: 0,
                      margin: EdgeInsets.fromLTRB(10.w,10.h,10.w,10.h),
                      // color: Constants.cardColor,
                      shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.r),
                              // side: BorderSide(color: Colors.black12, width: 1)
                            ),
                      child: Container(
                        height: 100.h,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(5.r),
                              topRight: Radius.circular(5.r),
                              bottomLeft: Radius.circular(5.r),
                              bottomRight: Radius.circular(5.r)
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.13),
                              spreadRadius: -2.r,
                              blurRadius: 20.r,
                              offset: Offset(0, 8.h), // changes position of shadow
                            ),
                          ],
                        ),
                        padding: EdgeInsets.fromLTRB(9.5.w,12.5.h,9.5.w,0.h),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              // Container(margin: EdgeInsets.symmetric(horizontal: 15.w),child: Icon(Constants.categories[categoryId]['icon'])),
                              Padding(
                                padding:  EdgeInsets.fromLTRB(0,0,0,9.5.h),
                                child: Image.network(
                                  'https://images.unsplash.com/photo-1481349518771-20055b2a7b24?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1539&q=80',                             
                                  height: 80.h,
                                  width: 80.h,
                                  fit: BoxFit.cover
                                ),
                              ),
                              SizedBox(width: 10.w),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Рейтинг шаныраков",
                                    style: Themes.bodyText2.copyWith(
                                      fontWeight: FontWeight.w900,
                                      color: Color(0xFF070707),
                                    ),
                                  ),
                                  Container (
                                    // padding: const EdgeInsets.all(16.0),
                                    width: 180.w,
                                    child: new Column (
                                      children: <Widget>[
                                          Text(
                                            "Посмотреть рейтинг шаныраков",
                                            maxLines: 3,
                                            style: Themes.bodyText2.copyWith(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 12.sp,
                                              color: Color(0xFF070707),
                                            ),
                                          ),
                                        ],
                                    ),
                                  )
                                  
                                ]
                              )
                            ],
                          ),
                        ),
                      )
                    ),
                  ),
                  
                    GestureDetector(
                    // onLongPress: () {
                    //   HapticFeedback.vibrate();
                    //   Get.snackbar(
                    //         'Арлан Влад Топ',
                    //     '',
                    //     duration: Duration(seconds:1),
                    //     snackPosition: SnackPosition.BOTTOM
                    //     );
                    // },
                    onTap: () {
                      HapticFeedback.vibrate();
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(
                            'onetap'),
                        duration: Duration(seconds: 1),
                      ));
                      // Get.to(()=>CategoryReceipts(categoryId: categoryId));
                    },
                    child: Card(
                      color: Colors.white,
                      elevation: 0,
                      margin: EdgeInsets.fromLTRB(10.w,10.h,10.w,10.h),
                      // color: Constants.cardColor,
                      shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.r),
                              // side: BorderSide(color: Colors.black12, width: 1)
                            ),
                      child: Container(
                        height: 100.h,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(5.r),
                              topRight: Radius.circular(5.r),
                              bottomLeft: Radius.circular(5.r),
                              bottomRight: Radius.circular(5.r)
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.13),
                              spreadRadius: -2.r,
                              blurRadius: 20.r,
                              offset: Offset(0, 8.h), // changes position of shadow
                            ),
                          ],
                        ),
                        padding: EdgeInsets.fromLTRB(9.5.w,12.5.h,9.5.w,0.h),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              // Container(margin: EdgeInsets.symmetric(horizontal: 15.w),child: Icon(Constants.categories[categoryId]['icon'])),
                              Padding(
                                padding:  EdgeInsets.fromLTRB(0,0,0,9.5.h),
                                child: Image.network(
                                  'https://images.unsplash.com/photo-1481349518771-20055b2a7b24?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1539&q=80',                             
                                  height: 80.h,
                                  width: 80.h,
                                  fit: BoxFit.cover
                                ),
                              ),
                              SizedBox(width: 10.w),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Рейтинг шаныраков",
                                    style: Themes.bodyText2.copyWith(
                                      fontWeight: FontWeight.w900,
                                      color: Color(0xFF070707),
                                    ),
                                  ),
                                  Container (
                                    // padding: const EdgeInsets.all(16.0),
                                    width: 180.w,
                                    child: new Column (
                                      children: <Widget>[
                                          Text(
                                            "Посмотреть рейтинг шаныраков",
                                            maxLines: 3,
                                            style: Themes.bodyText2.copyWith(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 12.sp,
                                              color: Color(0xFF070707),
                                            ),
                                          ),
                                        ],
                                    ),
                                  )
                                  
                                ]
                              )
                            ],
                          ),
                        ),
                      )
                    ),
                  ),
                  
                  ],
                )
              )
      
            ],
          ),
        ]
      )
    );
  }
}