import 'package:flutter/material.dart';
import 'package:webfeed/webfeed.dart';
import 'custom.dart';
import 'package:flutter_rssflux/models/date_convertissor.dart';
import 'page_detail.dart';

class GridRss extends StatefulWidget {

  RssFeed feed;

  GridRss(RssFeed feed) {
    this.feed = feed;
  }

  @override
  _GridRssState createState() => _GridRssState();
}

class _GridRssState extends State<GridRss> {

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: widget.feed.items.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2),
        itemBuilder: (context, i) {
          RssItem item = widget.feed.items[i];
          return Container(
            margin: EdgeInsets.all(7.5),
            child: InkWell(
                onTap: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return NewPage(item);
                      },
                    ),
                  ),
                },
                child: Card(
                  elevation: 5.0,
                  child: Column(
                    children: [
                      textWithStyle(item.title),
                      padding(),
                      Container(
                        width: MediaQuery.of(context).size.width / 2,
                        child: Image.network(item.media.thumbnails.first.url),
                      ),
                      padding(),
                      textWithStyle(item.description, maxLines: 4, fontWeight: FontWeight.w500),
                      padding(),
                      textWithStyle(
                        DateConvertissor().convertDate(item.pubDate.toString()),
                        fontWeight: FontWeight.w300
                      ),
                    ],
                  ),
                ),
              )
          );
        });
  }
}
