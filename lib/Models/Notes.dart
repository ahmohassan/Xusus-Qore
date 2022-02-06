import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_time_ago/get_time_ago.dart';

class Notes {
  late String id;
  late String title;
  String? description;
  late String date;
  late Color color;

  Notes.fromjson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['Title'];
    description = json['Discrimination'];
    String temColor = json['Color'];
    String valueString =
        temColor.split('(0x')[1].split(')')[0]; // kind of hacky..
    int value = int.parse(valueString, radix: 16);
    color = Color(value);
    Timestamp temdate = json['Date'];
    var conver = GetTimeAgo.parse(
        DateTime.fromMillisecondsSinceEpoch(temdate.seconds * 1000));
    date = conver;
  }
}
