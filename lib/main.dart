import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'NewsModel.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Game  newsletter',
        theme: ThemeData(
          primarySwatch: Colors.grey,
          brightness: Brightness.light, // default value
        ),
        home: HomePage());
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    List <News>news=[
      News("God Of War 5 Trailer This Year? New Rumors & News (New God Of War PS5)","assets/image/image1.jpg"),
      News("Assassin's Creed 2020 Impacted By Recent News & New Rumor (Assassin's Creed Ragnarok)","assets/image/image2.png"),
      News("Cyberpunk 2077 News - Drunk Driving, Crucifixion, Genital Customization & Night City Wire Event!","assets/image/image3.jpg"),
      ];
    final size = MediaQuery.of(context).size;

    return Theme(
      data: Theme.of(context).copyWith(
        // override textfield's icon color when selected
        primaryColor: Colors.white,
      ),
      child: Container(
        decoration: new BoxDecoration(
            image: new DecorationImage(
                image: AssetImage('assets/image/dark.png' ),
alignment: Alignment(0,10.0),
//                  image: new NetworkImage(
//                      "https://r1.ilikewallpaper.net/pic/201612/papers_co_nj89_city_view_mountain_nature_sunny_summer_33_iphone6_wallpaper_1_640.jpg"),
              //  colorFilter: ColorFilter.mode(Colors.deepOrangeAccent, BlendMode.darken),
                fit: BoxFit.cover)),
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: CustomScrollView(
              slivers: <Widget>[
                SliverAppBar(
                  backgroundColor: Colors.transparent,
                  expandedHeight: 220.0,
                  pinned: false,
                  floating: false,
                  flexibleSpace: FlexibleSpaceBar(
                    centerTitle: false,
                    titlePadding: EdgeInsets.all(0.0),
                    title: Stack(
                        overflow: Overflow.visible,
                        alignment: Alignment.bottomLeft,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(bottom: 90.0),
                            child: Text("Game news",
                                softWrap: true,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 25.0,
                                  fontFamily: "Calibre-Semibold",
                                  letterSpacing: 1.5,
                                )),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 70.0),
                            child: Text('Find  newsletter',
                                softWrap: true,
                                style: new TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 10.0,
                                    color: Colors.white)),
                          ),
                          Positioned(
                            bottom: 70,
                            right: 0,
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.blue.withOpacity(0.3),
                                  borderRadius: BorderRadius.circular(20)),
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Image.asset("assets/icon/icon1.png",height: 22,),
                              )
                              ,),
                          ),
                          Padding(
                              padding: const EdgeInsets.only(bottom: 20.0),
                              child: Opacity(
                                opacity: 0.7,
                                child: Container(
                                  height: 30,
                                  child: TextFormField(
                                    style: TextStyle(fontSize: 10,color: Colors.white),
                                    keyboardType: TextInputType.text,
                                    decoration: InputDecoration(
                                      prefixIcon: Icon(
                                        Icons.search,
                                        size: 15,
                                          color: Colors.white
                                      ),

                                      hintText: 'Search for games',
                                      hintStyle: TextStyle(
                                          fontSize: 10, color: Colors.white),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(25),
                                        borderSide: BorderSide(
                                          width: 0,
                                          style: BorderStyle.none,
                                        ),
                                      ),
                                      filled: true,
                                      contentPadding: EdgeInsets.all(0),
                                      fillColor: Colors.grey.withOpacity(0.8),
                                    ),
                                  ),
                                ),
                              )),
                        ]),
                  ),
                  actions: <Widget>[],
                ),
                SliverToBoxAdapter(
                  child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)),
                      color: Colors.white.withOpacity(0.8),
                    ),
                  ),
                ),
                SliverList(
                  ///Use SliverChildListDelegate and provide a list
                  ///of widgets if the count is limited
                  ///
                  ///Lazy building of list
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      /// To convert this infinite list to a list with "n" no of items,
                      /// uncomment the following line:
                       if (index > news.length-1) return null;
                      ///
                      return listItem(news.elementAt(index).info,news.elementAt(index).image,context);
                    },

                    /// Set childCount to limit no.of items
                     childCount: 10,
                  ),

                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget listItem(String title,String image,var context) => Container(

      color: Colors.white.withOpacity(0.8),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[

            Padding(

              padding: const EdgeInsets.all(20.0),
              child: Text(

                "$title",
                textAlign: TextAlign.start,
                style: TextStyle(

                  color: Colors.black,
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold,
                ),

              ),
            ),
            Container(
              height: 200,
              width: MediaQuery.of(context).size.width-40,
              decoration: BoxDecoration( borderRadius: BorderRadius.circular(2)),
              child: Image.asset(image ,fit: BoxFit.cover,alignment: Alignment(0.0, 0),),
            )
          ],
        ),

    );
//class MyHomePage extends StatefulWidget {
//  MyHomePage({Key key, this.title}) : super(key: key);
//
//  // This widget is the home page of your application. It is stateful, meaning
//  // that it has a State object (defined below) that contains fields that affect
//  // how it looks.
//
//  // This class is the configuration for the state. It holds the values (in this
//  // case the title) provided by the parent (in this case the App widget) and
//  // used by the build method of the State. Fields in a Widget subclass are
//  // always marked "final".
//
//  final String title;
//
//  @override
//  _MyHomePageState createState() => _MyHomePageState();
//}
//
//class _MyHomePageState extends State<MyHomePage> {
//  int _counter = 0;
//
//  void _incrementCounter() {
//    setState(() {
//      // This call to setState tells the Flutter framework that something has
//      // changed in this State, which causes it to rerun the build method below
//      // so that the display can reflect the updated values. If we changed
//      // _counter without calling setState(), then the build method would not be
//      // called again, and so nothing would appear to happen.
//      _counter++;
//    });
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    // This method is rerun every time setState is called, for instance as done
//    // by the _incrementCounter method above.
//    //
//    // The Flutter framework has been optimized to make rerunning build methods
//    // fast, so that you can just rebuild anything that needs updating rather
//    // than having to individually change instances of widgets.
//    return Scaffold(
//      appBar: AppBar(
//        // Here we take the value from the MyHomePage object that was created by
//        // the App.build method, and use it to set our appbar title.
//        title: Text(widget.title),
//      ),
//      body: Center(
//        // Center is a layout widget. It takes a single child and positions it
//        // in the middle of the parent.
//        child: Column(
//          // Column is also a layout widget. It takes a list of children and
//          // arranges them vertically. By default, it sizes itself to fit its
//          // children horizontally, and tries to be as tall as its parent.
//          //
//          // Invoke "debug painting" (press "p" in the console, choose the
//          // "Toggle Debug Paint" action from the Flutter Inspector in Android
//          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
//          // to see the wireframe for each widget.
//          //
//          // Column has various properties to control how it sizes itself and
//          // how it positions its children. Here we use mainAxisAlignment to
//          // center the children vertically; the main axis here is the vertical
//          // axis because Columns are vertical (the cross axis would be
//          // horizontal).
//          mainAxisAlignment: MainAxisAlignment.center,
//          children: <Widget>[
//            Text(
//              'You have pushed the button this many times:',
//            ),
//            Text(
//              '$_counter',
//              style: Theme.of(context).textTheme.display1,
//            ),
//          ],
//        ),
//      ),
//      floatingActionButton: FloatingActionButton(
//        onPressed: _incrementCounter,
//        tooltip: 'Increment',
//        child: Icon(Icons.add),
//      ), // This trailing comma makes auto-formatting nicer for build methods.
//    );
//  }
//}
