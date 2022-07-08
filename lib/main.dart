import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:play_turf/View/Pages/splash_screen/splash.dart';
import 'package:play_turf/model/savedkeys.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';

const savedKey = "SaveKey";
const onboardKey = "OnboardKey";

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefrenceModel.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
    return Sizer(
      builder: ((context, orientation, deviceType) {
        return GetMaterialApp(
          theme: ThemeData(
            fontFamily: 'Kodchasan',
            scaffoldBackgroundColor: Colors.white,
            appBarTheme: const AppBarTheme(
              color: Colors.white,
              elevation: 0,
              systemOverlayStyle: SystemUiOverlayStyle(
                statusBarBrightness: Brightness.light,
                statusBarColor: Colors.white,
                statusBarIconBrightness: Brightness.dark,
              ),
            ),
          ),
          debugShowCheckedModeBanner: false,
          title: 'Play Turf',
          home: SplashScreen(),
        );
      }),
    );
  }
}
