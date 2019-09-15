import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'global.dart';


class Settings extends StatefulWidget {
  @override
  _State createState() => new _State();
}

class _State extends State<Settings> {
  var textStyle = TextStyle(fontSize: 12+textValue, color: Colors.grey);
  void _setvalue(double value) => setState(() => textValue = value);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Color(0xFFeeeeee),
      appBar: new AppBar(
        backgroundColor: Colors.blue[400],
        title: new Text('Настройка чатов'),
      ),
      body: SingleChildScrollView(
        child: new Container(
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[

              buildTextSize(),

              buildNews(),
              
              buildGeneral(),

              Container(height: 10),

              buildAboutUs()

            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextSize() {
    return Container(
        color: Color(0xFFffffff),
        child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Размер текста'),
            Row(
              children: <Widget>[
                Expanded(
                  flex: 9,
                  child: SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTickMarkColor: Colors.transparent,
                      inactiveTickMarkColor: Colors.transparent,
                      activeTrackColor: Colors.blue[500],
                      inactiveTrackColor: Colors.blue[90],
                      trackHeight: 2.0,
                      thumbColor: Colors.blue[500],
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 6.0),
                      overlayColor: Colors.blue[500],
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 1.0),
                    ),
                    child: Slider(
                        divisions: 2,
                        min: 0.0,
                        max: 2.0,
                        value: textValue,
                        onChanged: (value) {
                          setState(() {
                            textValue = value;
                          });
                        }),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget buildNews(){
    return Stack(
      children: <Widget>[
        Container(
          height: 150,
          child: Stack(
            children: <Widget>[
              ListView.builder(
                  padding: EdgeInsets.all(10.0),
                  itemCount: 1,
                  reverse: false,
                  itemBuilder: (context, index) {
                    return Container(
                      child: GestureDetector(
                        onTap: (){
                        },
                        child: Column(
                          children: <Widget>[
                            Container(height: 10),
                            Row(
                              children: <Widget>[
                                Container(
                                    width: 100,
                                    height: 100,
                                    child: Image(
                                      image: NetworkImage(news[0]['photo']),
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
                                      Text(news[0]['title'], style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14+textValue)),
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Text(news[0]['status'], style: TextStyle(fontSize: 12+textValue, color: Colors.grey)),
                                            ],
                                          ),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.end,
                                            children: <Widget>[
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.end,
                                                children: <Widget>[
                                                  Icon(Icons.remove_red_eye, color: Colors.grey, size: 13,),
                                                  Text(news[0]['viewed'], style: TextStyle(fontSize: 12+textValue, color: Colors.grey))
                                                ],
                                              ),
                                            ],
                                          ),
                                          GestureDetector(
                                            onTap: (){
                                              setState(() {
                                                news[0]['isMarked'] = !news[0]['isMarked'];
                                              });
                                            },
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: <Widget>[
                                                news[0]['isMarked']?
                                                Icon(Icons.bookmark, color: Colors.grey,)
                                                :
                                                Icon(Icons.bookmark_border, color: Colors.grey,)
                                              ],
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Container(height: 10),
                          ],
                        ),
                      ),
                    );
                  },
              ),
            ],
          )   
        )
      ],
    );
  }


  Widget buildGeneral(){
    return GestureDetector(
      onTap: (){
        
      },
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
              child: Text('Общие', style: TextStyle(color: Colors.blue, fontSize: 17),),
            ),
            ListTile(
              leading: Icon(FontAwesomeIcons.solidBell),
              title: Text('Управление уведомлениями'),
            ),
            Container(height: 0.5, color: Colors.grey),
            ListTile(
              leading: Icon(FontAwesomeIcons.broom),
              title: Text('Очистить все данные'),
              trailing: Text('0,00 MB', style: TextStyle(color:Colors.grey),),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildAboutUs(){
    return GestureDetector(
      onTap: (){
        
      },
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
              child: Text('Про нас', style: TextStyle(color: Colors.blue, fontSize: 17),),
            ),
            ListTile(
              leading: Icon(FontAwesomeIcons.starHalfAlt),
              title: Text('Оставить отзыв'),
            ),
            Container(height: 0.5, color: Colors.grey),
            ListTile(
              leading: Icon(FontAwesomeIcons.infoCircle),
              title: Text('Политика конфиденциальности'),
            ),
            Container(height: 0.5, color: Colors.grey),
            ListTile(
              leading: Icon(FontAwesomeIcons.neos, color: Colors.blue,),
              title: Text('NE NUR.KZ'),
              trailing: Text('Версия $versionName | Сборка $versionCode', style: TextStyle(color:Colors.grey),),
            ), 
          ],
        ),
      ),
    );
  }

}
