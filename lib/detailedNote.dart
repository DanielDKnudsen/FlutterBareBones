import 'package:flutter/material.dart';
import 'package:flutterbarebones/utils/Notes.dart';

class DetailedNote extends StatefulWidget {
  final Note selectedNote;

  DetailedNote(this.selectedNote);

  @override
  State<StatefulWidget> createState() {
    return DetailedNoteState(selectedNote);
  }
}

class DetailedNoteState extends State<DetailedNote> {
  Note selectedNote;

  DetailedNoteState(this.selectedNote);

  _handleReadCheckBox(bool readStatus) {
    this.setState(() {
      selectedNote.setReadState = readStatus;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: MaterialButton(
          onPressed: () {
            Navigator.pop(context, selectedNote.getReadState);
          },
          child: Icon(Icons.arrow_back, color: Colors.white),
        ),
        title: Text(selectedNote.getTitle),
        backgroundColor: Colors.deepOrange,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                selectedNote.getNoteContent,
                style: TextStyle(fontSize: 20.0),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Read ?',
                  style: TextStyle(fontSize: 20.0),
                ),
                Checkbox(
                    value: selectedNote.getReadState,
                    onChanged: _handleReadCheckBox)
              ],
            )
          ],
        ),
      ),
    );
  }
}
