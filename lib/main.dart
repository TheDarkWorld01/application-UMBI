import 'package:flutter/material.dart';
import 'package:umbiapps/pages/Homepage.dart';
import 'package:umbiapps/pages/CartPage.dart';
import 'package:umbiapps/pages/ItemPage.dart';

void main()=> runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
       scaffoldBackgroundColor: Colors.white,
      ), //ThemeData
      routes: {
        "/" : (context) => HomePage(),
        "CartPage" : (context) => CartPage(),
        "ItemPage": (context) => ItemPage(),
      },
    ); //MaterialApp
  }
}