import 'package:fl_noticias/src/models/news_model.dart';
import 'package:fl_noticias/src/services/news_services.dart';
import 'package:fl_noticias/src/widgets/lista_noticias.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Tab1Screen extends StatefulWidget {
   
  const Tab1Screen({Key? key}) : super(key: key);

  @override
  State<Tab1Screen> createState() => _Tab1ScreenState();
}

class _Tab1ScreenState extends State<Tab1Screen> with AutomaticKeepAliveClientMixin{
  @override
  Widget build(BuildContext context) {
    final newsProvider = Provider.of<NewsServices>(context);

    return  Scaffold(
      body: (newsProvider.headLines.isEmpty)?
                const Center(child: CircularProgressIndicator()):
            ListaNoticias(
              noticias: newsProvider.headLines
              ),
    );
  }
  
  @override
  bool get wantKeepAlive => true;
}