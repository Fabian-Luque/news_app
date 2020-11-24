import 'package:flutter/material.dart';
import 'package:news_app/src/services/news_service.dart';
import 'package:news_app/src/widgets/lista_noticias.dart';
import 'package:provider/provider.dart';


class Tabs1Page extends StatefulWidget {

  @override
  _Tabs1PageState createState() => _Tabs1PageState();
}

class _Tabs1PageState extends State<Tabs1Page> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {

    final headlines = Provider.of<NewService>(context).headlines;

    return Scaffold(
      body: ( headlines.length == 0 )
          ? Center(child: CircularProgressIndicator())
          : ListaNoticias( headlines ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}