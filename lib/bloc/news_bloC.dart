import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_app/models/news_list.dart';

enum NewsAction { Fetch, Delete }

class NewsBloc {
  final _statestreamController = StreamController<List<Article>>();

  StreamSink<List<Article>> get _newsSink => _statestreamController.sink;
  Stream<List<Article>> get newsStream => _statestreamController.stream;

  final _eventstreamController = StreamController<NewsAction>();

  StreamSink<NewsAction> get newseventSink => _eventstreamController.sink;
  Stream<NewsAction> get _newseventStream => _eventstreamController.stream;


  NewsBloc(){
    _newseventStream.listen((event) async {
        if(event == NewsAction.Fetch){
          try {
            var news=  await getNews();
            _newsSink.add(news.articles);
          } on Exception catch (e) {
                _newsSink.addError('Some thing went wrong');
          }
        }
    });
  }


   Future<NewsModel> getNews() async {
    var httpClient = http.Client();
    var newsModel = null;

    try {
      var response = await httpClient.get('http://newsapi.org/v2/everything?domains=wsj.com&apiKey=638f81c9962646abb47e231d9f8d758f');

      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);

        newsModel = NewsModel.fromJson(jsonMap);
             print(jsonString);
          return newsModel;
 
      }
    } catch (Exception) {
      return newsModel;
    }
  }
}
