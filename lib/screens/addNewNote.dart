// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:somapp/functions/functions.dart';
import 'package:somapp/widget/CustomText.dart';

class AddNewNote extends StatefulWidget {
  AddNewNote({Key? key}) : super(key: key);

  @override
  State<AddNewNote> createState() => _AddNewNoteState();
}

class _AddNewNoteState extends State<AddNewNote> {
  // final docMent = FirebaseFirestore.instance.collection('Notes').doc();
  // late final docMent = firestore.collection('Notes').doc();
  String date = "";

  DateTime selectedDate = DateTime.now();

  _selectDate(BuildContext context) async {
    final DateTime? selected = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2010),
      lastDate: DateTime(2025),
    );
    if (selected != null && selected != selectedDate) {
      setState(() {
        selectedDate = selected;
      });
    }
  }

  final title = TextEditingController();
  final description = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomText(
              text: 'Add New Note',
              color: Colors.black,
            ),
            SizedBox(
              height: 80,
            ),
            CustomeTextField(
              mycontorller: title,
              hintText: 'Enter your Title',
            ),
            Row(
              children: [
                Expanded(
                  child: CustomText(
                    text: 'Choose Date',
                    color: Colors.black,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    _selectDate(context);
                  },
                  icon: Icon(
                    Icons.date_range,
                  ),
                ),
                CustomText(
                  text:
                      '${selectedDate.day}/${selectedDate.month}/${selectedDate.year}',
                  color: Colors.black,
                )
              ],
            ),
            CustomeTextField(
              mycontorller: description,
              hintText: 'Write here your description',
            ),
            Row(
              children: [
                Expanded(
                    child: IconButton(
                        onPressed: () {
                          setState(() {
                            Timestamp myTimeStamp =
                                Timestamp.fromDate(selectedDate);
                            FirebaseFuncions.addUser(title.text,
                                description.text, '32a852', myTimeStamp);
                          });
                        },
                        icon: Icon(Icons.save))),
              ],
            )
          ],
        ),
      ),
    );
  }
}

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
    return TextField(
      controller: mycontorller,
      onChanged: (value) {},
      style: TextStyle(color: Colors.black, fontSize: 18),
      decoration: InputDecoration(
        suffix: Icon(Icons.save),
        hintText: hintText,
        contentPadding: EdgeInsets.all(18),
        border: OutlineInputBorder(),
      ),
    );
  }
}
