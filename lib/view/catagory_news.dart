import 'package:flutter/material.dart';
import 'package:my_news/helper/news.dart';
import 'package:my_news/model/article_model.dart';
import 'package:my_news/view/articleview.dart';

import 'home.dart';

// ignore: camel_case_types
class Category_news extends StatefulWidget {
  final String category;
  Category_news({this.category});
  @override
  _Category_newsState createState() => _Category_newsState();
}

class _Category_newsState extends State<Category_news> {
  List<ArticleModel> articles = new List<ArticleModel>();
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    getCategoryNews();
  }

  getCategoryNews() async {
    categoryNewsClass newsClass = categoryNewsClass();
    await newsClass.getNews(widget.category);
    articles = newsClass.news;
    setState(() {
      _loading = false;
    });
  }
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Flutter'),
              Text('News', style: TextStyle(
                color: Colors.blue,
              ),)
            ],
          ),
          elevation: 0.0,
        ),
        body: _loading ? Center(
          child: Container(
            child: CircularProgressIndicator(),
          ),
        ):
        SingleChildScrollView(
          child: Container(
              child: Column(
                children: <Widget>[

                  ///blogs
                  Container(
                      padding: EdgeInsets.only(top: 16.0),
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: ClampingScrollPhysics(),
                        itemCount: articles.length,
                        itemBuilder: (context, index) {
                          return BlogTile(
                            imageUrl: articles[index].urlToImage,
                            title: articles[index].title,
                            desc: articles[index].desc,
                            url: articles[index].url,
                          );
                        }),
                  )
                ],
              )
             ),
        ),
         );
      }
    }


 class BlogTile extends StatelessWidget {
  final String imageUrl,title,desc,url;
  BlogTile({@required this.imageUrl,@required this.title,@required this.desc,@required this.url});
  @override
  Widget build(BuildContext context) {
  return GestureDetector(
  onTap: (){
  Navigator.push(context, MaterialPageRoute(
  builder: (context) => ArticleView(
  blogUrl: url,
  ),
  ),
  );
  },
  child: Container(
  margin: EdgeInsets.only(bottom: 16),
  child: Column(
  children: <Widget>[
  ClipRRect(
  borderRadius: BorderRadius.circular(6),
  child: Image.network(imageUrl)
  ),
  SizedBox(height: 8,),
  Text(title ,style: TextStyle(
  fontSize: 17,
  color: Colors.black87,
  fontWeight: FontWeight.w600,
  ),),
  SizedBox(height: 8,),
  Text(desc, style: TextStyle(
  color: Colors.black54
  ),)
  ],
  ),
  ),
  );
  }
  }