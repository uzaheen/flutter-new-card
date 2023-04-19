import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'flutter card',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: NewsfeedWidget(title: 'News Feed'),
    );
  }
}

class News {
  DateTime _dt;
  String _title;
  String _text;

  News(this._dt, this._title, this._text);
}

class NewsCard extends StatelessWidget {
  News _news;
  NewsCard(this._news);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20.0),
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Image.asset('image/news.jpg'),
              Padding(
                padding: EdgeInsets.only(top: 20.0, bottom: 10.0),
                child: Text(
                  '${_news._dt.month}//${_news._dt.day}/${_news._dt.year}',
                  style: TextStyle(fontSize: 10, fontStyle: FontStyle.italic),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 10.0),
                child: Text(
                  '${_news._title}',
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                width: 30,
              ),
              Row(
                children: [
                  FloatingActionButton(
                    focusColor: Colors.green,
                    child: Text('Share'),
                    onPressed: (() => {}),
                  ),
                  SizedBox(
                    height: 20,
                    width: 50,
                  ),
                  SizedBox(
                    width: 5,
                    height: 20,
                  ),
                  FloatingActionButton(
                    child: Text('Save'),
                    onPressed: (() => {}),
                  ),
                  SizedBox(
                    width: 28,
                    height: 20,
                  ),
                  FloatingActionButton(
                    child: Text('Link'),
                    onPressed: (() => {}),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NewsfeedWidget extends StatelessWidget {
  NewsfeedWidget({Key? key, required this.title}) : super(key: key);

  final String title;
  List<News> _newsList = [
    News(
        DateTime(2018, 12, 1),
        "Mass shooting in Atlanta",
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin sit amet " +
            "tortor pretium, interdum magna sed, pulvinar ligula."),
    News(
        DateTime(2019, 1, 12),
        "Carnival clown found drunk in Misisippi",
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin sit amet " +
            "tortor pretium, interdum magna sed, pulvinar ligula."),
    News(DateTime(2019, 2, 12), "Walrus found in family pool in Florida",
        " " + "."),
  ];

  @override
  Widget build(BuildContext context) {
    List<Widget> newsCards = _newsList.map((news) => NewsCard(news)).toList();
    return Scaffold(
        appBar: AppBar(
          title: Text('News Feed'),
        ),
        body: ListView(
          padding: EdgeInsets.all(20),
          children: newsCards,
        ));
  }
}
