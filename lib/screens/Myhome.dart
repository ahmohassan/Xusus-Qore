// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:somapp/Models/Notes.dart';
import 'package:somapp/screens/exportScreens.dart';
import 'package:somapp/widget/Widgets.dart';

class Myhome extends StatefulWidget {
  const Myhome({Key? key}) : super(key: key);

  @override
  _MyhomeState createState() => _MyhomeState();
}

class _MyhomeState extends State<Myhome> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  // void getnote() async {
  //   final NoteRef = firestore.collection('Notes');
  //   final data = await NoteRef.get();
  //   // NoteRef.doc('hlTsME0ZMWNNnxvFUC9E').delete();
  //   // print(data.docs[1].data().toString());
  //   Notes notes = Notes.fromjson(data.docs[0].data());
  //   print(notes.date);

  // }
  // Future<Notes> getnote() async {
  //   final NoteRef = firestore.collection('Notes');
  //   final data = await NoteRef.get();
  //   // NoteRef.doc('hlTsME0ZMWNNnxvFUC9E').delete();
  //   // print(data.docs[1].data().toString());
  //   Notes notes = Notes.fromjson(data.docs[0].data());
  //   print(notes.date);
  //   return notes;
  // }
  Future<List<Notes>> getnote() async {
    final NoteRef = firestore.collection('Notes');
    final data = await NoteRef.get();
    // List<Notes> Mynotes = [];
    // for (int index = 0; index < data.docs.length; index++) {
    //   // Notes notes = Notes.fromjson(data.docs[index].data());
    //   // Mynotes.add(notes);
    //   Mynotes.add(Notes.fromjson(data.docs[index].data()));
    // }
    // return Mynotes;

    return data.docs
        .map((e) => Notes.fromjson(e.data()))
        .toList(); // Simple to iterate data
  }

  @override
  Widget build(BuildContext context) {
    // getnote();
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
            Expanded(
                child: FutureBuilder<List<Notes>>(
                    future: getnote(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      // final data =  // getting data from firebasestore

                      // return Text(data[0].title);
                      if (snapshot.hasData) {
                        final noteslist = snapshot.data!;
                        return ListView.builder(
                          itemCount: noteslist.length,
                          itemBuilder: (context, index) {
                            return NoteCard(
                              notes: noteslist[index],
                            );
                          },
                        );
                      }

                      return Text('There is no data');

                      // return ListView.builder(
                      //   itemCount: 1,
                      //   itemBuilder: (context, index) {
                      //     return NoteCard();
                      //   },
                      // );
                    })),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }
}
