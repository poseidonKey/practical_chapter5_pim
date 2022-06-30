import 'package:flutter/material.dart';
import 'package:flutter_book_chapter5/memo/notes_model.dart';
import 'package:scoped_model/scoped_model.dart';

class NotesList extends StatelessWidget {
  const NotesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScopedModel<NotesModel>(
      model: notesModel,
      child: ScopedModelDescendant(builder:
          (BuildContext inContext, Widget? inChild, NotesModel inModel) {
        return Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              notesModel.entityBeingEdited=Note(); // 새로운 모델 append
              notesModel.setColor(null);
              notesModel.setStackIndex(1);
            },
            child: Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
        );
      }),
    );
  }
}
