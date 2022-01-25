import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_time_ago/get_time_ago.dart';

class Notes {
  late String id;
  late String title;
  String? description;
  late String date;
  late String color;

  Notes.fromjson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['Title'];
    description = json['Discrimination'];
    color = json['Color'];
    Timestamp temdate = json['Date'];
    var conver = GetTimeAgo.parse(
        DateTime.fromMillisecondsSinceEpoch(temdate.seconds * 1000));
    date = conver;
  }
}
