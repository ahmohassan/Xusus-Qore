// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:somapp/Models/Notes.dart';
import 'package:somapp/screens/exportScreens.dart';
import 'package:somapp/widget/Widgets.dart';

class NoteCard extends StatelessWidget {
  const NoteCard({
    Key? key,
    required this.notes,
  }) : super(key: key);

  final Notes notes;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Material(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        child: InkWell(
          borderRadius: BorderRadius.circular(10),
          onTap: () =>Navigator.push(context, MaterialPageRoute(builder: (context) => NoteCardScreen(notes: notes),)),
          child: Container(
            width: double.infinity,
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CustomText(
                          text: notes.title,
                          size: 24,
                          color: Colors.black,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.timer,
                            color: Colors.grey,
                          ),
                          CustomText(text: '20 minitis ago'),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CustomText(
                          text: notes.description ?? '',
                          color: Colors.black,
                        ),
                      )
                    ],
                  ),
                )),
                Container(
                  width: 40,
                  height: double.infinity,
                  decoration: BoxDecoration(
                      color: Color(int.parse('0xff' + notes.color)),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
