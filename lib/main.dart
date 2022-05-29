import 'package:clock_app/models/enums.dart';
import 'package:clock_app/models/menu_info.dart';
import 'package:clock_app/views/my_homepage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Clock',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ChangeNotifierProvider<MenuInfo>(
        create: (context) => MenuInfo(MenuType.clock, title: 'Clock', imageSource: 'assets/clock_icon'),
        child: MyHomePage(),
      ),
    );
  }
}