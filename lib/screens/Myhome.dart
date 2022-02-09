// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:somapp/screens/exportScreens.dart';
import 'package:somapp/widget/Widgets.dart';

class Myhome extends StatefulWidget {
  const Myhome({Key? key}) : super(key: key);

  static String id = 'Home';
  @override
  _MyhomeState createState() => _MyhomeState();
}

class _MyhomeState extends State<Myhome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: "My note",
          color: Colors.black,
          size: 34,
          fontWeight: FontWeight.w700,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.filter_alt_outlined,
              color: Colors.black,
            ),
          ),
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 56,
              margin: EdgeInsets.symmetric(horizontal: 1, vertical: 15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                style: TextStyle(color: Colors.black),
                autocorrect: true,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  suffixIcon: Icon(Icons.search),
                  hintText: 'Searching...',
                ),
              ),
            ),

            //View My note
            ViewMyNotes(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueGrey,
        elevation: 20,
        onPressed: () {
          Navigator.pushNamed(context, AddNewNote.id);
          // Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //       builder: (context) => AddNewNote(),
          //     ));
        },
        child: Icon(
          Icons.note_alt,
        ),
      ),
    );
  }
}
