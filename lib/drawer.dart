import 'package:flutter/material.dart';
import 'package:newsapp/bookmarks.dart';
import 'package:newsapp/settings.dart';
import 'global.dart';

class MyDrawer extends StatefulWidget {
  @override
  _DrawerState createState() => _DrawerState();
}

class _DrawerState extends State<MyDrawer> {

  int _radioValue = -1;
  int _value1 = 1;
  int _radioValue1 = -1;
  void _onChanged1(bool value) => setState(() => switchValue = value);

  void _handleRadioValueChange(int value) {
    print(value);
    setState(() {
      _radioValue = value;
    });
  }
  void _handleRadioValueChange1(int value) {
    print(value);
    setState(() {
      _radioValue1 = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
            child: Column(
              children: <Widget>[
                Container(
                  decoration: new BoxDecoration(
                    color: Colors.blue,
                    gradient: new LinearGradient(
                      colors: [Colors.lightBlue, Color.fromRGBO(0, 0, 139, 1)],
                      begin: Alignment.centerRight,
                      end: new Alignment(-1.0, -1.0)
                    ),
                  ),
                  child: Column(
                    children: <Widget>[
                      Container(height: 40),
                      Row(
                        children: <Widget>[
                          Container(width: 15),
                          Container(
                            width: 70,
                            height: 70,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage('https://pbs.twimg.com/profile_images/840047424882298881/NxZSyfhM.jpg'),
                                fit: BoxFit.fill
                              ),
                              shape: BoxShape.circle,
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text('  Новости Казахстана', style: TextStyle(color: Colors.white, fontSize: 18)),
                              Container(height: 10),
                              Text('  Войти', style: TextStyle(color: Colors.white, fontSize: 18))
                            ],
                          )
                        ],
                      ),
                      Container(height: 15)
                    ],
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.menu),
                  title: Text("Главная"),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: Icon(Icons.bookmark),
                  title: Text("Закладки"),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.of(context).push(
                      SlideRightRoute(page: Bookmarks())
                    );
                  },
                ),
                ListTile(
                  leading: Icon(Icons.settings),
                  title: Text("Настройки"),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.of(context).push(
                      SlideRightRoute(page: Settings())
                    );
                  },
                ),
                ListTile(
                  leading: Icon(Icons.language),
                  title: Text("Изменить язык"),
                  onTap: () {
                    // Navigator.pop(context);
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        // return object of type Dialog
                        return AlertDialog(
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Image(
                                height: 30,
                                image: NetworkImage('https://www.eiseverywhere.com/file_uploads/d6ddf622065bb8dd2bb644000a24f080_LogoNur.kz1.png')
                              ),
                            ],
                          ),
                          content: Container(
                            height: 115,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text("Выберите язык новостей"),
                                new Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Radio(
                                    groupValue: _value1,
                                    onChanged: (i){
                                      print(i);
                                      setState(() => _value1 = i);
                                    },
                                    value: 1,
                                  ),
                                    new Text(
                                      'Қазақша',
                                      style: new TextStyle(fontSize: 16.0),
                                    ),
                                  ],
                                ),
                                new Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Radio(
                                      value: 1,
                                      groupValue: _radioValue1,
                                      onChanged: _handleRadioValueChange1,
                                    ),
                                    new Text(
                                      'Русский',
                                      style: new TextStyle(fontSize: 16.0),
                                    ),
                                  ],
                                ),
                                
                              ],
                            ),
                          ),
                          actions: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                new FlatButton(
                                  child: new Text("СПРЯТАТЬ", style: TextStyle(color: Colors.grey)),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                                new FlatButton(
                                  child: new Text("ОК", style: TextStyle(color: Colors.orange)),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            )
                          ],
                        );
                      },
                    );
                  },
                ),
                Container(height: 0.5, color: Colors.grey[400],),
                ListTile(
                  leading: Icon(Icons.broken_image),
                  title: Text("Без изображений"),
                  trailing: new Switch(value: switchValue, onChanged: _onChanged1),
                  onTap: () {
                  },
                ),
                ListTile(
                  leading: Icon(Icons.person_add),
                  title: Text("Пригласить друга"),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                Spacer(),
                Container(height: 0.5, color: Colors.grey[400]),
                Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      width: double.infinity,
                      // color: Colors.red,
                      padding: EdgeInsets.all(12.0),
                      child: ListTile(
                        leading: Image(
                          width: 35,
                          image: NetworkImage('https://library.kissclipart.com/20180902/zaq/kissclipart-ads-icon-png-clipart-mobile-phones-sms-computer-ic-791cdf638e4c2085.png'),
                        ),
                        title: Text('Включить рекламу', style: TextStyle(fontSize: 16)),
                        subtitle: Text('Читайте новости с рекламой', style: TextStyle(color:Colors.grey)),
                        trailing: Container(
                          width: 25,
                          height: 25,
                          child: CircleAvatar(
                            child: Icon(Icons.navigate_next, color: Colors.white),
                            backgroundColor: Colors.green[400],
                          ),
                        )
                      ),
                    ),
                  ),
              ],
            ),
          );
  }
}

class SlideRightRoute extends PageRouteBuilder {
  final Widget page;
  SlideRightRoute({this.page})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(1, 0),
                  end: Offset.zero,
                ).animate(animation),
                child: child,
              ),
        );
}