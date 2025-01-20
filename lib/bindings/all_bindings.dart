import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:wecredit/controllers/home_screen_controller/home_controller.dart';
import '../controllers/splash_screen_controller/splash_controller.dart';

class AllBindings{
Future initializeBindings() async{
  Get.lazyPut<SplashController>(()=> SplashController(), fenix: true,);
  Get.lazyPut<HomeController>(()=> HomeController(), fenix: true,);

}
}