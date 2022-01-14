import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseFuncions {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  void deletefun(String id) async {
    final NoteRefrense = firestore.collection('Notes');
    NoteRefrense.doc(id).delete();
  }
  
}
