import 'package:flutter/material.dart';

class DefaultTextField extends StatelessWidget {
  final controller;
  final String text;
//   final bool obscureText;

  const DefaultTextField({
    Key? key,
    this.controller,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 7.5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7),
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade200),
          ),
          fillColor: Colors.grey.shade100,
          filled: true,
          labelText: text,
          labelStyle: TextStyle(
              // color: Color(0xFF6200EE),
              ),
        ),
      ),
    );
  }
}


// link - https://www.youtube.com/watch?v=Dh-cTQJgM-Q