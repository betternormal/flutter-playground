import 'package:flutter/material.dart';
import 'package:local_database/utilities/constants.dart';
class TextFieldOutline extends StatelessWidget {

  final TextEditingController textEditingController;
  final String hintText;

  TextFieldOutline({required this.textEditingController, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return TextField(
        controller: textEditingController,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.right,
        decoration: InputDecoration(
          hintText: hintText,
          border: kGreyBorder
        ));
  }
}