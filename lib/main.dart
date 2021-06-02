import 'package:flutter/material.dart';
import 'package:flutter_application/core/store.dart';
import 'package:flutter_application/pages/cart_page.dart';
import 'package:flutter_application/widgets/theme.dart';

import 'package:velocity_x/velocity_x.dart';
import 'pages/home_page.dart';
import 'pages/loginpage.dart';
import 'utils/route.dart';


void main() {
  runApp(VxState
  ( store: Mystore(),
    child: MyApp())
  );
}

class MyApp extends StatelessWidget {
 
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      theme: MyTheme.darkTheme(context),
    
      //home:HomePage(),
      routes: {
           "/":(context)=>HomePage(),
           MyRoute.homeRoute:(context)=>HomePage(),
           MyRoute.loginRoute:(context)=>LoginPage(),
            MyRoute.cartRoute:(context)=>Cart(),
      },
    );
  }
}







