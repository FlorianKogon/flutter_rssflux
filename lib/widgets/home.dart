import 'package:flutter/material.dart';
import 'package:flutter_rssflux/models/parser.dart';
import 'package:webfeed/webfeed.dart';
import 'grid.dart';
import 'list.dart';
import 'custom.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  RssFeed feed;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    parse();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          FlatButton(
            onPressed: () {
              setState(() {
                feed = null;
                parse();
              });
            },
            child: Icon(Icons.refresh, color: Colors.white,)
          ),
        ],
        title: Text(widget.title),
      ),
      body: loading()
    );
  }

  Future<Null> parse() async {
    RssFeed received = await Parser().loadRss();
    if (received != null) {
      setState(() {
        feed = received;
      });
    } else {
      print("erreur $received");
    }
  }
  
  Widget loading() {
    Orientation orientation = MediaQuery.of(context).orientation;
    if (feed == null) {
      return Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            textWithStyle("Chargement...", factor: 3.0)
          ],
        ),
      );
    } else {
      return orientation == Orientation.portrait ? ListRss(feed) : GridRss(feed);
    }
  }
}
