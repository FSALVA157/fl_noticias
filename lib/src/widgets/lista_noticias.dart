import 'package:fl_noticias/src/models/news_model.dart';
import 'package:fl_noticias/src/theme/mi_tema.dart';
import 'package:flutter/material.dart';

class ListaNoticias extends StatelessWidget {
  final List<Article> noticias;
  
  const ListaNoticias({Key? key, required this.noticias}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: noticias.length,
      itemBuilder: (_, indice) {
          return _Noticia(
            noticia: noticias[indice],
             indice: indice);
      }
      );
  }
}



class _Noticia extends StatelessWidget {
  final Article noticia;
  final int indice;

  const _Noticia({Key? key, required this.noticia, required this.indice}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _TarjetaTitulo(noticia: noticia,),
        _TarjetaImagen(noticia),
        _TarjetaBody(noticia: noticia),
        _TarjetaTopNoticia(noticia: noticia, indice: indice),
        _TarjetaBotones(),
        SizedBox(height: 20,),
        Divider()

      ],
    );
  }
}

class _TarjetaBody extends StatelessWidget {
  final Article noticia;

  const _TarjetaBody({Key? key, required this.noticia}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: (noticia.description != null)? Text(noticia.description!): Text(''),
    );
  }
}

class _TarjetaBotones extends StatelessWidget {
  const _TarjetaBotones({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RawMaterialButton(
            onPressed: (){},
            fillColor: Colors.deepOrangeAccent,
            child: Icon(Icons.star_border),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20)
            ),
            ),    
            RawMaterialButton(
            onPressed: (){},
            fillColor: Colors.blue,
            child: Icon(Icons.more),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            ),    
        ],
      ),
    );
  }
}

class _TarjetaImagen extends StatelessWidget {
  final Article noticia;

  const _TarjetaImagen(this.noticia);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: (noticia.urlToImage != null)?
              ClipRRect(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(30),bottomRight: Radius.circular(30)),
                    child: FadeInImage(
                                  placeholder: AssetImage('assets/img/giphy.gif'),
                                  image: NetworkImage(noticia.urlToImage.toString())),
                  )
                : Image(
                  image: AssetImage('assets/img/no-image.png')
                  ));
      
  }
}

class _TarjetaTitulo extends StatelessWidget {
  final Article noticia;

  const _TarjetaTitulo({Key? key, required this.noticia}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Text(noticia.title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),),
    );
  }
}


class _TarjetaTopNoticia extends StatelessWidget {
  final Article noticia;
  final int indice;

  const _TarjetaTopNoticia({Key? key, required this.noticia, required this.indice}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      margin: EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
            Text('${indice + 1}   ', style: TextStyle(color: Colors.limeAccent),),
            Text(noticia.source.name)
        ],
      ),
    );
  }
}