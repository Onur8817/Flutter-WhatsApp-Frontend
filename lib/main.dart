import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:puan/Screens/Home.dart';
import 'package:puan/Screens/Person.dart';
import 'package:puan/Screens/userChat.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.green.shade300),
      initialRoute: "/",
      routes: {
        "/": (context) => LoginWidget(),
        "/userChat": (context) => UserChat(),
        "/personPage" : (context) => PersonPage(), 
      },
    );
  }
}
