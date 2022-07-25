import 'package:get/get.dart';
import 'package:play_turf/Views/Pages/pageview/pageview.dart';

class SplashScreenController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    navigate();
  }

  navigate() async {
    await Future.delayed(const Duration(seconds: 2));
    Get.off(const PageViewScreen());
  }
}
