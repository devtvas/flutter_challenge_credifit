import 'package:crud2/app/controllers/product_controller.dart';
import 'package:crud2/app/util/custom_color.dart';
import 'package:crud2/app/views/home/components/custom_text.dart';
import 'package:crud2/app/views/home/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';

class AppWidget extends GetWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: HomeView(),
    );
  }
}
