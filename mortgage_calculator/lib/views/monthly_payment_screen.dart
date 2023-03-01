import 'package:flutter/material.dart';
import 'package:mortgage_calculator/components/CustomMaterialButton.dart';
import 'package:mortgage_calculator/components/circleProgress.dart';
import 'package:mortgage_calculator/util/constant.dart';

// ignore: must_be_immutable
class MonthlyPaymentScreen extends StatelessWidget {
  final double? monthlyPayment;
  const MonthlyPaymentScreen({this.monthlyPayment});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(Constant.MONTHLY_PAYMENT),
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () => {Navigator.of(context).pop()},
        ),
      ),
      backgroundColor: Colors.white,
      body: Container(
        child: ListView(
          children: [
            // Header
            Align(
              alignment: Alignment.center,
              child: Column(
                children: [
                  //Build Custom Circle Progress Bar
                  CircleProgressBar(
                    totalPayment: monthlyPayment,
                  ),
                  //Build Payment Detail Section
                  PaymentDetailSection(),
                  CustomMaterialButton(
                    buttonText: 'Recalculate',
                    onPressed: () {
                      // Navigator.push(
                      //   context,
                      //   new MaterialPageRoute(
                      //     builder: (context) => new MonthlyPaymentScreen(
                      //         monthlyPayment: monthlyPayment),
                      //   ),
                      // );
                    },
                  )
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
