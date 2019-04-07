import 'package:flutter/material.dart';
import './notes_custom_icons_icons.dart';

class NewNotePage extends StatefulWidget {
  @override
  _NewNotePageState createState() => _NewNotePageState();
}

class _NewNotePageState extends State<NewNotePage> {
  @override
  void initState() {
    super.initState();
  }

  TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1.0,
        backgroundColor: Colors.white,
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.grey[600],
              size: 25.0,
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
        title: TextField(
          controller: _searchController,
          style: TextStyle(fontSize: 18.0),
          cursorWidth: 0.7,
          cursorColor: Colors.black,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: "Search your notes",
            hintStyle: TextStyle(
              letterSpacing: 0.7,
              fontSize: 18.0,
            ),
            contentPadding: EdgeInsets.only(left: 0.0, right: 4.0),
          ),
        ),
      ),
      body: Container(
      ),
    );
  }
}
