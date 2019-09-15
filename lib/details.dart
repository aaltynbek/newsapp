import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/comments.dart';
import 'package:share/share.dart';

import 'global.dart';

class Details extends StatefulWidget {
  final data;
  final int i;
  Details(this.data, this.i);

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {

  int comment;

  @override
  void initState() {
    super.initState();
    if(widget.data["comments"]!=null){
      List c = news[widget.i]["comments"];
      setState(() {
        comment = c.length;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orange,
        elevation: 1,
        onPressed: (){
          Share.share('${widget.data["title"]}\nhttps://nur.kz');
        },
        child: Icon(Icons.share),
      ),
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 200.0,
              floating: false,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.network(
                  widget.data['photo'],
                  fit: BoxFit.cover,
                )
              ),
              centerTitle: true,
              title: Text('Реакции'),
              actions: <Widget>[
                Stack(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.center,
                      child: IconButton(
                        onPressed: () async {
                          await Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => CommentView(widget.data["comments"]==null?[]:widget.data["comments"], widget.i)
                            )
                          );
                        },
                        icon: Icon(Icons.comment, textDirection: TextDirection.rtl,),
                      ),
                    ),
                    comment==null?
                    Container(width: 1)
                    :
                    Positioned(
                      right: 10,
                      top: 10,
                      child: Container(
                        width: 17,
                        height: 17,
                        decoration: BoxDecoration(
                          color: Colors.orange,
                          shape: BoxShape.circle
                        ),
                        child: Center(child: Text((comment).toString()),),
                      ),
                    )
                  ],
                ),
                IconButton(
                  onPressed: (){
                    setState(() {
                      widget.data['isMarked'] = !widget.data['isMarked'];
                    });
                  },
                  icon: widget.data['isMarked']?
                  Icon(Icons.bookmark)
                  :
                  Icon(Icons.bookmark_border),
                )
              ],
            ),
          ];
        },
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                Container(height: 20),
                Row(
                  children: <Widget>[
                    Container(width: 20),
                    Expanded(
                      child: Text(
                          widget.data['title'],
                          style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                        )
                    ),
                    Container(width: 20)
                  ],
                ),

                Container(height: 20),
                Row(
                  children: <Widget>[
                    Container(width: 20),
                    Text(widget.data['status'], style: TextStyle(color:Colors.black54),),

                    Container(width: 20),
                    Icon(Icons.remove_red_eye, color:Colors.black54),

                    Container(width: 5),
                    Text(widget.data['viewed'], style: TextStyle(color:Colors.black54),),
                  ],
                ),

                Container(height: 20),
                Row(
                  children: <Widget>[
                    Container(width: 20),
                    Expanded(
                      child: Text(
                          loremIpsum,
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        )
                    ),
                    Container(width: 20)
                  ],
                ),

                Container(height: 20),
                GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => Photos(widget.data['photos'])
                      )
                    );
                  },
                  child: Stack(
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.width*9/16,
                        child: Image(
                          image: widget.data['photos'][0],
                          fit: BoxFit.cover
                        ),
                      ),
                      Positioned(
                        right: 10,
                        bottom: 10,
                        child: Icon(Icons.collections, color: Colors.white, size: 40),
                      )
                    ],
                  ),
                ),

                Container(height: 10),
                Row(
                  children: <Widget>[
                    Container(width: 20),
                    Container(height: 20, width: 3, color: Colors.amber),

                    Container(width: 10),
                    Expanded(
                      child: Text(
                        'Иллюстративное фото: NE NUR.KZ', 
                        style: TextStyle(fontSize: 17)
                      ),
                    ),
                  ],
                ),

                Container(height: 20),
                Row(
                  children: <Widget>[
                    Container(width: 20),
                    Expanded(
                      child: Text(
                        loremIpsum, 
                        style: TextStyle(fontSize: 17)
                      ),
                    ),
                    Container(width: 20)
                  ],
                ),


                Container(height: 20),
                Row(
                  children: <Widget>[
                    Container(width: 20),
                    Container(height: 80, width: 3, color: Colors.blue),

                    Container(width: 10),
                    Expanded(
                      child: RichText(
                        text: TextSpan(
                          style: Theme.of(context).textTheme.body1.copyWith(fontSize: 30),
                          children: [
                            TextSpan(
                              text: '"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",',
                              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)
                            ),
                            TextSpan(
                              text: ' - говорится в сообщении.',
                              style: TextStyle(fontSize: 17, fontStyle: FontStyle.italic)
                            )
                          ]
                        )
                      ),
                    ),
                  ],
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Photos extends StatefulWidget {
  final List photos;
  Photos(this.photos);

  @override
  _PhotosState createState() => _PhotosState();
}

class _PhotosState extends State<Photos> {
  var currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
        title: Text(
          '${currentIndex+1} из ${widget.photos.length}'
        ),
      ),
      body: Container(
        color: Colors.black,
        child: Center(
          child: CarouselSlider(
            items: widget.photos.map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Image(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    image: i,
                    fit: BoxFit.fitWidth
                  );
                },
              );
            }).toList(),
            viewportFraction: 1.0,
            initialPage: 0,
            enableInfiniteScroll: false,
            onPageChanged: (i){
              setState(() {
                currentIndex = i;
              });
            },
            scrollDirection: Axis.horizontal,
          ),
        )
      ),
    );
  }
}