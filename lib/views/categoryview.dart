import 'package:flutter/material.dart';
import 'package:newstime/helper/news.dart';
import 'package:newstime/models/articlemodel.dart';
import 'package:newstime/views/home.dart';

class Categorynews extends StatefulWidget {

  final String category;
  Categorynews({this.category});

  @override
  _CategorynewsState createState() => _CategorynewsState();
}

class _CategorynewsState extends State<Categorynews> {

  List<Articlemodel> articles=new List<Articlemodel>();
  bool loading=true;

  @override
  void initState() {
    super.initState();
    getCategoryNews();
  }

  getCategoryNews() async{
    CategoryNews news=CategoryNews();
    await news.getNews(widget.category);
    articles=news.news;
    setState(() {
      loading=false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Row(
          children: <Widget>[
            Text(
              'News',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              'Time',
              style: TextStyle(
                  color: Colors.blue.shade700,
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
        elevation: 0.0,
      ),
      body: loading? Center(
        child: Container(
          child: CircularProgressIndicator(),
        ),
      ) : SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 15.0),
                child: ListView.builder(
                    physics: ClampingScrollPhysics(),
                    shrinkWrap: true,
//                        scrollDirection: Axis.vertical,
                    itemCount: articles.length,
                    itemBuilder: (context, index) {
                      return newstile(
                        imageurl: articles[index].urlToImage,
                        title: articles[index].title,
                        description: articles[index].description,
                        url: articles[index].url,
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
