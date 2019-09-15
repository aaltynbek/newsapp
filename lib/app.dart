import 'package:flutter/material.dart';
import 'package:newsapp/drawer.dart';
import 'package:newsapp/news.dart';

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 10,
        child: Scaffold(
          appBar: AppBar(
            title: Text('NE NUR.KZ'),
            bottom: TabBar(
              isScrollable: true,
              indicatorColor: Colors.yellow,
              tabs: [
                Tab(child: Text('ПОСЛЕДНИЕ', style: TextStyle( fontSize: 12))),
                Tab(child: Text('НУРФИН', style: TextStyle( fontSize: 12))),
                Tab(child: Text('ПОЛИТИКА И ЭКОНОМИКА', style: TextStyle( fontSize: 12))),
                Tab(child: Text('ОБЩЕСТВО', style: TextStyle( fontSize: 12))),
                Tab(child: Text('ИСТОРИИ', style: TextStyle( fontSize: 12))),
                Tab(child: Text('МИРОВЫЕ НОВОСТИ', style: TextStyle( fontSize: 12))),
                Tab(child: Text('ШОУ-БИЗНЕС', style: TextStyle( fontSize: 12))),
                Tab(child: Text('КАЛЕЙДОСКОП', style: TextStyle( fontSize: 12))),
                Tab(child: Text('ФОТО', style: TextStyle( fontSize: 12))),
                Tab(child: Text('ВИДЕО', style: TextStyle( fontSize: 12))),
              ]
            ),
          ),
          drawer: MyDrawer(),
          body: TabBarView(children: [
            Tab1(),
            Tab1(),
            Tab1(),
            Tab1(),
            Tab1(),
            Tab1(),
            Tab1(),
            Tab1(),
            Tab1(),
            Tab1(),
          ]),
        ),
      ),
    );
  }
}






  