// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:somapp/functions/functions.dart';
import 'package:somapp/widget/Widgets.dart';

class AddNewNote extends StatefulWidget {
  const AddNewNote({Key? key}) : super(key: key);
static String id = 'AddNew note paage';
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
      firstDate: DateTime(2016),
      lastDate: DateTime(2050),
    );
    try {
      if (selected != null && selected != selectedDate) {
        setState(
          () {
            selectedDate = selected;
          },
        );
      }
    } catch (e) {
      print(e);
    }
  }

  final title = TextEditingController();
  final description = TextEditingController();

  Color pickerColor = Color(0xff443a49);

  void changeColor(Color color) {
    setState(() => pickerColor = color);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 50,
              ),
              CustomText(
                text: 'Add New Note',
                color: Colors.black,
              ),
              SizedBox(
                height: 10,
              ),
              CustomeTextField(
                mycontorller: title,
                hintText: 'Enter your Title',
              ),
              Row(
                children: [
                  CustomText(
                    onPressed: () => _selectDate(context),
                    text: 'Choose Date',
                    color: Colors.black,
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
                    onPressed: () => _selectDate(context),
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    onPressed: () => pickColor(context),
                    text: 'Pic Color ',
                    color: Colors.black,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  GestureDetector(
                    onTap: () => pickColor(context),
                    child: Container(
                      margin: EdgeInsets.all(10),
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: pickerColor,
                      ),
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Expanded(
                      child: Container(
                    width: double.infinity,
                    height: 56,
                    margin: EdgeInsets.symmetric(horizontal: 1, vertical: 15),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: IconButton(
                        onPressed: () {
                          setState(() {
                            Timestamp myTimeStamp =
                                Timestamp.fromDate(selectedDate);
                            FirebaseFuncions.addUser(
                                title.text,
                                description.text,
                                pickerColor.toString(),
                                myTimeStamp);
                            FocusScope.of(context).requestFocus(FocusNode());
                            description.clear();
                            title.clear();
                          });
                        },
                        icon: Icon(Icons.save)),
                  )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildColorPicker() {
    return ColorPicker(
      pickerColor: pickerColor,
      showLabel: false,
      enableAlpha: false,
      onColorChanged: (color) => setState(() {
        pickerColor = color;
      }),
    );
  }

  pickColor(BuildContext context) => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: CustomText(
            text: 'Pic your color',
            color: Colors.black,
            size: 34,
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              buildColorPicker(),
              TextButton(
                child: CustomText(
                  text: 'Select',
                  color: Colors.blue,
                ),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
          ),
        ),
      );
}
