import 'package:flutter/material.dart';
import 'package:news_app/news_content.dart';

class InnerScreen extends StatefulWidget {
  InnerScreen({Key key}) : super(key: key);

  @override
  _InnerScreenState createState() => _InnerScreenState();
}

class _InnerScreenState extends State<InnerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Theme.of(context).primaryColor,
            expandedHeight: 300,
            stretch: true,
            pinned: true,
            elevation: 0,
            onStretchTrigger: () {
              print('trigger');
              return;
            },
            stretchTriggerOffset: 200,
            flexibleSpace: FlexibleSpaceBar(
              // title: Text(
              //   'Elastigirl',
              //   //style: GoogleFonts.inconsolata(fontWeight: FontWeight.w600),
              // ),
              centerTitle: true,
              stretchModes: const [
                StretchMode.zoomBackground,
                StretchMode.fadeTitle,
                StretchMode.blurBackground,
              ],
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(
                      'http://www.newswire.lk/wp-content/uploads/2021/01/Screenshot_20210101-094411_Chrome.jpg',
                    fit: BoxFit.cover,
                  ),
                  const DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment(0.0, 0.5),
                        end: Alignment(0.0, 0.0),
                        colors: <Color>[
                          Color(0x60000000),
                          Color(0x00000000),
                        ],
                      ),
                    ),
                  ),
                    Positioned(
                  child: Container(
                    height: 30,
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(50),
                      ),
                    ),
                  ),
                  bottom: -1,
                  left: 0,
                  right: 0,
                ),
                ],
              ),
            ),
          ),
          // SliverFixedExtentList(
          //   itemExtent: 1000.0,
          //   delegate: SliverChildBuilderDelegate(
          //     (BuildContext context, int index) {
          //       return Container(
          //         alignment: Alignment.center,
          //         color: Colors.white,
          //         child: NewsContentWidget(),
          //       );
          //     },
          //   ),
          // ),
          SliverList(delegate: SliverChildListDelegate([NewsContentWidget()]))
        ],
        //body: Text('hello'),
      ),
    );
  }
}
