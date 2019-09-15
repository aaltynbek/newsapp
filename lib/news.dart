import 'package:flutter/material.dart';
import 'package:newsapp/details.dart';
import 'package:package_info/package_info.dart';
import 'global.dart';


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
  void initState() {
    // TODO: implement initState
    super.initState();
    waitForBuild();
  }
  waitForBuild() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    setState(() {
      versionName = packageInfo.version;
      versionCode = packageInfo.buildNumber;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: (){
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => Details(news[widget.i], widget.i)
            )
          );
        },
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
                          GestureDetector(
                            onTap: (){
                              setState(() {
                                news[widget.i]['isMarked'] = !news[widget.i]['isMarked'];
                              });
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                news[widget.i]['isMarked']?
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
                Container(width: 10),
              ],
            ),
            Container(height: 10),
            Container(height: 0.5, color: Colors.grey,)
          ],
        ),
      ),
    );
  }
}