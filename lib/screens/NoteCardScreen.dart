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
    // final int color = int.parse('0xff' + widget.notes.color);
    final Color color = widget.notes.color;
    return Scaffold(
      backgroundColor: color,
      // backgroundColor: widget.notes.color,
      appBar: AppBar(
        title: CustomText(
          text: widget.notes.title,
          size: 24,
          color: Colors.white,
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Center(
        child: Container(
          width: 320,
          height: 280,
          decoration: BoxDecoration(
            // color: Color(color),
            color: widget.notes.color,
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomText(
                  text: widget.notes.title,
                  size: 28,
                  color: Colors.white,
                ),
                CustomText(
                  text: widget.notes.description ?? '',
                  size: 18,
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
