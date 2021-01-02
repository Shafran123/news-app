import 'package:flutter/material.dart';

class NewsContentWidget extends StatefulWidget {
  NewsContentWidget({Key key}) : super(key: key);

  @override
  _NewsContentWidgetState createState() => _NewsContentWidgetState();
}

class _NewsContentWidgetState extends State<NewsContentWidget> {

  String content = "The World Health Organization on Thursday approved the Pfizer-BioNTech coronavirus vaccine for emergency use, a move aimed at helping the developing world gain access to the vaccine sooner. \n \nThe WHO set up its emergency use process to help countries without their own regulatory resources to approve vaccines, clearing the way for their use.";

  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 1400,
      color: Theme.of(context).primaryColor,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.start,
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
            Text(
              '20% of Srilankan Population will get the Vaccine',
              style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryTextTheme.bodyText1.color),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              'by Siripala on Jan 1 , 2020',
              style: TextStyle(
                  color: Theme.of(context).primaryTextTheme.bodyText1.color),
            ),
            SizedBox(height: 20,),
            Text(content)
          ],
        ),
      ),
    );
  }
}
