import 'package:flutter/material.dart';
import 'package:mortgage_calculator/components/ProviderPageController.dart';
import 'package:mortgage_calculator/views/monthly_payment_screen.dart';

class CustomPageView extends StatefulWidget {
  final double? monthlyRate;

  const CustomPageView({Key? key, this.monthlyRate}) : super(key: key);

  @override
  State<CustomPageView> createState() => _CustomPageViewState();
}

class _CustomPageViewState extends State<CustomPageView> {
  final PageController _pageController = PageController(initialPage: 0);

  // index of current page
  int _activePage = 0;

  List<Widget> _pages = [
    const MonthlyPaymentScreen(),
    const PageOne(),
    const PageTwo(),
    // const PageThree(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          ProviderPageController(
            pageController: _pageController,
            child: PageView(
              controller: _pageController,
              children: <Widget>[
                //PageOne(),
                MonthlyPaymentScreen(monthlyPayment: widget.monthlyRate),
                PageTwo(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// PageOne fragment
class PageOne extends StatelessWidget {
  const PageOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: Colors.green,
      child: const Text('Green Page'),
    );
  }
}

// PageOne fragment
class PageTwo extends StatelessWidget {
  const PageTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: Colors.blue,
      child: const Text('Blue Page'),
    );
  }
}

// Resource:
// using: https://github.com/andersoncscz/flutter-pageview-login
// another one : https://www.kindacode.com/article/flutter-pageview-examples/
