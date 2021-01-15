import 'package:flutter/material.dart';
import 'package:webfeed/webfeed.dart';
import 'custom.dart';

class NewPage extends StatelessWidget {

  RssItem item;

  NewPage(RssItem item) {
    this.item = item;
  }

  @override
  Widget build(BuildContext context) {
    Orientation orientation;
    return orientation == Orientation.portrait ? listDetail() : gridDetail(context);
  }

  Widget listDetail() {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter RSS News'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          textWithStyle(item.title, factor: 2.0),
          padding(),
          Image.network(item.media.thumbnails.first.url),
          padding(),
          textWithStyle(item.description, fontWeight: FontWeight.w300)
        ],
      ),
    );
  }

  Widget gridDetail(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter RSS News'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          textWithStyle(item.title, factor: 1.5),
          padding(),
          Container(
            width: MediaQuery.of(context).size.width / 2.5,
            child: Image.network(item.media.thumbnails.first.url),
          ),
          padding(),
          textWithStyle(item.description, fontWeight: FontWeight.w300)
        ],
      ),
    );
  }
}
