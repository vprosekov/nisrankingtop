
import 'package:connectivity/connectivity.dart';
import 'package:get/get.dart';

class AppController extends GetxController {
  bool internetConnection = true;

  String get currentDayOfWeek => "MON";

  @override
  void onInit() {
    initProfile();
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      // Got a new connectivity status!
      if(result == ConnectivityResult.none){
        internetConnection = false;
        print('Disconnected');
      }
      else{
        internetConnection = true;
        print('Connected');
      }
    });

    super.onInit();
  }


  void initProfile() async {
    
  }

}