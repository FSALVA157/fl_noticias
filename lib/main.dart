import 'package:fl_noticias/src/pages/tabs_page.dart';
import 'package:fl_noticias/src/services/news_services.dart';
import 'package:fl_noticias/src/theme/mi_tema.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(AppState());

class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => NewsServices()
          )
        ],
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: MiTema.darkTheme,
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home:TabsScreen(),
    );
  }
}