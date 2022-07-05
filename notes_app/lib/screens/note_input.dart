import 'package:flutter/material.dart';
import 'package:notes_app/colors.dart';
import 'package:notes_app/providers/providers_notes.dart';
import 'package:provider/provider.dart';

class NoteInput extends StatefulWidget {
  static const routeName = '/note-input';

  @override
  State<NoteInput> createState() => _NoteInputState();
}

class _NoteInputState extends State<NoteInput> {
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();
  final _contentFocusNode = FocusNode();

  void _save() {
    if (_titleController.text.isNotEmpty ||
        _contentController.text.isNotEmpty) {
      Future.delayed(Duration.zero).then((_) {
        Provider.of<NotesListProvider>(context, listen: false)
            .addNotes(_titleController.text, _contentController.text);
      });
    }
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final String data = ModalRoute.of(context)!.settings.arguments as String;
    final String theme = data;
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: theme == 'Dark' ? black18_18_18 : cyan_36_187_207,
        title: const Text('Add Notes'),
        actions: [
          IconButton(onPressed: _save, icon: Icon(Icons.done)),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Material(
              elevation: 8,
              color: theme == 'Dark' ? black30_30_30 : Colors.white,
              shadowColor: Colors.white.withOpacity(0.5),
              child: TextField(
                onSubmitted: (value) {
                  FocusScope.of(context).requestFocus(_contentFocusNode);
                },
                maxLines: 1,
                controller: _titleController,
                style: TextStyle(
                    fontSize: 18,
                    color: theme == 'Dark' ? Colors.white : Colors.black),
                decoration: InputDecoration(
                  hintText: 'Title',
                  hintStyle: TextStyle(
                      color: theme == 'Dark' ? Colors.white30 : Colors.black54),
                  focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
              ),
            ),
            Container(
              height: 20,
              color: theme == 'Dark'
                  ? Color.fromARGB(77, 160, 160, 160)
                  : Colors.black12,
            ),
            TextField(
              maxLines: 5000,
              focusNode: _contentFocusNode,
              controller: _contentController,
              decoration: InputDecoration(
                hintText: 'Notes',
                hintStyle: TextStyle(
                    color: theme == 'Dark' ? Colors.white30 : Colors.black54),
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
              style: TextStyle(
                  color: theme == 'Dark' ? Colors.white60 : Colors.black),
            )
          ],
        ),
      ),
      backgroundColor: theme == 'Dark' ? black30_30_30 : Colors.white,
    );
  }
}
