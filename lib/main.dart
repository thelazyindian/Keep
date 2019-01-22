import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Keep notes',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
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

  Widget createAppBar() {
    return SizedBox(
      height: 100.0,
      child: Card(
        margin: EdgeInsets.only(
          top: 8.0,
          bottom: 8.0,
          left: 4.0,
          right: 4.0,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        color: Colors.white,
        elevation: 4.0,
        // child: new Padding(
        //   padding: EdgeInsets.only(
        //     top: 16.0,
        //     bottom: 16.0,
        //   ),
        // child: new Column(
        //   children: <Widget>[
        //     new Container(
        //       height: 16.0,
        //     ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(
                left: 8.0,
                right: 4.0,
              ),
              child: Icon(
                Icons.menu,
                color: Colors.grey,
                size: 25.0,
              ),
            ),
            Flexible(
              child: TextField(
                controller: _filterNotes,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Search your notes",
                  hintStyle: TextStyle(
                    letterSpacing: 2.0,
                    fontSize: 16.0,
                  ),
                  contentPadding: EdgeInsets.only(left: 4.0, right: 4.0),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 4.0, right: 4.0),
              child: Icon(
                Icons.grid_on,
                color: Colors.grey,
                size: 25.0,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 4.0, right: 8.0),
              child: Icon(
                Icons.account_circle,
                color: Colors.grey,
                size: 25.0,
              ),
            ),
          ],
        ),
        //     new Container(
        //       height: 16.0,
        //     ),
        //   ],
        // ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    //main();
    return Scaffold(
      // appBar: PreferredSize(
      //   preferredSize: Size.fromHeight(60.0),
      //   child: AppBar(
      //     elevation: 0.0,
      //     backgroundColor: Colors.white,
      //     title: createAppBar(),
      //   ),
      // ),
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.only(
          left: 8.0,
          right: 8.0,
          bottom: 8.0,
        ),
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              backgroundColor: Colors.white,
              //expandedHeight: 85.0,
              floating: false,
              snap: false,
              elevation: 0.0,
              title: createAppBar(),
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
          elevation: 0.0,
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Flexible(
                child: TextField(
                  controller: _filterNotes,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Take a note...",
                    hintStyle: TextStyle(
                      letterSpacing: 1.0,
                      fontSize: 16.0,
                    ),
                    contentPadding: EdgeInsets.only(left: 16.0, right: 4.0),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 4.0, right: 4.0),
                child: IconButton(
                  icon: Icon(
                    Icons.check_box,
                  ),
                  color: Colors.grey,
                  iconSize: 25.0,
                  onPressed: () {},
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 4.0, right: 4.0),
                child: IconButton(
                  icon: Icon(
                    Icons.brush,
                  ),
                  color: Colors.grey,
                  iconSize: 25.0,
                  onPressed: () {},
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 4.0, right: 4.0),
                child: IconButton(
                  icon: Icon(
                    Icons.mic_none,
                  ),
                  color: Colors.grey,
                  iconSize: 25.0,
                  onPressed: () {},
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 4.0, right: 8.0),
                child: IconButton(
                  icon: Icon(
                    Icons.image,
                  ),
                  color: Colors.grey,
                  iconSize: 25.0,
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
