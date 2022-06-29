import 'package:fl_noticias/src/models/categories_model.dart';
import 'package:fl_noticias/src/services/news_services.dart';
import 'package:fl_noticias/src/widgets/lista_noticias.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Tab2Screen extends StatelessWidget {
   
  const Tab2Screen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    final providerNews = Provider.of<NewsServices>(context);

    return SafeArea(
      child:  Scaffold(
        body: Column(
          children: [
            _ListCategories(),
            Expanded(child: ListaNoticias(noticias: providerNews.listByCategory,))
          ],
        ),
      ),
    );
  }
}

class _ListCategories extends StatelessWidget {
  const _ListCategories({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Categories> categorias = Provider.of<NewsServices>(context).categories;

    return Container(
      width: double.infinity,
      height: 100,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: categorias.length,
        itemBuilder: (BuildContext context, int index) {
          String _nameCategory = categorias[index].name;

          return Container(
            width: 90,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  _ButtomCategory(category: categorias[index]),
                  SizedBox(height: 5,),
                  Text('${_nameCategory[0].toUpperCase()+_nameCategory.substring(1)}', textAlign: TextAlign.center,)
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class _ButtomCategory extends StatelessWidget {
  final Categories category;
  
  
  const _ButtomCategory({
    Key? key, required this.category,
 
  }) : super(key: key);

  

  @override
  Widget build(BuildContext context) {
  
    final providerNews = Provider.of<NewsServices>(context);
    
    return GestureDetector(
      onTap: (){
        final newsAgrupadas = Provider.of<NewsServices>(context, listen: false);
        newsAgrupadas.category = this.category.name;
       
        
      },
      child: Container(
        width: 40,
        height: 40,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white
        ),
        child:Icon(
          category.icon,
          color: (providerNews.category == this.category.name)?Colors.red: Colors.black
          ),
      ),
    );
    
    
  }
}