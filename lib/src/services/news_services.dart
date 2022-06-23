import 'package:fl_noticias/src/models/news_model.dart';
import 'package:flutter/material.dart';
import  'package:http/http.dart'  as http;

class NewsServices with ChangeNotifier{

  List<Article> headLines = [];
  String _base_url = "newsapi.org";

  NewsServices(){
      this.getTopHeadLines();
  }

  getTopHeadLines() async{
    var url = Uri.https(_base_url, "/v2/top-headlines",{
      "country": "ar",
      "apiKey": "5842b9960f6a41dd90c54d930527fd91"
    });

    var response = await http.get(url);
    final newResponse = NewResponse.fromJson(response.body);
    
    this.headLines.addAll(newResponse.articles);
    
    notifyListeners();
  }

}
