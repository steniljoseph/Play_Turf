import 'package:get/get.dart';
import 'package:play_turf/main.dart';
import 'package:play_turf/view/home_screen/home.dart';
import 'package:play_turf/view/pageview/pageview.dart';
import 'package:play_turf/view/sign_in/signin.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NavigationController extends GetxController {
  @override
  void onInit() {
    getdata();
    super.onInit();
  }

  void getdata() async {
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    final value = sharedPreferences.getBool(savedKey);
    final onboardvalue = sharedPreferences.getBool(onboardKey);
    if (value == true) {
      navtoHome();
    } else if (onboardvalue == true) {
      navtoLogin();
    } else {
      navtoOnboard();
    }
  }

  Future navtoHome() async {
    Future.delayed(const Duration(seconds: 3), () {
      Get.offAll(() => HomePage(),
          transition: Transition.fade, duration: const Duration(milliseconds: 700));
    });
  }

  Future navtoLogin() async {
    Future.delayed(const Duration(seconds: 3), () {
      Get.offAll(() => SignInPage(),
          transition: Transition.fade, duration: const Duration(milliseconds: 700));
    });
  }

  Future navtoOnboard() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(onboardKey, true);

    Future.delayed(const Duration(seconds: 3), () {
      Get.offAll(() => const PageViewScreen(),
          transition: Transition.fade, duration: const Duration(milliseconds: 700));
    });
  }
}
