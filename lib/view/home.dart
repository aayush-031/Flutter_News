import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:my_news/view/articleview.dart';
import 'package:my_news/helper/news.dart';
import 'package:my_news/helper/data.dart';
import 'package:my_news/model/article_model.dart';
import 'package:my_news/model/category_model.dart';
import 'package:my_news/view/catagory_news.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List<CategoryModel> categories = new List<CategoryModel>();
  List<ArticleModel> articles= new List<ArticleModel>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    categories = getCatagories();
     getNews();
  }
  bool _loading =true;
  getNews() async{
    News newsClass=News();
    await newsClass.getNews();
    articles =newsClass.news;
    setState(() {
      _loading =false;
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
            Text('News' ,style: TextStyle(
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
      )
      :SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: <Widget>[
                ///catagories


                Container(
                  height: 70,
                  child: ListView.builder(
                    itemCount: categories.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index){
                      return CategoryTile(
                        imageUrl: categories[index].imageurl,
                        categoryName: categories[index].categoryName,
                      );
                    }
                  ),
                ),
                ///blogs
                Container(
                  padding: EdgeInsets.only(top: 16.0),
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                      itemCount: articles.length,
                      itemBuilder: (context,index){
                        return BlogTile(
                            imageUrl: articles[index].urlToImage,
                            title: articles[index].title,
                            desc: articles[index].desc,
                            url: articles[index].url,
                        );
                      },
                )
                )
              ],
            ),
          ),
        ),
      );
  }
}
 class CategoryTile extends StatelessWidget {
  final String imageUrl, categoryName;
   CategoryTile({this.imageUrl,this.categoryName});
   @override
   Widget build(BuildContext context) {
     return GestureDetector(
       onTap: (){
          Navigator.push(context, MaterialPageRoute(
              builder: (context) => Category_news(
                category: categoryName.toString().toLowerCase(),
              )
          ));
       },
       child: Container(
         margin: EdgeInsets.only(right: 16),
         child: Stack(
           children: <Widget>[
             ClipRRect(
                 borderRadius: BorderRadius.circular(6),
                 child: CachedNetworkImage(
                   imageUrl: imageUrl,width: 120.0, height: 60.0, fit: BoxFit.cover,)
             ),
             Container(
                alignment: Alignment.center,
                 width: 120.0, height: 60.0,
                 decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(6),
                   color: Colors.black26,
                 ),

                 child: Text(categoryName,style: TextStyle(
                  color: Colors.white,
                   fontWeight: FontWeight.w500,
                   fontSize: 14,
               ),
               )
             )
           ],
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
 
 
