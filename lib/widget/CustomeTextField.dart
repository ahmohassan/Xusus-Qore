// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class CustomeTextField extends StatelessWidget {
  CustomeTextField({
    this.hintText,
    this.onChanged,
    Key? key,
    this.mycontorller,
  }) : super(key: key);

  void Function(String)? onChanged;
  String? hintText;
  final mycontorller;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 56,
      margin: const EdgeInsets.symmetric(horizontal: 1, vertical: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        controller: mycontorller,
        textInputAction: TextInputAction.next,
        onChanged: (value) {},
        style: const TextStyle(color: Colors.black, fontSize: 18),
        decoration: InputDecoration(
          // suffix: Icon(Icons.save),
          hintText: hintText,
          contentPadding: const EdgeInsets.all(18),
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }
}
