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
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: widget.notes.title,
          size: 24,
          overflow: TextOverflow.ellipsis,
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Text('Data'),
    );
  }
}
