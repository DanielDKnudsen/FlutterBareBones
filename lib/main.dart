import 'package:flutter/material.dart';
import 'package:flutterbarebones/detailedNote.dart';
import 'package:flutterbarebones/utils/Notes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeScreenState();
  }
}

class HomeScreenState extends State<HomeScreen> {
  List<Note> _notes;

  HomeScreenState() {
    _notes = Notes.initializeNotes().getNotes;
  }

  _handleDetailViewData(int index) async {
    bool data = await Navigator.push(context,
        MaterialPageRoute(builder: (context) => DetailedNote(_notes[index])));

    this.setState(() {
      _notes[index].setReadState = data;
    });
  }

  _handleIconDisplay(int index) {
    bool readStatus = _notes[index].getReadState;

    return new Icon(readStatus ? Icons.check_circle : Icons.remove_circle,
        color: (readStatus) ? Colors.green : Colors.red);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Thomas test'), backgroundColor: Colors.green),
      body: ListView.builder(
          itemCount: _notes.length,
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(color: Colors.blue, width: 1.0))),
              child: ListTile(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(_notes[index].getTitle),
                    _handleIconDisplay(index),
                  ],
                ),
                onTap: () {
                  _handleDetailViewData(index);
                },
              ),
            );
          }),
    );
  }
}
