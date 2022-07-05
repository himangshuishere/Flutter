import 'dart:io';

import 'package:flutter/material.dart';
import 'package:notes_app/colors.dart';
import 'package:notes_app/providers/providers_notes.dart';
import 'package:notes_app/screens/note_input.dart';
import 'package:notes_app/widgets/note_item.dart';
import 'package:provider/provider.dart';

class NotesList extends StatefulWidget {
  static const routeName = '/';

  const NotesList({Key? key}) : super(key: key);

  @override
  State<NotesList> createState() => _NotesListState();
}

class _NotesListState extends State<NotesList> {
  var toggleLightDark = 'Light';
  var icon_data = Icons.dark_mode;

  void _pageRouter() {
    Navigator.of(context)
        .pushNamed(NoteInput.routeName, arguments: toggleLightDark);
  }

  void _toggleTheme() {
    if (toggleLightDark == 'Dark') {
      setState(() {
        toggleLightDark = 'Light';
        icon_data = Icons.dark_mode;
      });
    } else {
      setState(() {
        toggleLightDark = 'Dark';
        icon_data = Icons.light_mode;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // final noteData = Provider.of<NotesListProvider>(context).list;
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white54,
        backgroundColor: toggleLightDark == 'Dark'
            ? Color.fromARGB(255, 18, 18, 18)
            : Color.fromARGB(221, 36, 187, 207),
        title: const Text(
          'Notes App',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: _toggleTheme,
            icon: Icon(icon_data),
            tooltip: toggleLightDark == 'Dark' ? 'Light Theme' : 'Dark Theme',
          )
        ],
      ),
      body: FutureBuilder(
        future: Provider.of<NotesListProvider>(context, listen: false)
            .fetchAndSetNotes(),
        builder: (ctx, snapshot) =>
            snapshot.connectionState == ConnectionState.waiting
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Consumer<NotesListProvider>(
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: _pageRouter,
                            child: Image.asset(
                              'assets/images/note_${toggleLightDark.toLowerCase()}.png',
                              height: 150,
                              width: 150,
                            ),
                          ),
                          Text(
                            'Try adding some ideas to the wall of thoughts.',
                            softWrap: true,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 18,
                              color: (toggleLightDark == 'Dark')
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          )
                        ],
                      ),
                    ),
                    builder: (ctx, noteData, ch) => noteData.list.isEmpty
                        ? ch as Widget
                        : Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Expanded(
                                child: GridView.builder(
                                    gridDelegate:
                                        const SliverGridDelegateWithMaxCrossAxisExtent(
                                            maxCrossAxisExtent: 200.0),
                                    padding: const EdgeInsets.all(10),
                                    itemCount: noteData.list.length,
                                    itemBuilder: (ctx, i) => NoteItem(
                                        noteData.list[i].title,
                                        noteData.list[i].notes,
                                        toggleLightDark)),
                              ),
                            ],
                          ),
                  ),
      ),
      backgroundColor: toggleLightDark == 'Dark'
          ? Color.fromARGB(255, 30, 30, 30)
          : Colors.white,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.edit_note_rounded),
        onPressed: _pageRouter,
        tooltip: 'Add a new note',
        backgroundColor:
            toggleLightDark == 'Dark' ? Colors.grey.shade700 : Colors.blue,
      ),
    );
  }
}
