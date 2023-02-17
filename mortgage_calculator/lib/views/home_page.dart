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
            prefixString: '\$',
          ),

          // Down Payment
          DefaultTextField(
            text: 'Down Payment',
            prefixString: '\$',
          ),

          // Loan Term
          // DefaultTextField(
          //   text: 'Loan Term',
          //   prefixIcon: Icons.timelapse_rounded,
          // ),
          loanTerm(),

          // Interest Rate
          DefaultTextField(
            text: 'Rate',
            prefixString: '\%',
          ),

          // ZipCode
          DefaultTextField(
            text: 'Zip code',
            prefixIcon: Icons.location_on_outlined,
          ),

          const SizedBox(
            height: 10,
          ),
        ],
      ),
    ));
  }
}

// not complete. watch this - https://www.youtube.com/watch?v=TPKFYq7I6Kk&t=1361s
loanTerm() {
  var loanYears = [30, 20, 15, 10];
  return Container(
    padding: EdgeInsets.all(7.0),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Text("Loan Term"),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: loanYears.map((e) => loanTermBtn(e)).toList(),
        ),
      ],
    ),
  );
}

Widget loanTermBtn(int numOfYears) {
  return Container(
    height: 54,
    width: 75,
    alignment: Alignment.center,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        // color: isSelected ? Colors.purple[100] : Colors.grey,
        color: Colors.grey.shade200),
    child: Text(
      numOfYears.toString(),
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w400,
        // color: isSelected ? Colors.white : Colors.black,
        color: Colors.black,
      ),
    ),
  );
}
