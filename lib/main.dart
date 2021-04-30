import 'package:bytebank/screens/dasboard.dart';
import 'package:flutter/material.dart';

void main() => runApp(ByteBankApp());

class ByteBankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.lightGreen[400],
        accentColor: Colors.amberAccent[400],
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.amberAccent[400],
          textTheme: ButtonTextTheme.primary,
        ),
      ),
      home: Dashboard(),
    );
  }
}
