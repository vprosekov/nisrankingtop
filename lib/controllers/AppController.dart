import 'dart:html';
import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:nisrankingtop/models/user.dart';
import 'package:nisrankingtop/pages/mainPage.dart';
import 'package:nisrankingtop/services/userApi.dart';

class AppController extends GetxController {
  var dio = Dio();
  bool internetConnection = true;

  Map profile = {
    'loggedIn': false,
    "id": '',
    'iin': '',
    'password': '',
    'name': '',
    "gradeId": '',
    "gradeName": '',
    "shanyraqId": '',
    "shanyraqName": '',
    "shanyraqRole": '',
    "ministry": '',
    "scores": '',
    'apiKey': ''
  };

  Map getWeekdayDate() {
    var now = new DateTime.now();
    var dateNow = new DateFormat('d MMM');
    var weekDayNow = new DateFormat('E');
    String formattedWeekDay = weekDayNow.format(now);
    String formattedDate = dateNow.format(now);
    return {"weekday": formattedWeekDay, "date": formattedDate};
  }

  Future<bool> requestAuth(String iin, String password) async {
    var tmpRestGetApi = await UserApi().getApiKey(iin, password);
    var apiKey = tmpRestGetApi['apiKey'];
    var profile_id = tmpRestGetApi['userId'];
    if (apiKey != '') {
      profile['iin'] = iin;
      profile['id'] = profile_id;
      profile['password'] = password;
      profile['loggedIn'] = true;

      var tmpUserInfo = await UserApi().getUserInfoById(profile_id);
      if (tmpUserInfo != {}) {
        profile['name'] = tmpUserInfo['name'];
        profile['gradeId'] = tmpUserInfo['gradeId'];
        profile['gradeName'] = tmpUserInfo['gradeName'];
        profile['shanyraqId'] = tmpUserInfo['shanyraqId'];
        profile['shanyraqName'] = tmpUserInfo['shanyraqName'];
        profile['shanyraqRole'] = tmpUserInfo['shanyraqRole'];
        // profile['ministry'] = tmpUserInfo['ministry'];
        // profile['scores'] = tmpUserInfo['scores'];
        return true;
      }
    }
    return false;
  }

  getAuth() async {
    final userdate = GetStorage();
    dynamic iin = userdate.read('iin');
    dynamic password = userdate.read('password');
    dynamic apiKey = userdate.read('apiKey');
    dynamic loggedIn = userdate.read('loggedIn');

    // check if iin and password are not equal to false
    if (iin != false && password != false) {
      if (internetConnection == false) {
        // vibrate on half second using HapticFeedback
        HapticFeedback.vibrate();
        // Show snackbar no internet
        Get.snackbar(
          'Нет интернет-подключения',
          '',
          icon: Icon(
            Icons.error,
            color: Colors.red,
          ),
          backgroundColor: Colors.white,
          colorText: Colors.black,
          snackPosition: SnackPosition.BOTTOM,
          duration: Duration(seconds: 3),
        );
        return;
      }
      if (!await requestAuth(iin, password)) {
        // vibrate on half second using HapticFeedback
        HapticFeedback.vibrate();
        // Show snackbar no internet
        Get.snackbar(
          'Неверный логин или пароль',
          '',
          icon: Icon(
            Icons.error,
            color: Colors.red,
          ),
          backgroundColor: Colors.white,
          colorText: Colors.black,
          snackPosition: SnackPosition.BOTTOM,
          duration: Duration(seconds: 3),
        );
        return;
      } else {
        Get.to(() => MainPage());
      }

      // get JSON from 'https://prv.petropavl.site/api/api.php?request=getuserapikey' with POST data iin=iin and password=password.
      // parse response to JSON
      // If received JSON has 'error' key, show snackbar with error message.
      // If received JSON has 'apiKey' key, save apiKey to apiKey.

    }
  }

  String get currentDayOfWeek => "MON";

  @override
  void onInit() async {
    await GetStorage.init();
    initProfile();
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      // Got a new connectivity status!
      if (result == ConnectivityResult.none) {
        internetConnection = false;
        print('Disconnected');
      } else {
        internetConnection = true;
        print('Connected');
      }
    });

    super.onInit();
  }

  void initProfile() async {
    final userdate = GetStorage();
    userdate.writeIfNull('isLogged', false);
    userdate.writeIfNull('iin', '');
    userdate.writeIfNull('pasword', '');
    userdate.writeIfNull('name', '');
    // if isLogged in userdate, then get iin and cachedpassword from it
    // else set isLogged to false
    if (userdate.read('isLogged') == true) {
      // check if iin and password in userdate are not equal to ''
      if (userdate.read('iin') != {} && userdate.read('password') != {}) {
        var tmpRestGetApi = await UserApi()
            .getApiKey(userdate.read('iin'), userdate.read('password'));
        var apiKey = tmpRestGetApi['apiKey'];
        var profile_id = tmpRestGetApi['userId'];
        if (apiKey != '') {
          profile['iin'] = userdate.read('iin');
          profile['id'] = profile_id;
          profile['password'] = userdate.read('password');
          profile['loggedIn'] = true;

          var tmpUserInfo = await UserApi().getUserInfoById(profile_id);
          if (tmpUserInfo != {}) {
            profile['name'] = tmpUserInfo['name'];
            profile['gradeId'] = tmpUserInfo['gradeId'];
            profile['gradeName'] = tmpUserInfo['gradeName'];
            profile['shanyraqId'] = tmpUserInfo['shanyraqId'];
            profile['shanyraqName'] = tmpUserInfo['shanyraqName'];
            profile['shanyraqRole'] = tmpUserInfo['shanyraqRole'];
            // profile['ministry'] = tmpUserInfo['ministry'];
            // profile['scores'] = tmpUserInfo['scores'];
          }
        }
      }
    }

    profile = {
      'loggedIn': false,
      "id": '',
      'iin': '',
      'password': '',
      'name': '',
      "gradeId": '',
      "gradeName": '',
      "shanyraqId": '',
      "shanyraqName": '',
      "shanyraqRole": '',
      // "ministry": '',
      // "scores": '',
      'apiKey': ''
    };
  }
}
