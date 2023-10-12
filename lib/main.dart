import 'package:clockiest/mainscreen.dart';
import 'package:clockiest/timerDb.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:clockiest/Themes/lighttheme.dart';
import 'package:clockiest/Themes/darktheme.dart';
void main() {
  runApp(ChangeNotifierProvider<TimerDb>(
    create: (context){
      return TimerDb();
    },
    child: MaterialApp(
      darkTheme: darkTheme,
      theme: lightTheme,
      initialRoute: mainScreen.ScreenID,
      routes: {
        mainScreen.ScreenID : (context){
          return mainScreen();
        }
      } ,
    ),
  ));
}
