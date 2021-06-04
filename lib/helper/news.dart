import 'package:my_news/model/article_model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
class News{
  List<ArticleModel> news=[];


   Future<void> getNews() async{
     var url="https://newsapi.org/v2/top-headlines?country=in&apiKey=f2b25a60a7474fb8a4bd352985176d94";
     var response =await http.get(Uri.parse(url));
     var jsonData = jsonDecode(response.body);

     if(jsonData['status']=='ok'){
       jsonData["articles"].forEach((element){
         if(element["urlToImage"]!=null && element["description"]!=null)
           {
             ArticleModel articleModel= ArticleModel(
               title: element["title"],
               author: element["author"],
               desc: element["description"],
               url: element["url"],
               urlToImage: element["urlToImage"],
               content: element["context"]
             );
             news.add(articleModel);
           }
       });
     }
   }
}
class categoryNewsClass{
  List<ArticleModel> news=[];


  Future<void> getNews(String category) async{
    String url="https://newsapi.org/v2/top-headlines?&country=in&category=$category&apiKey=f2b25a60a7474fb8a4bd352985176d94";
    var response =await http.get(Uri.parse(url));
    var jsonData = jsonDecode(response.body);

    if(jsonData['status']=='ok'){
      jsonData["articles"].forEach((element){
        if(element["urlToImage"]!=null && element["description"]!=null)
        {
          ArticleModel articleModel= ArticleModel(
              title: element["title"],
              author: element["author"],
              desc: element["description"],
              url: element["url"],
              urlToImage: element["urlToImage"],
              content: element["context"]
          );
          news.add(articleModel);
        }
      });
    }
  }
}