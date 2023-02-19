import 'package:flutter/material.dart';

class CustomMaterialButton extends StatelessWidget {
  final String buttonText;
  final double buttonWidth;
  final double buttonHeight;
  final VoidCallback onPressed;

  const CustomMaterialButton({
    Key? key,
    required this.buttonText,
    required this.onPressed,
    this.buttonWidth = double.infinity,
    this.buttonHeight = 60.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: buttonWidth,
      height: buttonHeight,
      onPressed: onPressed,
      shape: RoundedRectangleBorder(
          side: BorderSide(
            color: Colors.grey,
          ),
          borderRadius: BorderRadius.circular(35)),
      child: Text(
        buttonText,
        style: TextStyle(
            // fontFamily: 'Uni Sans',
            fontWeight: FontWeight.w600,
            fontSize: 15,
            color: Colors.black),
      ),
    );
  }
}
