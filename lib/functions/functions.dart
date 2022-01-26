// ignore_for_file: avoid_print, unused_local_variable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:somapp/Models/Notes.dart';

class FirebaseFuncions {
  static FirebaseFirestore firestore = FirebaseFirestore.instance;
  static late final noteRefrense = firestore.collection('Notes');

  static void deletefun(String id) async {
    await noteRefrense.doc(id).delete();
  }

  static Stream<List<Notes>> readNote() {
    // final data = await noteRefrense.get();
    return noteRefrense.snapshots().map((snapshot) =>
        snapshot.docs.map((doc) => Notes.fromjson(doc.data())).toList());
  }

  static Future<List<Notes>> getnote() async {
    final data = await noteRefrense.get();

    return data.docs
        .map((e) => Notes.fromjson(e.data()))
        .toList(); // Simple to iterate data
  }

  static Future<void> addUser(
    // String id,
    String title,
    String description,
    String color,
    Timestamp date,
  ) async {
    final id = FirebaseFirestore.instance.collection('Notes').doc().id;
    noteRefrense
        .doc(id)
        .set({
          'id': id,
          'Title': title,
          'Discrimination': description,
          'Color': color,
          'Date': date,
        })
        .then((value) => print('ID IS $id'))
        .catchError((error) => print("Failed to add user: $error"));
  }
}
