import 'package:flutter/material.dart';

import 'global.dart';

class CommentView extends StatefulWidget {
  final List comments;
  final int i;
  CommentView(this.comments, this.i);

  @override
  _CommentViewState createState() => _CommentViewState();
}

class _CommentViewState extends State<CommentView> {
  TextEditingController textEditingController;
  FocusNode focusNode = new FocusNode();
  ScrollController _scrollController;
  

  @override
  void initState(){
    super.initState();
    focusNode.addListener(onFocusChange);
    _scrollController = ScrollController();
    textEditingController = new TextEditingController();
    
  }
  @override
  void dispose() {
    super.dispose();
    focusNode.removeListener(onFocusChange);
  }
  void onFocusChange() {
    if (focusNode.hasFocus) {
    }
  }


  void onSendMessage(String content) async{
    if (content.trim() != '') {
      textEditingController.clear();
      var comment = {
          "name": "Вы",
          "text": content,
          "time": "сейчас"
      };
      setState(() {
        widget.comments.add(comment);
      });
      await moveScrollView(widget.comments.length);
    } else {
      print('nothing to send');
    }
  }

  Future moveScrollView(i) async {
   return  _scrollController.animateTo( (i*2000) * 10000.0, duration: new Duration(milliseconds: 1000), curve: Curves.ease);
  }

  Widget buildInput() {
    return Container(
      child: Row(
        children: <Widget>[
          // Edit text
          Flexible(
            child: Container(
              child: TextField(
                
                style: TextStyle(color: Colors.black, fontSize: 15.0),
                controller: textEditingController,
                decoration: InputDecoration.collapsed(
                  hintText: 'Ваш комментарий',
                  hintStyle: TextStyle(color: Colors.grey),
                ),
                // focusNode: focusNode,
              ),
            ),
          ),

          // Button send message
          Material(
            child: new Container(
              margin: new EdgeInsets.symmetric(horizontal: 8.0),
              child: new IconButton(
                icon: new Icon(Icons.send),
                onPressed: () => onSendMessage(textEditingController.text),
                color: Colors.blue,
              ),
            ),
            color: Colors.white,
          ),
        ],
      ),
      width: double.infinity,
      height: 50.0,
      decoration: new BoxDecoration(
          border: new Border(top: new BorderSide(color: Colors.grey[400], width: 0.5)), color: Colors.white),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text("Комментарии")),
      body: Container(
        child: Column(
            children: <Widget>[
              Expanded(
                child: widget.comments != null?
              ListView.builder(
                  controller: _scrollController,
                  itemCount: widget.comments.length,
                  itemBuilder: (BuildContext context, int i) {
                    return Padding(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(widget.comments[i]['name'], style: TextStyle(color: Colors.blue, fontSize: 16),),
                              Text(widget.comments[i]['time'])
                            ],
                          ),

                          Container(height: 10),
                          Text(widget.comments[i]['text'], style: TextStyle(fontSize: 16),),

                          Container(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Icon(Icons.reply, color: Colors.grey),
                              Text('Ответить', style: TextStyle(color: Colors.grey))
                            ],
                          ),

                          Container(height: 10),
                          Container(height: 0.5, color:Colors.grey[400])
                        ],
                      ),
                    );
                  }
              )
              :
              Center(child: Text("Нет комментариев"),),
              ),
              buildInput()
            ],
          ),
      )
    );
  }
}