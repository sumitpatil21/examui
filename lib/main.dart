import 'package:examui/AllScreen/CartScreen.dart';
import 'package:examui/AllScreen/DetailsScreen.dart';
import 'package:examui/AllScreen/HomePage.dart';
import 'package:flutter/material.dart';

void main()
{
  runApp(MyEcomApp());
}
class MyEcomApp extends StatelessWidget {
  const MyEcomApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/":(context) => HomeScreen(),
        "/detail":(context) => DetailPage(),
        "/add":(context) => AddToCart(),
      },
    );
  }
}

