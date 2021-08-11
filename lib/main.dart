import 'package:boxtox/style/color.dart';
import 'package:boxtox/view/home.dart';
import 'package:boxtox/view/tracking.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.transparent,
        statusBarColor: Colors.transparent, // status bar color
        statusBarIconBrightness: Brightness.light, // status bar icons' color
        systemNavigationBarIconBrightness: Brightness.light,
      ),
    );

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          fontFamily: 'PM',
          hintColor: primer,
          primaryColor: primer,
          hoverColor: primer,
          backgroundColor: Colors.white,
          accentColor: primer,
          textSelectionTheme: TextSelectionThemeData(
            cursorColor: primer,
            selectionColor: primer,
            selectionHandleColor: primer,
          ),
        ),
        initialRoute: '/',
        getPages: [
          GetPage(name: '/', page: () => Home()),
          GetPage(name: '/tracking', page: () => Tracking()),
        ],
      ),
    );
  }
}
