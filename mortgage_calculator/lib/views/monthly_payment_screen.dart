import 'package:flutter/material.dart';
import 'package:mortgage_calculator/components/circleProgress.dart';

// ignore: must_be_immutable
class MonthlyPaymentScreen extends StatelessWidget {
  final String principal;
  const MonthlyPaymentScreen({this.principal = ""});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      backgroundColor: Colors.white,
      body: Container(
        child: Column(
          children: [
            // Header
            Align(
              alignment: Alignment.center,
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Monthly",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Payment",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  //Build Custom Circle Progress Bar
                  CircleProgressBar(
                    totalPayment: double.parse(principal),
                  ),
                  //Build Payment Detail Section
                  PaymentDetailSection()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PaymentDetailSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 315,
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        children: [
          buildPaymentDetailRow("Principal & interest", Colors.purple),
          buildPaymentDetailRow("Homeowner's insurance", Colors.green),
          buildPaymentDetailRow("Property tax", Colors.red),
          buildPaymentDetailRow("HOA fees", Colors.orange),
          Spacer(),
          //Add recalculation Button
          TextButton(
            onPressed: null,
            child: Text(
              "Recalculate",
            ),
          ),
        ],
      ),
    );
  }
}

Widget buildPaymentDetailRow(String rowText, Color rowColor) {
  return Row(
    children: [
      Container(
        height: 30,
        width: 30,
        decoration: BoxDecoration(
          color: rowColor,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      SizedBox(
        width: 10,
      ),
      Expanded(
        flex: 2,
        child: Text(
          rowText,
          style: TextStyle(fontSize: 15),
        ),
      ),
      SizedBox(
        width: 110,
        child: TextField(
          decoration: InputDecoration(
              prefixIcon: Padding(
                padding: const EdgeInsets.only(left: 15.0, top: 15.0),
                child: Column(
                  children: [
                    Text(
                      "\$",
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                  ],
                ),
              ),
              contentPadding: EdgeInsets.only(left: 15.0, top: 15.0)),
        ),
      ),
    ],
  );
}
