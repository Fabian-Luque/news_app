import 'package:flutter/material.dart';
import 'package:news_app/src/models/category_model.dart';
import 'package:news_app/src/services/news_service.dart';
import 'package:news_app/src/theme/tema.dart';
import 'package:news_app/src/widgets/lista_noticias.dart';
import 'package:provider/provider.dart';

class Tab2Page extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    final newsService = Provider.of<NewService>(context);
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            _ListaCategorias(),

            Expanded(
              child: ListaNoticias( newsService.getArticulosCategoriaSeleccionada ),
            )

          ]
        ),
      ),
    );
  }
}

class _ListaCategorias extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {

    final categories = Provider.of<NewService>(context).categories;

    return Container(
      width: double.infinity,
      height: 80,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (BuildContext context, int index) {

          final cName = categories[index].name;

        return Padding(
          padding: EdgeInsets.all(8),
          child: Column(
            children: <Widget>[
              _CategoryButton(categories[index]),
              SizedBox( height: 5),
              Text( '${ cName[0].toUpperCase() }${cName.substring(1)}' )
            ]
          ),
        );
       },
      ),
    );
  }
}

class _CategoryButton extends StatelessWidget {

  final Category category;

  const _CategoryButton( this.category );

  @override
  Widget build(BuildContext context) {
    final newService = Provider.of<NewService>(context);
    return GestureDetector(
      onTap: () {
        final newService = Provider.of<NewService>(context, listen: false);
        newService.selectedCategory = category.name;
      },
      child: Container(
        width: 40,
        height: 40,
        margin: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white
        ),
        child: Icon(
          category.icon,
          color:  ( newService.selectedCategory == this.category.name )
                  ? miTema.accentColor
                  : Colors.black54
        ),
      ),
    );
  }
}