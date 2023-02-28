import 'package:flutter/material.dart';

class ProviderPageController extends InheritedWidget {
  final PageController pageController;
  final Widget child;

  ProviderPageController({required this.pageController, required this.child})
      : super(child: child);

  static ProviderPageController of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<ProviderPageController>()
          as ProviderPageController;

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return oldWidget != this;
  }

  void toPage(int page) {
    pageController.animateToPage(page,
        duration: Duration(milliseconds: 350), curve: Curves.easeInOut);
  }
}
