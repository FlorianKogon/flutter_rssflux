import 'dart:convert';
import 'package:http/http.dart';
import 'package:webfeed/webfeed.dart';

class Parser {

  final url = "https://www.jeuxvideo.com/rss/rss.xml";

  Future loadRss() async {
    final response = await get(url);
    if (response.statusCode == 200) {
      final feed = RssFeed.parse(utf8.decode(response.bodyBytes));
      return feed;
    } else {
      print("erreur : ${response.statusCode}");
    }
  }

}