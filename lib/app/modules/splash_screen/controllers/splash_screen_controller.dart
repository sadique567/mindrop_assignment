import 'package:get/get.dart';
import 'package:mindropassignment/app/routes/app_pages.dart';

class SplashScreenController extends GetxController {
  //TODO: Implement SplashScreenController

  final count = 0.obs;
  @override
  void onInit() async {
    super.onInit();
Future.delayed(Duration(seconds: 2) , () {
  Get.toNamed(Routes.HOME_SCREEN);
},);

  }

  
}
