import 'package:flutter/material.dart';
import 'package:somapp/Models/Notes.dart';
import 'package:somapp/widget/Widgets.dart';

class NoteCardScreen extends StatefulWidget {
  const NoteCardScreen({Key? key, required this.notes}) : super(key: key);
  final Notes notes;
  @override
  State<NoteCardScreen> createState() => _NoteCardScreenState();
}

class _NoteCardScreenState extends State<NoteCardScreen> {
  @override
  Widget build(BuildContext context) {
    final int color = int.parse('0xff' + widget.notes.color);
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: widget.notes.title,
          size: 24,
          color: Colors.black,
          overflow: TextOverflow.ellipsis,
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Center(
        child: Container(
          width: 350,
          height: 620,
          decoration: BoxDecoration(
            color: Color(color),
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(
                offset: Offset(0, 5),
                spreadRadius: 2,
                blurRadius: 5,
              )
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: CustomText(
              text: widget.notes.description ?? '',
              size: 54,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
