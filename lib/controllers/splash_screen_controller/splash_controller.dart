import 'package:get/get.dart';
import 'package:wecredit/view/home/home.dart';

class SplashController extends GetxController{

  SplashController();

  @override
  void onInit() {
    super.onInit();
    loadSplash();
  }
  Future loadSplash() async{
    await Future.delayed(const Duration(milliseconds: 2000));
    Get.offAll(()=> Home());
  }
}