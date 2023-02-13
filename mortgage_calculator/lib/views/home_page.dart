import 'package:flutter/material.dart';
import 'package:mortgage_calculator/components/textfield.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: Colors.grey[100],
        body: Container(
      padding: EdgeInsets.all(15.0),
      child: ListView(
        children: [
          // home loan
          DefaultTextField(
            text: 'Home Price',
          ),

          // Down Payment
          DefaultTextField(
            text: 'Down Payment',
          ),

          // Loan Term
          DefaultTextField(
            text: 'Loan Term',
          ),

          // Interest Rate
          DefaultTextField(
            text: 'Interest Rate',
          ),

          // ZipCode
          DefaultTextField(
            text: 'ZipCode',
          ),
          const SizedBox(
            height: 10,
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Optional Parameters',
                  style: TextStyle(
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    ));
  }
}
