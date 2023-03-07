import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mortgage_calculator/components/ProviderPageController.dart';
import 'package:mortgage_calculator/model/mortgage.dart';
import 'package:mortgage_calculator/views/monthly_payment_screen.dart';

import 'AmortizationTable.dart';

Mortgage mortgage = GetIt.instance.get<Mortgage>();
double p = 400000;
double r = 5;
double t = 30;

class CustomPageView extends StatefulWidget {
  const CustomPageView({Key? key}) : super(key: key);

  @override
  State<CustomPageView> createState() => _CustomPageViewState();
}

class _CustomPageViewState extends State<CustomPageView> {
  final PageController _pageController = PageController(initialPage: 0);

  // index of current page
  // int _activePage = 0;

  // List<Widget> _pages = [
  //   MonthlyPaymentScreen(),
  //   // const PageOne(),
  //   // const PageTwo(),
  //   // const PageThree(),
  // ];

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
                MonthlyPaymentScreen(),
                PageOne(),
                AmortizationTable(),
                // PageTwo(),
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




// test with button stateful PageTwo
// class _PageTwoState extends State<PageTwo> {
//   double principal = mortgage.principal;
//   double rate = mortgage.interestRate;
//   double term = 30;

//   double monthlyPayment = 0.0;
//   double result = 0;
//   var myList = [];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             SizedBox(height: 20),
//             SizedBox(height: 20),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 double monthlyInterestRate = rate / 100 / 12;
//                 double totalPayments = term * 12;

//                 // formula here
//                 double factor = monthlyInterestRate *
//                     pow(1 + monthlyInterestRate, totalPayments) /
//                     (pow(1 + monthlyInterestRate, totalPayments) - 1);
//                 monthlyPayment = principal * factor;

//                 print('intial loan amount: ' + principal.toStringAsFixed(2));

//                 // loop over the loan terms
//                 for (var i = 1; i <= totalPayments; i++) {
//                   result = principal *
//                       (pow(1 + monthlyInterestRate, totalPayments) -
//                           pow(1 + monthlyInterestRate, i)) /
//                       (pow(1 + monthlyInterestRate, totalPayments) - 1);

//                   print('month: ' + i.toString() + ' : ' + result.toString());
//                   myList.add(result);
//                 }

//                 // print(myList);

//                 setState(() {});
//               },
//               child: Text('Calculate'),
//             ),
//             SizedBox(height: 16),
//             Text('Monthly Payment: \$${monthlyPayment.toStringAsFixed(2)}'),
//             Text('Principal Payment: \$${result.toStringAsFixed(2)}'),
//           ],
//         ),
//       ),
//     );
//   }
// }




// class PageTwo extends StatefulWidget {
//   // double principal = 0.0;
//   // double rate = 0.0;
//   // double term = 0.0;
//   // double monthlyPayment = 0.0;
//   // double result = 0;
//   // var myList = [];

//   const PageTwo({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       alignment: Alignment.center,
//       color: Colors.blue,
//       child: const Text('Blue Page'),
//     );
//   }
// }

// Resource:
// using: https://github.com/andersoncscz/flutter-pageview-login
// another one : https://www.kindacode.com/article/flutter-pageview-examples/
