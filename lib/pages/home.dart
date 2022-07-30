import 'package:flutter/material.dart';
import 'package:movies_api/utils/text.dart';
import 'package:movies_api/widgets/toprated.dart';
import 'package:movies_api/widgets/tv.dart';

import 'package:tmdb_api/tmdb_api.dart';

import '../widgets/trending.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List trendingmovies = [];
  List topratedmovies = [];
  List tv = [];
  final String apikey = 'f5f42280ab086c4ba1f4bd92822893a7';
  final readaccesstoken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJmNWY0MjI4MGFiMDg2YzRiYTFmNGJkOTI4MjI4OTNhNyIsInN1YiI6IjYyZGE5OGI2YjM5ZTM1MDA0ZmM1ZjhlMSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.d0yMAK8aLqXkxvCPViif0WjIJuwmA9xdNBuF0hCrFXQ';

  @override
  void initState() {
    loadMovies();
    super.initState();
  }

  loadMovies() async {
    TMDB tmdbWithCustomLogs = TMDB(
      ApiKeys(apikey, readaccesstoken),
    );

    logConfig:
    ConfigLogger(
      showLogs: true,
      showErrorLogs: true,
    );
    Map trendingResult = await tmdbWithCustomLogs.v3.trending.getTrending();
    Map topRatedResult = await tmdbWithCustomLogs.v3.movies.getTopRated();
    Map tvResult = await tmdbWithCustomLogs.v3.tv.getPopular();

    setState(() {
      trendingmovies = trendingResult['results'];
      topratedmovies = topRatedResult['results'];
      tv = tvResult['results'];
    });
    print(trendingmovies);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          // foregroundColor: Colors.black,
          title: const ModifiedText(
            text: 'Movizzz 💖',
            color: Colors.white,
            size: 20,
          ),
        ),
        body: ListView(
          children: [
            Television(television: tv),
            TopRated(toprated: topratedmovies),
            TrendingMovies(trending: trendingmovies),
          ],
        ));
  }
}
