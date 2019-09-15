import 'package:flutter/material.dart';
import 'global.dart';

class Bookmarks extends StatefulWidget {
  @override
  _BookmarksState createState() => _BookmarksState();
}

class _BookmarksState extends State<Bookmarks> {
  List _news = [];
  var textStyle = TextStyle(fontSize: 12, color: Colors.grey);

  @override
  void initState() {
    super.initState();
    for(int i=0; i<news.length; i++){
      if(news[i]['isMarked']){
        _news.add(news[i]);
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Закладки')
      ),
      body: Container(
        child: _news.isEmpty?
        noNews()
        :
        markedNews()
      ),
    );
  }

  Widget noNews(){
    return Center(
          child: Text('Нет добавленных закладок'),
    );
  }
  Widget markedNews(){
    return ListView.builder(
        itemCount: _news.length,
        itemBuilder: (context, i){
          return Column(
            children: <Widget>[
              Container(height: 10),
              Row(
                children: <Widget>[
                  Container(width: 10),
                  Container(
                      width: 100,
                      height: 100,
                      child: Image(
                        image: NetworkImage(_news[i]['photo']),
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
                        Text(_news[i]['title'], style: TextStyle(fontWeight: FontWeight.bold)),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(_news[i]['status'], style: textStyle),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget>[
                                    Icon(Icons.remove_red_eye, color: Colors.grey, size: 13,),
                                    Text(_news[i]['viewed'], style: textStyle)
                                  ],
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                IconButton(
                                  onPressed: (){
                                    setState(() {
                                      _news[i]['isMarked'] = !_news[i]['isMarked'];
                                      _news.remove(_news[i]);
                                    });
                                  },
                                  icon: _news[i]['isMarked']?
                                  Icon(Icons.bookmark, color: Colors.grey,)
                                  :
                                  Icon(Icons.bookmark_border, color: Colors.grey,),
                                )
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
          );
        },
      );
  }
}