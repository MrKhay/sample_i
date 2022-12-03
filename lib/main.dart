import 'package:flutter/material.dart';
import 'package:sample_i/page/home.dart';
import 'package:sample_i/page/login.dart';
import 'constant.dart';

void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {


    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Constants.brColor,

      ),
      home: Home()
    );
  }
}
