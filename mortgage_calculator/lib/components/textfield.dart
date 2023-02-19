import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DefaultTextField extends StatelessWidget {
  final controller;
  final String text;
  final String? prefixString;
  final IconData? prefixIcon;
  //   final bool obscureText;

  const DefaultTextField({
    Key? key,
    this.controller,
    required this.text,
    this.prefixString,
    this.prefixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget? my_prefix;
    if (prefixString != null) {
      my_prefix = Text(
        prefixString!,
        style: TextStyle(fontSize: 18),
      );
    } else if (prefixIcon != null) {
      my_prefix = Icon(prefixIcon);
    }

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7),
      ),
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.number,
        // inputFormatters: <TextInputFormatter>[
        //   FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d{0,2}')),
        // ],
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          prefixIcon: SizedBox(
            child: Center(
              widthFactor: 0.0,
              child: my_prefix,
            ),
          ),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(20)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade200),
              borderRadius: BorderRadius.circular(20)),
          fillColor: Colors.grey.shade100,
          filled: true,
          labelText: text,
          labelStyle: TextStyle(
            // color: Color(0xFF6200EE),
            fontWeight: FontWeight.w300,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}

// link - https://www.youtube.com/watch?v=Dh-cTQJgM-Q
