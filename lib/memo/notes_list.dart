import 'package:flutter/material.dart';
import 'package:flutter_book_chapter5/memo/notes_model.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:scoped_model/scoped_model.dart';

import 'notes_db_worker.dart';

class NotesList extends StatelessWidget {
  const NotesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScopedModel<NotesModel>(
      model: notesModel,
      child: ScopedModelDescendant(builder:
          (BuildContext inContext, Widget? inChild, NotesModel inModel) {
        return Scaffold(
          body: ListView.builder(
            itemCount: notesModel.entityList.length,
            itemBuilder: (BuildContext inBuildContext, int inIndex) {
              Note note = notesModel.entityList[inIndex];
              Color color = Colors.white;
              switch (note.color) {
                case "red":
                  color = Colors.red;
                  break;
                case "green":
                  color = Colors.green;
                  break;
                case "blue":
                  color = Colors.blue;
                  break;
                case "yellow":
                  color = Colors.yellow;
                  break;
                case "grey":
                  color = Colors.grey;
                  break;
                case "purple":
                  color = Colors.purple;
                  break;
              }
              return Container(
                  padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                  child: Slidable(
                      child: Card(
                          elevation: 8,
                          color: color,
                          child: ListTile(
                              title: Text("${note.title}"),
                              subtitle: Text("${note.content}"),
                              // Edit existing note.
                              onTap: () async {
                                // Get the data from the database and send to the edit view.
                                notesModel.entityBeingEdited =
                                    await NotesDBWorker.db.get(note.id!);
                                notesModel.setColor(
                                    notesModel.entityBeingEdited.color);
                                notesModel.setStackIndex(1);
                              })) /* End Card. */
                      ) /* End Slidable. */
                  );
            },
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              notesModel.entityBeingEdited = Note(); // 새로운 모델 append
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
