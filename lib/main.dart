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
    List<News> news = [
      News(
          "God Of War 5 Trailer This Year? New Rumors & News (New God Of War PS5)",
          "assets/image/image1.jpg"),
      News(
          "Assassin's Creed 2020 Impacted By Recent News & New Rumor (Assassin's Creed Ragnarok)",
          "assets/image/image2.png"),
      News(
          "Cyberpunk 2077 News - Drunk Driving, Crucifixion, Genital Customization & Night City Wire Event!",
          "assets/image/image3.jpg"),
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
                image: AssetImage('assets/image/back.jpg'),
                alignment: Alignment(0, 10.0),
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
                                child: Image.asset(
                                  "assets/icon/icon1.png",
                                  height: 22,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                              padding: const EdgeInsets.only(bottom: 20.0),
                              child: Opacity(
                                opacity: 0.7,
                                child: Container(
                                  height: 30,
                                  child: TextFormField(
                                    style: TextStyle(
                                        fontSize: 10, color: Colors.white),
                                    keyboardType: TextInputType.text,
                                    decoration: InputDecoration(
                                      prefixIcon: Icon(Icons.search,
                                          size: 15, color: Colors.white),
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
                      if (index > news.length - 1) return null;

                      ///
                      return listItem(news.elementAt(index).info,
                          news.elementAt(index).image, context);
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

Widget listItem(String title, String image, var context) => Container(
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
            width: MediaQuery.of(context).size.width - 40,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(2)),
            child: Image.asset(
              image,
              fit: BoxFit.cover,
              alignment: Alignment(0.0, 0),
            ),
          )
        ],
      ),
    );
