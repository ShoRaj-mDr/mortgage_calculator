import 'package:flutter/material.dart';
import 'package:mortgage_calculator/views/home_page.dart';
import 'package:mortgage_calculator/views/monthly_payment_screen.dart';

void main() {
  runApp(MyApp());
}

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MyApp();
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Morgage Calculator',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity),
      home: HomePage(),
      //  home: MonthlyPaymentScreen(),
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/home': (context) => HomePage(),
        '/payment': (context) => MonthlyPaymentScreen(),
      },
    );
  }
}
