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
        child: StreamBuilder<List<Notes>>(
      stream: FirebaseFuncions.readNote(),
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
        } else if (snapshot.connectionState == ConnectionState.none) {
          return const Center(child: Text('There is connection proplem'));
        }
        return const Text('There is no data');
      },
    ));
  }
}
