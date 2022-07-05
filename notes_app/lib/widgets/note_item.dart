import 'package:flutter/material.dart';
import 'package:notes_app/colors.dart';

class NoteItem extends StatelessWidget {
  final String noteTitle;
  final String? noteContent;
  final Color? fillColor;
  final String theme;

  NoteItem(this.noteTitle, this.noteContent, this.theme,
      [this.fillColor = Colors.cyanAccent]);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Container(
        decoration: BoxDecoration(
            color: theme == 'Dark' ? Colors.grey[850] : fillColor,
            border: Border.all(width: 1),
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
            boxShadow: [
              BoxShadow(
                color: theme == 'Dark'
                    ? Colors.transparent
                    : Colors.grey.withOpacity(0.2),
                blurRadius: 10.0,
                offset: const Offset(0, 7),
              ),
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              noteTitle,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: theme == 'Dark' ? Colors.white : Colors.black),
            ),
            Text(
              noteContent!,
              style: TextStyle(
                  fontWeight: FontWeight.w100,
                  color: theme == 'Dark' ? Colors.white : Colors.black54),
            )
          ],
        ),
      ),
    );
  }
}
