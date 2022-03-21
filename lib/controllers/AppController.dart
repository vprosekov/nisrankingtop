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
  bool internetConnection = false;

  RxMap profile = {
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
  }.obs;

  String get name => profile.value['name'];

  Map getWeekdayDate() {
    var now = new DateTime.now();
    var dateNow = new DateFormat('d MMM');
    var weekDayNow = new DateFormat('E');
    String formattedWeekDay = weekDayNow.format(now);
    String formattedDate = dateNow.format(now);
    return {"weekday": formattedWeekDay, "date": formattedDate};
  }

  dynamic requestAuth(String iin, String password) async {
    var tmpRestGetApi = await UserApi().getApiKey(iin, password);

    if (tmpRestGetApi.containsKey('apiKey') &&
        tmpRestGetApi.containsKey('userId')) {
      var apiKey = tmpRestGetApi['apiKey'];
      var profile_id = tmpRestGetApi['userId'].toString();
      profile['iin'] = iin;
      profile['id'] = profile_id;
      profile['password'] = password;
      profile['loggedIn'] = true;
      print(tmpRestGetApi.toString());

      dynamic tmpUserInfo = await UserApi().getUserInfoById(profile_id);
      if (tmpUserInfo != {}) {
        profile['name'] = tmpUserInfo['name'];
        profile['gradeId'] = tmpUserInfo['gradeId'];
        profile['gradeName'] = tmpUserInfo['gradeName'];
        profile['shanyraqId'] = tmpUserInfo['shanyraqId'];
        profile['shanyraqName'] = tmpUserInfo['shanyraqName'];
        profile['shanyraqRole'] = tmpUserInfo['shanyraqRole'];
        // write profile to storage
        await GetStorage().write('iin', iin);
        await GetStorage().write('id', profile_id);
        await GetStorage().write('password', password);
        await GetStorage().write('name', tmpUserInfo['name']);
        await GetStorage().write('isLogged', true);

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
        // Get.to(() => MainPage());
        Get.offAll(() => MainPage());
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
    await GetStorage.init();
    initProfile();

    super.onInit();
  }

  void initProfile() async {
    print(internetConnection);
    bool show_loadinternet = false;
    if (!internetConnection) {
      show_loadinternet = true;
      await Get.dialog(
          AlertDialog(
            title: const Text('Нет интернет подключения'),
            content: const Text('Подключитесь к интернету'),
            actions: [
            TextButton(
                onPressed: () {
                  if(internetConnection){
                    Get.back();
                  }
                }, // Close the dialog
                child: const Text('Проверить подключение')),
            ],
          ),
          barrierDismissible: false
          );
    }
    while (!internetConnection) {}
    final userdate = GetStorage();
    // print(userdate.read('isLogged'));
    userdate.writeIfNull('isLogged', false);
    userdate.writeIfNull('iin', '');
    userdate.writeIfNull('pasword', '');
    userdate.writeIfNull('name', '');
    // if isLogged in userdate, then get iin and cachedpassword from it
    // else set isLogged to false
    if (userdate.read('isLogged') == true) {
      // check if iin and password in userdate are not equal to ''
      await loginFunc(userdate.read('iin'), userdate.read('password'));
    }
  }

  loginFunc(String iin, String password) async {
    if (await requestAuth(iin, password) != false) {
      
        Get.offAll(() => MainPage());
    } else {
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
      }.obs;
      HapticFeedback.vibrate();

      // snackbar using getX with text 'Неверный ИИН или пароль'
      Get.snackbar(
        'Неверный ИИН или пароль',
        '',
        icon: Icon(
          Icons.error,
          color: Colors.red,
        ),
        // backgroundColor: Colors.white,
        // colorText: Colors.black,
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(seconds: 3),
      );
    }
  }
}
