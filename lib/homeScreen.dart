import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:news_app/bloc/news_bloC.dart';
import 'package:news_app/innerScreen.dart';
import 'package:news_app/models/news_list.dart';
import 'package:news_app/services/api_manager.dart';
import 'package:provider/provider.dart';

import 'dark_theme_provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<NewsModel> _newsModel;

  final newsBloc = NewsBloc();

  @override
  void initState() {
    // _newsModel = APIManager().getNews();
    newsBloc.newseventSink.add(NewsAction.Fetch);
    super.initState();

    setState(() {});
    //print(_newsModel);
  }

  int selectedIndex = 0;

  List<Map<String, Object>> fiterTags = [
    {"id": 1, "title": "All"},
    {"id": 2, "title": "Health"},
    {"id": 3, "title": "Sport"},
    {"id": 4, "title": "Finance"},
    {"id": 5, "title": "Whether"},
  ];

  chnageFilter(index) {
    selectedIndex = index;
    print(index);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);

    return Column(
      children: [
        Container(
            alignment: Alignment.centerLeft,
            height: 100,
            width: MediaQuery.of(context).size.width,
            color: Theme.of(context).primaryColor,
            child: Padding(
              padding: const EdgeInsets.only(top: 40.0, left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.menu_rounded,
                    size: 24.0,
                  ),
                  GestureDetector(
                    onTap: () {
                      print(themeChange.darkTheme);
                      themeChange.darkTheme = !themeChange.darkTheme;
                    },
                    child: Icon(
                      Icons.wb_sunny,
                      size: 24.0,
                    ),
                  ),
                ],
              ),
            )),
        Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0),
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(30.0),
                child: Image.network(
                  'http://www.newswire.lk/wp-content/uploads/2021/01/Screenshot_20210101-094411_Chrome.jpg',
                  fit: BoxFit.cover,
                  height: MediaQuery.of(context).size.height / 2.5,
                  width: MediaQuery.of(context).size.width,
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height / 2.5,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(30.0),
                  //backgroundBlendMode: BlendMode.overlay
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height / 2.5,
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.bottomLeft,
                decoration: BoxDecoration(
                  // color: Colors.black.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(30.0),
                  //backgroundBlendMode: BlendMode.overlay
                ),
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Health',
                        style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.orange[300]),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        '20% of Srilankan Population will get the Vaccine',
                        style: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        // Expanded(
        //   child: ListView.builder(
        //        shrinkWrap: true,
        //     //scrollDirection: Axis.horizontal,
        //     itemBuilder: (context, index) {
        //       return ListTile(
        //         title: Text(
        //           fiterTags[index]["title"],
        //         ),
        //         //subtitle: Text("ID : ${data[index]["id"]}"),
        //         // leading: Image.network(data[index]["url"]),
        //       );
        //     },
        //     itemCount: fiterTags.length,
        //   ),
        // ),
        SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                  children: List.generate(fiterTags.length, (index) {
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: GestureDetector(
                    onTap: () {
                      chnageFilter(index);
                    },
                    child: Container(
                        height: 40,
                        decoration: BoxDecoration(
                            color: selectedIndex == index
                                ? Colors.orange[300]
                                : null,
                            borderRadius: BorderRadius.circular(20),
                            border: selectedIndex == index
                                ? null
                                : Border.all(
                                    width: 3, color: Colors.grey[300])),
                        child: Center(
                          child: Padding(
                            padding:
                                const EdgeInsets.only(left: 20.0, right: 20.0),
                            child: Text(
                              '${this.fiterTags[index]["title"]}',
                              style: selectedIndex == index
                                  ? TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(context)
                                          .primaryTextTheme
                                          .bodyText1
                                          .color)
                                  : TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(context)
                                          .primaryTextTheme
                                          .bodyText1
                                          .color),
                            ),
                          ),
                        )),
                  ),
                );
              })
                  // }) [
                  //   // for (var tag in fiterTags)
                  //   //   Padding(
                  //   //     padding: const EdgeInsets.all(10.0),
                  //   //     child: Container(
                  //   //         height: 40,
                  //   //         decoration: BoxDecoration(
                  //   //             color: Colors.orange[300],
                  //   //             borderRadius: BorderRadius.circular(20)),
                  //   //         child: Center(
                  //   //           child: Padding(
                  //   //             padding: const EdgeInsets.only(
                  //   //                 left: 20.0, right: 20.0),
                  //   //             child: Text(
                  //   //               tag['title'],
                  //   //               style: TextStyle(
                  //   //                   fontSize: 18.0,
                  //   //                   fontWeight: FontWeight.bold,
                  //   //                   color: Colors.white),
                  //   //             ),
                  //   //           ),
                  //   //         )),
                  //   //   ),
                  // ],
                  ),
            )),
        Expanded(
          child: SingleChildScrollView(
            //shrinkWrap: true,
            //physics: AlwaysScrollableScrollPhysics(),
            child: StreamBuilder<List<Article>>(
              stream: newsBloc.newsStream,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Padding(
                    padding: const EdgeInsets.only(
                        left: 20.0, right: 20.0, bottom: 20.0),
                    child: Container(
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          children: [
                            for (var news in snapshot.data)
                              NewsListWidget(
                                  data: news,
                                  title: news.title,
                                  imageUrl: news.urlToImage)
                          ],
                        )),
                  );
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
        )
      ],
    );
  }
}

class NewsListWidget extends StatelessWidget {
  const NewsListWidget(
      {Key key,
      @required this.title,
      @required this.imageUrl,
      @required this.data})
      : super(key: key);

  final String title;
  final String imageUrl;
  final Article data;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(
                builder: (context) => InnerScreen(),
                
                  settings: RouteSettings(
              arguments: data,
            ),
                ));
        },
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(25.0),
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
                height: 100,
                width: 100,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Health',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.orange[300]),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 2,
                    child: Text(
                      title,
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context)
                              .primaryTextTheme
                              .bodyText1
                              .color),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 2,
                    child: Text(
                      'by ${data.author} \nJan ${data.publishedAt.month} ${data.publishedAt.year}',
                      style: TextStyle(
                          color: Theme.of(context)
                              .primaryTextTheme
                              .bodyText1
                              .color),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

// Container(
//     height: MediaQuery.of(context).size.height / 3,
//     width: MediaQuery.of(context).size.width,
//     //color: Colors.red,

//     decoration: BoxDecoration(
//         color: Colors.red, borderRadius: BorderRadius.circular(30)),
//     child: Image.network(
//       'http://www.newswire.lk/wp-content/uploads/2021/01/Screenshot_20210101-094411_Chrome.jpg',
//       fit: BoxFit.fitHeight,
//     )),
