import 'package:final_project/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:theme_manager/theme_manager.dart';

main(){
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ThemeManager(
      defaultBrightnessPreference: BrightnessPreference.system,
      data: (Brightness brightness)=> ThemeData(
        primarySwatch: Colors.cyan,
        accentColor: Colors.cyanAccent,
        brightness: brightness,
      ),
      loadBrightnessOnStart: true,
      themedWidgetBuilder: (BuildContext context , ThemeData theme){
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'DSC World',
          home: MySplashScreen(),
          theme: theme,
        );
      },
    );
  }
}




