import 'package:flutter/material.dart';
import 'package:mortgage_calculator/components/CustomMaterialButton.dart';
import 'package:mortgage_calculator/components/textfield.dart';
import 'package:mortgage_calculator/views/monthly_payment_screen.dart';
import 'package:mortgage_calculator/util/constant.dart';
import 'package:mortgage_calculator/services/formulas.dart';

class HomePage extends StatefulWidget {
  @override
  HomePageFormState createState() => HomePageFormState();
}

// navigate to next screen
// void navigateToMontlyPaymentScreen(BuildContext context) {
//   print('Button pressed! Navigate to Montly Payment Screen');
//   Navigator.push(
//       context, MaterialPageRoute(builder: (context) => MonthlyPaymentScreen()));
// }

class HomePageFormState extends State<HomePage> {
  final _buildHomePriceController = TextEditingController();
  final _buildDownPayment = TextEditingController();
  final _buildRate = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      // backgroundColor: Colors.grey,
      body: Container(
        padding: EdgeInsets.all(15.0),
        child: ListView(
          children: [
            // home loan
            DefaultTextField(
              controller: _buildHomePriceController,
              text: Constant.HOME_PRICE,
              prefixString: '\$',
            ),

            // Down Payment
            DefaultTextField(
              controller: _buildDownPayment,
              text: Constant.DOWN_PAYMENT,
              prefixString: '\$',
            ),

            // function. add this separate maybe?
            loanTerm(),

            // Interest Rate
            DefaultTextField(
              controller: _buildRate,
              text: Constant.RATE,
              prefixString: '\%',
            ),

            // ZipCode
            DefaultTextField(
              text: Constant.ZIP_CODE,
              prefixIcon: Icons.location_on_outlined,
            ),

            const SizedBox(
              height: 29,
            ),

            // Add calculate payment button and navigate to montly payment screen
            CustomMaterialButton(
                buttonText: 'Calculate',
                onPressed: () {
                  Navigator.push(
                    context,
                    new MaterialPageRoute(
                      builder: (context) => new MonthlyPaymentScreen(
                          principal: _buildHomePriceController.text),
                    ),
                  );
                  print(_buildHomePriceController.text);
                  print(_buildDownPayment.text);
                  print(_buildRate.text);
                  mortgagePaymentFormula(
                    //Principal
                    double.parse(_buildHomePriceController.text),
                    //Annual Interest Rate
                    double.parse(_buildDownPayment.text),
                    //Term in Years
                    //int.parse(_buildRate.text),
                    30,
                    //Monthly Interest Rate
                    double.parse(_buildRate.text),
                  );
                  // navigateToMontlyPaymentScreen(context);
                }),
          ],
        ),
      ),
    );
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
        fontSize: 15,
        fontWeight: FontWeight.w400,
        // color: isSelected ? Colors.white : Colors.black,
        color: Colors.black,
      ),
    ),
  );
}
