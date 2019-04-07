import 'package:flutter/material.dart';
import './search_page.dart';
import './notes_custom_icons_icons.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Keep notes',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: TextTheme(
          display1: TextStyle(color: Colors.grey[600]),
          display2: TextStyle(color: Colors.grey[600]),
        ),
        iconTheme: IconThemeData(
          color: Colors.grey[600],
        ),
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _filterNotes = new TextEditingController();

// void main() {
//   SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
//     statusBarIconBrightness: Brightness.dark,
//     statusBarColor: Colors.white,
//   ));
// }

  Widget createAppBar(BuildContext context) {
    return SizedBox(
      height: 90.0,
      child: Container(
        padding: EdgeInsets.only(top: 25.0),
        child: Card(
          margin: EdgeInsets.only(
            top: 8.0,
            bottom: 8.0,
            left: 4.0,
            right: 4.0,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          color: Colors.white,
          elevation: 1.0,
          child: InkWell(
            onTap: () async {
              var searchPage = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => SearchPage(),
                  ));
              if (searchPage == null) {
                searchPage = false;
              }
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(
                    left: 8.0,
                    right: 4.0,
                  ),
                  child: IconButton(
                    tooltip: "Menu",
                    onPressed: () {},
                    icon: Icon(
                      Icons.menu,
                      size: 25.0,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                    left: 0.0,
                    right: 85.0,
                  ),
                  child: RichText(
                    text: TextSpan(
                      text: "Search your notes",
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 16.0,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 22.0, right: 0.0),
                  child: IconButton(
                    padding: const EdgeInsets.all(0.0),
                    onPressed: () {},
                    icon: Icon(
                      NotesCustomIcons.ic_list_view_grey700_24,
                      size: 25.0,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 6.0, right: 0.0),
                  child: InkWell(
                    onTap: (){
                      Scaffold.of(context).showSnackBar(SnackBar(content: Text("Tap Accounts"),));
                    },
                    onLongPress: (){
                      Scaffold.of(context).showSnackBar(SnackBar(content: Text("Long Tap Accounts"),));
                    },
                    // highlightColor: Colors.black,
                    // borderRadius: BorderRadius.circular(20.0),
                    // customBorder: CircleBorder(side: BorderSide(color: Colors.black)),
                    child: CircleAvatar(backgroundColor: Colors.blue,
                    radius: 16.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.only(
          left: 8.0,
          right: 8.0,
        ),
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              backgroundColor: Colors.transparent,
              expandedHeight: 65.0,
              floating: true,
              pinned: true,
              snap: true,
              elevation: 0.0,
              flexibleSpace: createAppBar(context),
            ),
            SliverGrid(
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 300.0,
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
                childAspectRatio: 2.0,
              ),
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return DecoratedBox(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(3.0),
                    ),
                    child: Container(
                      alignment: Alignment.center,
                      child: Text('grid item $index'),
                    ),
                  );
                },
                childCount: 20,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Transform.translate(
        offset: Offset(0.0, -1 * MediaQuery.of(context).viewInsets.bottom),
        child: BottomAppBar(
          elevation: 20.0,
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              InkWell(
                onTap: () {},
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 24.0,
                    right: 115.0,
                    top: 17.0,
                    bottom: 17.0,
                  ),
                  child: RichText(
                    text: TextSpan(
                      text: "Take a note...",
                      style: TextStyle(
                        color: Colors.grey,
                        letterSpacing: 0.0,
                        fontSize: 14.0,
                      ),
                    ),
                  ),
                ),
              ),
              InkWell(
                child: Padding(
                  padding: EdgeInsets.all(13.0),
                  child: Icon(
                    NotesCustomIcons.ic_check_box_grey900_alpha71_24,
                  ),
                ),
                onTap: () {},
              ),
              InkWell(
                child: Padding(
                  padding: EdgeInsets.all(13.0),
                  child: Icon(
                    NotesCustomIcons.ic_brush_grey900_alpha71_24,
                  ),
                ),
                onTap: () {},
              ),
              InkWell(
                child: Padding(
                  padding: EdgeInsets.all(13.0),
                  child: Icon(
                    Icons.mic_none,
                  ),
                ),
                onTap: () {},
              ),
              InkWell(
                child: Padding(
                  padding: EdgeInsets.all(13.0),
                  child: Icon(
                    NotesCustomIcons.ic_image_grey900_alpha71_24,
                  ),
                ),
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
