import 'package:get_it/get_it.dart';
import 'package:mortgage_calculator/model/mortgage.dart';

final GetIt getIt = GetIt.instance;

void setUp() {
  //default values for
  getIt.registerLazySingleton(
      () => Mortgage(principal: 425000, loanTerm: 30, interestRate: 0.05));
}
