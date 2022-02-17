import 'package:flutter/material.dart';
import '../screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Expenses App',
        home: HomeScreen(),
        theme: ThemeData(
            primarySwatch: Colors.amber,
            accentColor: Colors.orange,
            fontFamily: 'Quicksand',
            textTheme: ThemeData.light().textTheme.copyWith(
                subtitle1: TextStyle(fontFamily: 'OpenSans', fontSize: 18),
                button: TextStyle(color: Colors.white)),
            appBarTheme: AppBarTheme(
                textTheme: ThemeData.light().textTheme.copyWith(
                    subtitle1: TextStyle(
                        fontFamily: 'OpenSans',
                        fontSize: 20,
                        fontWeight: FontWeight.bold)))));
  }
}
