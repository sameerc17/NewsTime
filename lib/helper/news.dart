import 'dart:convert';
import 'package:newstime/models/articlemodel.dart';
import 'package:http/http.dart' as http;

String apikey = "ENTER YOUR API KEY HERE";

class News {
  List<Articlemodel> news = [];

  Future<void> getNews() async {
    String url = "http://newsapi.org/v2/top-headlines?country=in&apiKey=$apikey";
    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);
    if (jsonData["status"] == "ok") {
      jsonData["articles"].forEach((element) {
        if (element["urlToImage"] != null && element["description"] != null) {
          Articlemodel articlemodel = Articlemodel(
            title: element["title"],
            description: element["description"],
            url: element["url"],
            urlToImage: element["urlToImage"],
            content: element["content"],
          );
          news.add(articlemodel);
        }
      });
    }
  }
}

class CategoryNews {
  List<Articlemodel> news = [];

  Future<void> getNews(String category) async {
    String url =
        "http://newsapi.org/v2/top-headlines?category=$category&country=in&apiKey=$apikey";
    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);
    if (jsonData["status"] == "ok") {
      jsonData["articles"].forEach((element) {
        if (element["urlToImage"] != null && element["description"] != null) {
          Articlemodel articlemodel = Articlemodel(
            title: element["title"],
            description: element["description"],
            url: element["url"],
            urlToImage: element["urlToImage"],
            content: element["content"],
          );
          news.add(articlemodel);
        }
      });
    }
  }
}
