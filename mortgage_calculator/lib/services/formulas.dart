import 'package:mortgage_calculator/util/constant.dart';
import 'dart:math';

//work on the unit testing for the formual
mortgagePaymentFormula(double principal, double annualInterestRate,
    int termInYears, double monthlyInterestRate, int numberOfPayments) {
  numberOfPayments = termInYears * Constant.MONTHS_IN_A_YEAR;

  // Monthly payment calculator
  double monthlyPayment = principal *
      (monthlyInterestRate * (pow(1 + monthlyInterestRate, numberOfPayments))) /
      ((pow(1 + monthlyInterestRate, numberOfPayments)) - 1);

  return monthlyPayment;
}

//convert all the dollor amount (prices) into 2 two decimal places. round by the two decimal places
decimalConversion(double montlyPayment) {}

//morgage payment formula in JAVA 
//https://www.youtube.com/watch?v=7qsrRlOqv4c
