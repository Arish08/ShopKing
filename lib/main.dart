import 'package:flutter/material.dart';
import 'package:shopking/utils/routes.dart';
import 'package:shopking/widgets/themes.dart';
import 'pages/home_page.dart';
import 'pages/login_page.dart';
import 'utils/routes.dart';
import 'pages/cart_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.system,
      theme: MyTheme.LightTheme(context),
      darkTheme: MyTheme.DarkTheme(context),
      debugShowCheckedModeBanner: false,
      //initialRoute: MyRoutes.homeRoute,
      routes: {
        "/": (context) => LoginPage(),
        MyRoutes.homeRoute: (context) => HomePage(),
        MyRoutes.loginRoute: (context) => LoginPage(),
        MyRoutes.CartRoute: (context) => CartPage(),
      },
    );
  }
}
