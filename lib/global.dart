import 'package:flutter/rendering.dart';

bool switchValue = false;
double textValue = 1.0;

List photos = [
  AssetImage('photo1.jpg'),
  AssetImage('photo2.jpeg'),
  AssetImage('photo3.jpg')
];
var versionName;
var versionCode;
var loremIpsum = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.';
var news = [
    { 
      "title":"Мать – на учете, отчим судимый: смерть 3-летней девочки расследуют в Нур-Султане",
      "photo":"https://netstorage-nur.akamaized.net/images/19001775185a122d.jpg?imwidth=900",
      "viewed": "46657",
      "status": "Популярное",
      "isMarked": false,
      "photos": photos,
      "comments": [
        {
          "name": "Первый комментатор",
          "text": "Комментирую",
          "time": "сент. 14, 12:59"
        },
        {
          "name": "Второй комментатор",
          "text": "Подтверждаю комментирование",
          "time": "сент. 14, 13:10"
        }
      ]
    },
    { 
      "title":"Мощный ураган обрушился на Иссык-Куль: один человек в реанимации (фото)",
      "photo":"https://netstorage-nur.akamaized.net/images/7486fa602369fe98.jpg?impolicy=big-image&imwidth=1120",
      "viewed": "32455",
      "status": "Популярное",
      "isMarked": false,
      "photos": photos
    },
    { 
      "title":"Подозреваемый в убийстве 3-летнего ребенка Игентай Сопыжанов психически здоров",
      "photo":"https://netstorage-nur.akamaized.net/images/3a8d52561f62cd9e.png?imwidth=900",
      "viewed": "22908",
      "status": "Популярное",
      "isMarked": false,
      "photos": photos
    },
    { 
      "title":"Во сколько бюджету обойдется празднование 175-летия Абая и юбилея Аль-Фараби",
      "photo":"https://netstorage-nur.akamaized.net/images/2532db85aa9c3ed8_b.jpg?imwidth=900",
      "viewed": "19842",
      "status": "сент. 12, 14:09",
      "isMarked": false,
      "photos": photos
    },
    { 
      "title":"Мощный ураган обрушился на Иссык-Куль: один человек в реанимации (фото)",
      "photo":"https://netstorage-nur.akamaized.net/images/7486fa602369fe98.jpg?impolicy=big-image&imwidth=1120",
      "viewed": "15068",
      "status": "сент. 12, 13:51",
      "isMarked": false,
      "photos": photos
    },
    { 
      "title":"Мощный ураган обрушился на Иссык-Куль: один человек в реанимации (фото)",
      "photo":"https://netstorage-nur.akamaized.net/images/7486fa602369fe98.jpg?impolicy=big-image&imwidth=1120",
      "viewed": "12039",
      "status": "сент. 12, 12:43",
      "isMarked": false,
      "photos": photos
    },
    { 
      "title":"Мощный ураган обрушился на Иссык-Куль: один человек в реанимации (фото)",
      "photo":"https://netstorage-nur.akamaized.net/images/7486fa602369fe98.jpg?impolicy=big-image&imwidth=1120",
      "viewed": "8674",
      "status": "сент. 12, 12:12",
      "isMarked": false,
      "photos": photos
    },
    { 
      "title":"Мощный ураган обрушился на Иссык-Куль: один человек в реанимации (фото)",
      "photo":"https://netstorage-nur.akamaized.net/images/7486fa602369fe98.jpg?impolicy=big-image&imwidth=1120",
      "viewed": "5639",
      "status": "сент. 12, 11:49",
      "isMarked": false,
      "photos": photos
    },
    { 
      "title":"Мощный ураган обрушился на Иссык-Куль: один человек в реанимации (фото)",
      "photo":"https://netstorage-nur.akamaized.net/images/7486fa602369fe98.jpg?impolicy=big-image&imwidth=1120",
      "viewed": "3429",
      "status": "сент. 12, 11:30",
      "isMarked": false,
      "photos": photos
    },
    { 
      "title":"Мощный ураган обрушился на Иссык-Куль: один человек в реанимации (фото)",
      "photo":"https://netstorage-nur.akamaized.net/images/7486fa602369fe98.jpg?impolicy=big-image&imwidth=1120",
      "viewed": "1532",
      "status": "сент. 12, 09:01",
      "isMarked": false,
      "photos": photos
    },
  ];