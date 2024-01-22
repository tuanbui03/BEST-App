import 'package:best/utils/theme/theme.dart';
import 'package:flutter/material.dart';

/// Use this class to setup themes
class App extends StatelessWidget{
  const App({super.key});

  @override
  Widget build (BuildContext context){
    return MaterialApp(
      themeMode: ThemeMode.system,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
    );
  }
}