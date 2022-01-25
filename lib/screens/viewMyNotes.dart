import 'package:flutter/material.dart';
import 'package:somapp/Models/Notes.dart';
import 'package:somapp/functions/functions.dart';
import 'package:somapp/screens/exportScreens.dart';

class ViewMyNotes extends StatelessWidget {
  const ViewMyNotes({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FutureBuilder<List<Notes>>(
        future: FirebaseFuncions.getnote(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
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
          return const Text('There is no data');
        },
      ),
    );
  }
}
