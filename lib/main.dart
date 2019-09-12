import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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

class Tab1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, i){
          return News(i);
        },
      )
    );
  }
}

class News extends StatefulWidget {
  final int i;
  News(this.i);

  @override
  _NewsState createState() => _NewsState();
}

class _NewsState extends State<News> {
  var textStyle = TextStyle(fontSize: 12, color: Colors.grey);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(height: 10),
          Row(
            children: <Widget>[
              Container(width: 10),
              Container(
                  width: 100,
                  height: 100,
                  child: Image(
                    image: NetworkImage(news[widget.i]['photo']),
                    fit: BoxFit.cover,
                  ),
              ),
              Container(
                width: 10,
              ),
              Container(
                width: MediaQuery.of(context).size.width-130,
                height: 100,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(news[widget.i]['title'], style: TextStyle(fontWeight: FontWeight.bold)),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(news[widget.i]['status'], style: textStyle),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                Icon(Icons.remove_red_eye, color: Colors.grey, size: 13,),
                                Text(news[widget.i]['viewed'], style: textStyle)
                              ],
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            news[widget.i]['isMarked']?
                            Icon(Icons.bookmark, color: Colors.grey,)
                            :
                            Icon(Icons.bookmark_border, color: Colors.grey,)
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Container(width: 10),
            ],
          ),
          Container(height: 10),
          Container(height: 0.5, color: Colors.grey,)
        ],
      ),
    );
  }
}


  var news = [
    { 
      "title":"Мать – на учете, отчим судимый: смерть 3-летней девочки расследуют в Нур-Султане",
      "photo":"https://netstorage-nur.akamaized.net/images/19001775185a122d.jpg?imwidth=900",
      "viewed": "46657",
      "status": "Популярное",
      "isMarked": false
    },
    { 
      "title":"Мощный ураган обрушился на Иссык-Куль: один человек в реанимации (фото)",
      "photo":"https://netstorage-nur.akamaized.net/images/7486fa602369fe98.jpg?impolicy=big-image&imwidth=1120",
      "viewed": "32455",
      "status": "Популярное",
      "isMarked": true
    },
    { 
      "title":"Подозреваемый в убийстве 3-летнего ребенка Игентай Сопыжанов психически здоров",
      "photo":"https://netstorage-nur.akamaized.net/images/3a8d52561f62cd9e.png?imwidth=900",
      "viewed": "22908",
      "status": "Популярное",
      "isMarked": false
    },
    { 
      "title":"Во сколько бюджету обойдется празднование 175-летия Абая и юбилея Аль-Фараби",
      "photo":"https://netstorage-nur.akamaized.net/images/2532db85aa9c3ed8_b.jpg?imwidth=900",
      "viewed": "19842",
      "status": "сент. 12, 14:09",
      "isMarked": false
    },
    { 
      "title":"Мощный ураган обрушился на Иссык-Куль: один человек в реанимации (фото)",
      "photo":"https://netstorage-nur.akamaized.net/images/7486fa602369fe98.jpg?impolicy=big-image&imwidth=1120",
      "viewed": "15068",
      "status": "сент. 12, 13:51",
      "isMarked": false
    },
    { 
      "title":"Мощный ураган обрушился на Иссык-Куль: один человек в реанимации (фото)",
      "photo":"https://netstorage-nur.akamaized.net/images/7486fa602369fe98.jpg?impolicy=big-image&imwidth=1120",
      "viewed": "12039",
      "status": "сент. 12, 12:43",
      "isMarked": false
    },
    { 
      "title":"Мощный ураган обрушился на Иссык-Куль: один человек в реанимации (фото)",
      "photo":"https://netstorage-nur.akamaized.net/images/7486fa602369fe98.jpg?impolicy=big-image&imwidth=1120",
      "viewed": "8674",
      "status": "сент. 12, 12:12",
      "isMarked": false
    },
    { 
      "title":"Мощный ураган обрушился на Иссык-Куль: один человек в реанимации (фото)",
      "photo":"https://netstorage-nur.akamaized.net/images/7486fa602369fe98.jpg?impolicy=big-image&imwidth=1120",
      "viewed": "5639",
      "status": "сент. 12, 11:49",
      "isMarked": false
    },
    { 
      "title":"Мощный ураган обрушился на Иссык-Куль: один человек в реанимации (фото)",
      "photo":"https://netstorage-nur.akamaized.net/images/7486fa602369fe98.jpg?impolicy=big-image&imwidth=1120",
      "viewed": "3429",
      "status": "сент. 12, 11:30",
      "isMarked": false
    },
    { 
      "title":"Мощный ураган обрушился на Иссык-Куль: один человек в реанимации (фото)",
      "photo":"https://netstorage-nur.akamaized.net/images/7486fa602369fe98.jpg?impolicy=big-image&imwidth=1120",
      "viewed": "1532",
      "status": "сент. 12, 09:01",
      "isMarked": false
    },
  ];