import 'package:fl_noticias/src/models/news_model.dart';
import 'package:fl_noticias/src/services/news_services.dart';
import 'package:fl_noticias/src/widgets/lista_noticias.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Tab1Screen extends StatelessWidget {
   
  const Tab1Screen({Key? key}) : super(key: key);

  
  @override
  Widget build(BuildContext context) {
    final newsProvider = Provider.of<NewsServices>(context);

    return  Scaffold(
      body: ListaNoticias(
        noticias: newsProvider.headLines
        ),
    );
  }
}