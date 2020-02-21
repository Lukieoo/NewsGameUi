import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Container(
          decoration: new BoxDecoration(
              image: new DecorationImage(
                image: AssetImage('assets/summers.jpg'),
//                  image: new NetworkImage(
//                      "https://r1.ilikewallpaper.net/pic/201612/papers_co_nj89_city_view_mountain_nature_sunny_summer_33_iphone6_wallpaper_1_640.jpg"),

                  fit: BoxFit.cover)),
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0),
            child: Scaffold(
              backgroundColor: Colors.transparent,

              body: CustomScrollView(
                slivers: <Widget>[
                  SliverAppBar(
                    backgroundColor: Colors.transparent,
                    expandedHeight: 200.0,
                    pinned: false,
                    floating: false,
//                    flexibleSpace: FlexibleSpaceBar(
//                      collapseMode:  CollapseMode.parallax,
//                        title: Container(),
//                      background: Image.network(
//                        "https://lh3.googleusercontent.com/proxy/8csMi78_4469NzQjzaV-8wxpiMFDd2VSRbdYjGhu9Yse7zdX4i3Tuyd6f1HR_CTIrYuaVxE5Cvr4cSDbNlHlUE7BqzMIa4GvK1K7CS7FJh0AJCiC3FzlxbOmNm1_sG6U7JbxAvW_NnYL6GYHYFwCZw",
//                        fit: BoxFit.cover)
//                    ),
                    actions: <Widget>[],
                  ),
                  SliverToBoxAdapter( child: Container(
                    height: 20,
                    decoration: BoxDecoration(
                      borderRadius:BorderRadius.only(topLeft:Radius.circular(20),topRight:Radius.circular(20)  ) ,
                      color: Colors.white.withOpacity(0.8),
                    ),
                  ),),
                  SliverList(
                    ///Use SliverChildListDelegate and provide a list
                    ///of widgets if the count is limited
                    ///
                    ///Lazy building of list
                    delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                        /// To convert this infinite list to a list with "n" no of items,
                        /// uncomment the following line:
                        /// if (index > n) return null;
                        return listItem("Sliver List item: $index");
                      },

                      /// Set childCount to limit no.of items
                      /// childCount: 100,
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}

Widget listItem(String title) => Container(
      height: 100.0,
      color: Colors.white.withOpacity(0.8),
      child: Center(
        child: Text(
          "$title",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black,
            fontSize: 14.0,
            fontWeight: FontWeight.bold,
          ),
        ),
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
