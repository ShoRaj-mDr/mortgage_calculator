import 'package:flutter/material.dart';
import 'package:mortgage_calculator/views/monthly_payment_screen.dart';

class CustomPageView extends StatefulWidget {
  const CustomPageView({Key? key}) : super(key: key);

  @override
  State<CustomPageView> createState() => _CustomPageViewState();
}

class _CustomPageViewState extends State<CustomPageView> {
  final PageController _pageController = PageController(initialPage: 0);

  // index of current page
  int _activePage = 0;

  List<Widget> _pages = [
    // const MonthlyPaymentScreen(principal: '1500'),
    const PageOne(),
    const PageTwo(),
    // const PageThree(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
              controller: _pageController,
              onPageChanged: (int page) {
                setState(() {
                  _activePage = page;
                });
              },
              itemCount: _pages.length,
              itemBuilder: (BuildContext context, int index) {
                return _pages[index % _pages.length];
              })
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



// Note: 
// pageview youtube: https://www.youtube.com/watch?v=uPaH7aJZs-M