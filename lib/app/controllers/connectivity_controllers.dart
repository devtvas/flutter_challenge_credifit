import 'package:connectivity_plus/connectivity_plus.dart';

import 'package:get/get.dart';

class ConnectivityController extends GetxController {
  //add a list of connectivity phone
  Connectivity connect = Connectivity();
  get connectivityResult => ConnectivityResult;

  @override
  void onInit() {
    connect.onConnectivityChanged;
    super.onInit();
  }

  String connectivityCheck(ConnectivityResult? result) {
    if (result == ConnectivityResult.wifi) {
      return "You are now connected to wifi";
    } else if (result == ConnectivityResult.mobile) {
      return "You are now connected to mobile data";
    } else if (result == ConnectivityResult.ethernet) {
      return "You are now connected to ethernet";
    } else if (result == ConnectivityResult.bluetooth) {
      return "You are now connected to bluetooth";
    } else if (result == ConnectivityResult.none) {
      return "No connection available";
    } else {
      return "No Connection!!";
    }
  }
}
