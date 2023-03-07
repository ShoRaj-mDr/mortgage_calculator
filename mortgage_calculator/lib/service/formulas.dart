import 'package:mortgage_calculator/util/constant.dart';
import 'dart:math';

//work on the unit testing for the formual
mortgagePaymentFormula(double principal, double annualInterestRate,
    int termInYears, double monthlyInterestRate) {
  int numberOfPayments = termInYears * Constant.MONTHS_IN_A_YEAR;

  // Monthly payment calculator
  double monthlyPayment = principal *
      (monthlyInterestRate * (pow(1 + monthlyInterestRate, numberOfPayments))) /
      ((pow(1 + monthlyInterestRate, numberOfPayments)) - 1);

  print("monthlyPayment");
  print(monthlyPayment);
  return monthlyPayment;
}

//convert all the dollor amount (prices) into 2 two decimal places. round by the two decimal places
decimalConversion(double montlyPayment) {}

//morgage payment formula in JAVA
//https://www.youtube.com/watch?v=7qsrRlOqv4c

Future<double> calculateMonthlyPayment(
    double principal, double interestRate, double loanTerm) async {
  double monthlyInterestRate = interestRate / 12 / 100; // after percentage
  double totalPaymentMonths = loanTerm * 12;

  double factor = monthlyInterestRate *
      pow(1 + monthlyInterestRate, totalPaymentMonths) /
      (pow(1 + monthlyInterestRate, totalPaymentMonths) - 1);
  double monthlyPayment = principal * factor;

  return monthlyPayment;
}

List<List> calculateAmortizationTable(
    double principal, double interestRate, double loanTerm) {
  double monthlyPayment =
      calculateMonthlyPayment(principal, interestRate, loanTerm) as double;
  double monthlyInterestRate = interestRate / 12 / 100;
  double totalPayments = loanTerm * 12;

  List<List> result = [];

  double currentBalance = principal;
  for (int i = 0; i < totalPayments; i++) {
    List templist =
        []; // example: [[monthlyPrincipal, monthlyInterest, currentBalance]]

    double monthlyInterest = currentBalance * monthlyInterestRate;
    double monthlyPrincipal = monthlyPayment - monthlyInterest;
    currentBalance = currentBalance - monthlyPrincipal;

    templist.add(monthlyPrincipal);
    templist.add(monthlyInterest);
    templist.add(currentBalance);

    result.add(templist);
  }

  return result;
}
