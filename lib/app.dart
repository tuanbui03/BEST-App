import 'package:best/features/authentication/screens/onboarding/onboarding.dart';
import 'package:best/utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// Use this class to setup themes
class App extends StatelessWidget{
  const App({super.key});

  @override
  Widget build (BuildContext context){
    return GetMaterialApp(
      themeMode: ThemeMode.system,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      home: const OnBoardingScreen(),debugShowCheckedModeBanner: false,
    );
  }
}