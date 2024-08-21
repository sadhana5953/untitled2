import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:untitled2/home/View/HomeScreen/homePage.dart';
import 'package:untitled2/home/View/SplashScreen/splashScreen.dart';

void main() {
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //  CounterController controller=Get.put(CounterController());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      // darkTheme: ThemeData(
      //   colorScheme: ColorScheme.light(
      //     primary: Colors.white,
      //     secondary: Colors.deepPurpleAccent,
      //     onSecondary: Colors.purpleAccent,
      //   )
      // ),
      // theme: ThemeData(
      //     colorScheme: ColorScheme.dark(
      //       onSecondary: Colors.white,
      //       primary: Colors.black12,
      //       secondary: Colors.blue,
      //     )
      // ),
      // themeMode: (controller.isDark.value==true)?ThemeMode.light:ThemeMode.dark,
      getPages: [
        GetPage(
          name: '/',
          page: () => SplashScreen(),
        ),
      ],
    );
  }
}
