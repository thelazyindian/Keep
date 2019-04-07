import 'package:flutter/material.dart';
import './notes_custom_icons_icons.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  void initState() {
    super.initState();
  }

  TextEditingController _searchController = TextEditingController();

  Widget _typeItem(
      {String title,
      IconData item,
      Color bgColor,
      Color iconColor,
      Color fontColor}) {
    return SizedBox(
      height: 138.5,
      width: 138.5,
      child: Container(
        padding: EdgeInsets.all(4.0),
        color: bgColor,
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.center,
              child: Icon(
                item,
                color: iconColor,
                size: 35.0,
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: RichText(
                text: TextSpan(
                  text: title,
                  style: TextStyle(color: fontColor, fontSize: 11.0),
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _colorItem(Color _color) {
    return InkResponse(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.only(
          left: 8.0,
          right: 4.0,
        ),
        width: 50.0,
        height: 50.0,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey[400]),
          color: _color,
          shape: BoxShape.circle,
        ),
      ),
    );
  }

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
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              color: Colors.white,
              //height: 30.0,
              padding: EdgeInsets.all(16.0),
              child: RichText(
                text: TextSpan(
                  text: "TYPES",
                  style: TextStyle(
                      fontSize: 11.0,
                      color: Colors.grey,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ),
            Row(
              children: <Widget>[
                _typeItem(
                  title: "Images",
                  item: NotesCustomIcons.ic_image_grey900_alpha71_24,
                  bgColor: Colors.blue,
                  fontColor: Colors.white,
                  iconColor: Colors.white,
                ),
                SizedBox(
                  width: 4.0,
                ),
                _typeItem(
                  title: "Drawings",
                  item: NotesCustomIcons.ic_brush_grey900_alpha71_24,
                  bgColor: Colors.blue,
                  fontColor: Colors.white,
                  iconColor: Colors.white,
                ),
                SizedBox(
                  width: 4.0,
                ),
                _typeItem(
                  title: "URLs",
                  item: Icons.link,
                  bgColor: Colors.blue,
                  fontColor: Colors.white,
                  iconColor: Colors.white,
                ),
              ],
            ),
            Container(
              color: Colors.white,
              //height: 30.0,
              padding: EdgeInsets.all(16.0),
              child: RichText(
                text: TextSpan(
                  text: "THINGS",
                  style: TextStyle(
                      fontSize: 11.0,
                      color: Colors.grey,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ),
            Row(
              children: <Widget>[
                _typeItem(
                  title: "Food",
                  item: Icons.restaurant,
                  bgColor: Colors.grey[200],
                  fontColor: Colors.black,
                  iconColor: Colors.blue,
                ),
                SizedBox(
                  width: 4.0,
                ),
                _typeItem(
                  title: "Places",
                  item: NotesCustomIcons.ic_place_grey900_alpha71_18,
                  bgColor: Colors.grey[200],
                  fontColor: Colors.black,
                  iconColor: Colors.blue,
                ),
                SizedBox(
                  width: 4.0,
                ),
                _typeItem(
                  title: "Travel",
                  item: Icons.airplanemode_active,
                  bgColor: Colors.grey[200],
                  fontColor: Colors.black,
                  iconColor: Colors.blue,
                ),
              ],
            ),
            Container(
              color: Colors.white,
              //height: 30.0,
              padding: EdgeInsets.all(16.0),
              child: RichText(
                text: TextSpan(
                  text: "COLORS",
                  style: TextStyle(
                      fontSize: 11.0,
                      color: Colors.grey,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ),
            Row(children: <Widget>[
              _colorItem(Colors.white),
              _colorItem(Colors.grey),
              _colorItem(Colors.pink[200]),
              _colorItem(Colors.blue[200]),
            ])
          ],
        ),
      ),
    );
  }
}
