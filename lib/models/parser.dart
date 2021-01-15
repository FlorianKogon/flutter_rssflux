import 'package:http/http.dart';
import 'package:webfeed/webfeed.dart';

class Parser {

  final url = "https://www.jeuxvideo.com/rss/rss.xml";

  Future loadRss() async {
    final response = await get(url);
    if (response.statusCode == 200) {
      final feed = RssFeed.parse(response.body);
      return feed;
    } else {
      print("erreur : ${response.statusCode}");
    }
  }

}