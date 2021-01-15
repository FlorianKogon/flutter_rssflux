import 'package:flutter/material.dart';
import 'package:webfeed/webfeed.dart';
import 'custom.dart';
import 'page_detail.dart';
import 'package:flutter_rssflux/models/date_convertissor.dart';

class ListRss extends StatefulWidget {

  RssFeed feed;

  ListRss(RssFeed feed) {
    this.feed = feed;
  }

  @override
  _ListRssState createState() => _ListRssState();
}

class _ListRssState extends State<ListRss> {


  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.feed.items.length,
      itemBuilder: (context, i) {
        RssItem item = widget.feed.items[i];
        return InkWell(
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
          child: Container(
            child: Card(
              elevation: 10.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      textWithStyle(item.categories.first.value, fontWeight: FontWeight.normal
                      ),
                      textWithStyle(DateConvertissor().convertDate(item.pubDate.toString()), fontWeight: FontWeight.normal
                      ),
                    ],
                  ),
                  padding(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width / 2.5,
                        child: textWithStyle(item.title),
                      ),
                      Card(
                        elevation: 7.5,
                        child: Container(
                          width: MediaQuery.of(context).size.width / 2,
                          child: Image.network(item.media.thumbnails.first.url),
                        ),
                      ),
                    ],
                  ),
                  padding(),
                  Container(
                    height: MediaQuery.of(context).size.width / 5,
                    child: textWithStyle(item.description, maxLines: 4, fontWeight: FontWeight.w200),
                  )
                ],
              ),
            ),
          ),
        );
      }
    );
  }
}
