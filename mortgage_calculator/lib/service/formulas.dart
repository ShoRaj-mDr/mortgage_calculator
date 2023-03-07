import 'package:mortgage_calculator/util/constant.dart';
import 'dart:math';

//work on the unit testing for the formual
mortgagePaymentFormula(double loanAmount, double interestRate, int loanTerm) {
  //declaring formula variables
  double monthlyInterestRate = interestRate / 100 / Constant.MONTHS_IN_A_YEAR;
  int numberOfPayments = loanTerm * Constant.MONTHS_IN_A_YEAR;
  double numerator =
      monthlyInterestRate * (pow(1 + monthlyInterestRate, numberOfPayments));
  double denominator = pow(1 + monthlyInterestRate, numberOfPayments) - 1;

  return loanAmount * (numerator / denominator);
}
