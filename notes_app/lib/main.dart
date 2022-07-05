import 'package:flutter/material.dart';
import 'package:notes_app/providers/providers_notes.dart';
import 'package:notes_app/screens/note_input.dart';
import 'package:notes_app/screens/notes_list.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: NotesListProvider(),
      child: MaterialApp(
        title: 'Notes App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: NotesList.routeName,
        routes: {
          NotesList.routeName: (ctx) => const NotesList(),
          NoteInput.routeName: (ctx) => NoteInput(),
        },
      ),
    );
  }
}
