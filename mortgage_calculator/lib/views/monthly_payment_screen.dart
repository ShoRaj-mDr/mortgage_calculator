import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mortgage_calculator/components/circleProgress.dart';
import 'package:mortgage_calculator/model/mortgage.dart';
import 'package:mortgage_calculator/util/constant.dart';
import 'package:mortgage_calculator/views/home_page.dart';

// ignore: must_be_immutable
class MonthlyPaymentScreen extends StatefulWidget {
  @override
  _BreakdownPageState createState() => _BreakdownPageState();
}

class _BreakdownPageState extends State<MonthlyPaymentScreen> {
  Mortgage mortgage = GetIt.instance.get<Mortgage>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.withOpacity(0.25),
      body: getBody(context, mortgage),
    );
  }
}

Widget getBody(BuildContext context, Mortgage mortgage) {
  var size = MediaQuery.of(context).size;
  return SingleChildScrollView(
    child: Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.only(
                top: 20, left: 20, right: 100, bottom: 20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    // IconButton(
                    //   icon: Icon(
                    //     Icons.arrow_back_ios,
                    //   ),
                    //   onPressed: () => {Navigator.pushNamed(context, '/home')},
                    // ),
                    Text(
                      Constant.MONTHLY_PAYMENT,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // ),
        ),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Container(
            padding: EdgeInsets.all(5.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Monthly payment breakdown",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 13,
                            color: Colors.black.withOpacity(0.5)),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        child: CircleProgressBar(),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        child: Column(
                          children: [
                            PaymentDetailSection(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            // ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
      ],
    ),
  );
}

class PaymentDetailSection extends StatelessWidget {
  String bill = 'Dynamic data';
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 315,
      padding: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        children: [
          buildPaymentDetailRow("Principal & interest", Colors.purple),
          buildPaymentDetailRow("Homeowner's insurance", Colors.green),
          buildPaymentDetailRow("Property tax", Colors.red),
          buildPaymentDetailRow("HOA fees", Colors.orange),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Total monthly payment \t   =   \$   $bill",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: Colors.black),
              ),
            ],
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
        height: 20,
        width: 20,
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
              padding: EdgeInsets.all(15.0),
              //padding: const EdgeInsets.only(left: 15.0, top: 15.0),
              child: Column(
                children: [
                  Text(
                    "\$",
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                ],
              ),
            ),
            contentPadding: EdgeInsets.only(left: 15.0, top: 15.0),
          ),
        ),
      ),
    ],
  );
}
