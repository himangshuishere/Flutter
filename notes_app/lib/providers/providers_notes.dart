import 'package:flutter/material.dart';
import 'package:notes_app/helpers/db_helper.dart';
import 'package:notes_app/models/notes.dart';

class NotesListProvider with ChangeNotifier {
  List<Notes> _list = [];

  List<Notes> get list {
    return [..._list];
  }

  void addNotes(String noteTitle, String noteContent) {
    final newNote = Notes(
        id: DateTime.now().toString() + noteTitle,
        title: noteTitle,
        notes: noteContent,
        modified_at: DateTime.now());

    _list.add(newNote);
    notifyListeners();
    DBHelper.insertData({
      'id': newNote.id,
      'title': newNote.title,
      'notes': newNote.notes,
      'modified_at': newNote.modified_at.toIso8601String(),
    });
  }

  void updateNotes(String id, String noteTitle, String noteContent) {
    final updatedNote = Notes(
      id: id,
      title: noteTitle,
      notes: noteContent,
      modified_at: DateTime.now(),
    );
    final noteIndx = _list.indexWhere((note) => note.id.toString() == id);
    _list[noteIndx] = updatedNote;
    notifyListeners();
    DBHelper.updateData(id, {
      'title': updatedNote.title,
      'notes': updatedNote.notes,
      'modified_at': updatedNote.modified_at.toIso8601String(),
    });
  }

  Future<void> fetchAndSetNotes() async {
    final notesData = await DBHelper.getData();
    _list = notesData
        .map((items) => Notes(
              id: items['id'],
              title: items['title'],
              notes: items['notes'],
              modified_at: DateTime.parse(items['modified_at']),
            ))
        .toList();
    notifyListeners();
  }

  Notes findById(String id) {
    return _list.firstWhere((note) => note.id == id);
  }
}
