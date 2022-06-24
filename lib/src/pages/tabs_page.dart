import 'package:fl_noticias/src/models/news_model.dart';
import 'package:fl_noticias/src/pages/tab1_page.dart';
import 'package:fl_noticias/src/pages/tab2_page.dart';
import 'package:fl_noticias/src/services/news_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TabsScreen extends StatelessWidget {
   
  const TabsScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _NavigationModel(),
      child: Scaffold(
      bottomNavigationBar:_Navigation(),
      body: _Paginas(),
      ),
      );
    
  }
}

class _Navigation extends StatelessWidget {
  const _Navigation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final navigationModel = Provider.of<_NavigationModel>(context);
    
    

    return BottomNavigationBar(
      onTap: (int indice){
        navigationModel.paginaActual = indice;
      },
      currentIndex: navigationModel._paginaActual,
      items: const [
        BottomNavigationBarItem(
          label: "Para ti",
          icon: Icon(Icons.person_outline)
          ),
          BottomNavigationBarItem(
          icon: Icon(Icons.public),
          label: "Encabezados"
          ),
      ]
      );
  }
}

class _Paginas extends StatelessWidget {
  const _Paginas({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final navigationModel = Provider.of<_NavigationModel>(context);

    return PageView(
      controller: navigationModel.pageController,
      physics: NeverScrollableScrollPhysics(),
      children: [
        Tab1Screen(),
        Tab2Screen()
      ],
    );
  }
}

class _NavigationModel with ChangeNotifier{
  int _paginaActual = 0;
  final PageController _pageController = new PageController(initialPage: 0);

  int get paginaActual => this._paginaActual;
  set paginaActual(int valor){
    this._paginaActual = valor;
    this._pageController.animateToPage(valor, duration: Duration(milliseconds: 250), curve: Curves.easeInOut);
    notifyListeners();
  }

  PageController get pageController => this._pageController;

  
}