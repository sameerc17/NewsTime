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
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
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
        centerTitle: true,
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
                    Text(
                      'Top Headlines',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 25.0,
                      ),
                      textAlign: TextAlign.left,
                    ),
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
              borderRadius: BorderRadius.circular(40),
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
        padding: EdgeInsets.all(15.0),
        child: Column(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Image.network(imageurl),
            ),
            SizedBox(
              height: 8.0,
            ),
            Text(
              title,
              style: TextStyle(
                  fontSize: 19.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 5.0,
            ),
            Text(
              description,
              style: TextStyle(fontSize: 15.0, color: Colors.white54),
            ),
          ],
        ),
      ),
    );
  }
}
