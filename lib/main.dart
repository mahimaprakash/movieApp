import 'package:flutter/material.dart';
import 'package:movieapp/constants/movie_api.dart';
import 'package:movieapp/utils/text.dart';
import 'package:movieapp/widgets/toprated.dart';
import 'package:movieapp/widgets/trending.dart';
import 'package:movieapp/widgets/tv.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:tmdb_api/tmdb_api.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.teal,
        brightness: Brightness.dark,
      ),
      home: Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List trendingMovies = [];
  List topRatedMovies = [];
  List tv = [];

  @override
  void initState() {
    loadMovies();
    super.initState();
  }

  loadMovies() async {
    TMDB tmdbWithCustomLogs = TMDB(
      ApiKeys(ApiConstants.apiKey, ApiConstants.readAccessToken),
      logConfig: ConfigLogger(showLogs: true, showErrorLogs: true),
    );
    try {
      Map trendingResult = await tmdbWithCustomLogs.v3.trending.getTrending();
      Map topRatedResult = await tmdbWithCustomLogs.v3.movies.getTopRated();
      Map tvResult = await tmdbWithCustomLogs.v3.tv.getPouplar();
      print(tvResult);
      setState(() {
        trendingMovies = trendingResult['results'];
        topRatedMovies = topRatedResult['results'];
        tv = tvResult['results'];
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: ModifiedText(
          text: "Movie App  🎬",
          color: Colors.white,
          size: 25,
        ),
        backgroundColor: Colors.transparent,
      ),
      body: ListView(
        children: [
          TrendingMovies(trending: trendingMovies),
          SizedBox(
            height: 10,
          ),
          TopRatedMovies(toprated: topRatedMovies),
          SizedBox(
            height: 10,
          ),
          TV(tv: tv),
        ],
      ),
    );
  }
}
