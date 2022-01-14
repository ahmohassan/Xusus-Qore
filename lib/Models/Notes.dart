import 'package:cloud_firestore/cloud_firestore.dart';

class Notes {
  late String id;
  late String title;
  String? description;
  late DateTime date;
  late String color;

  Notes.fromjson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['Title'];
    description = json['Discrimination'];
    color = json['Color'];
    Timestamp temdate = json['Date'];
    date = DateTime.fromMillisecondsSinceEpoch(temdate.seconds * 1000);
  }
}
