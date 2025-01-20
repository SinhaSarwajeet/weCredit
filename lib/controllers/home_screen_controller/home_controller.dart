import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../constants/string_constants.dart';

class HomeController extends GetxController {
  HomeController();

  Rx<int> currentIndex = Rx(0);
  Rx<int> currentIndexPartnersCarousel = Rx(0);
  Rx<String> buttonText = Rx(StringConstants.LOANS);
}