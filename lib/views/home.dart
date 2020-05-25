import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:newstime/helper/data.dart';
import 'package:newstime/helper/news.dart';
import 'package:newstime/models/articlemodel.dart';
import 'package:newstime/models/categorymodel.dart';
import 'package:newstime/views/articleview.dart';

import 'categoryview.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Categorymodel> cat = new List<Categorymodel>();

  List<Articlemodel> articles = new List<Articlemodel>();
  bool loading = true;

  @override
  void initState() {
    super.initState();
    cat = getCategories();
    getNews();
  }

  getNews() async {
    News news = News();
    await news.getNews();
    articles = news.news;
    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      appBar: AppBar(
        backgroundColor: Colors.black12,
        title: Row(
//          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: 5.0,
            ),
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
      body: loading
          ? Center(
              child: Container(
                child: CircularProgressIndicator(),
              ),
            )
          : SingleChildScrollView(
              child: Container(
                child: Column(
                  children: <Widget>[
                    Container(
                      height: 160.0,
                      child: ListView.builder(
                          itemCount: cat.length,
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return categorytile(
                              imageurl: cat[index].imageurl,
                              categoryName: cat[index].categoryName,
                            );
                          }),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: 200.0,
                      height: 1.0,
                      color: Colors.white,
                    ),
                    Text(
                      'TOP HEADLINES',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 27.0,
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: 200.0,
                      height: 1.0,
                      color: Colors.white,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 8.0),
                      child: ListView.builder(
                          physics: ClampingScrollPhysics(),
                          shrinkWrap: true,
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

class categorytile extends StatelessWidget {
  final String imageurl, categoryName;

  categorytile({this.imageurl, this.categoryName});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Categorynews(
                      category: categoryName.toLowerCase(),
                    )));
      },
      child: Container(
        margin: EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            ClipRRect(
              child: CachedNetworkImage(
                imageUrl: imageurl,
                width: 120.0,
                height: 100.0,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              categoryName,
              style: TextStyle(
                color: Colors.white,
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class newstile extends StatelessWidget {
  final String imageurl, title, description, url;

  newstile({this.imageurl, this.title, this.description, this.url});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Articleview(
                      blogurl: url,
                    )));
      },
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              Color(0xff414141),
              Color(0xff000000
              ),
            ],
          ),
        ),
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15.0),
        child: Column(
          children: <Widget>[
            ClipRRect(
              child: Image.network(imageurl),
            ),
            SizedBox(
              height: 8.0,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 3.0, vertical: 2.0),
              child: Text(
                title,
                style: TextStyle(
                    fontSize: 19.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 3.0, vertical: 1.0),
              child: Text(
                description,
                style: TextStyle(fontSize: 15.0, color: Colors.white70),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
          ],
        ),
      ),
    );
  }
}
