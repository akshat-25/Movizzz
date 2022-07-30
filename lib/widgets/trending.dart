import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import '../description.dart';
import '../utils/text.dart';

class TrendingMovies extends StatelessWidget {
  const TrendingMovies({
    Key? key,
    required this.trending,
  }) : super(key: key);
  final List trending;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ModifiedText(
            text: 'Trending Movies',
            color: Colors.yellow,
            size: 26,
          ),
          // AnimatedTextKit(animatedTexts: [
          //   TypewriterAnimatedText('Trending Movies',
          //       textStyle: TextStyle(
          //         fontSize: 30,
          //         fontFamily: 'Agne',
          //       ))
          // ]),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 270,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: trending.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Description(
                                    name: trending[index]['title'],
                                    bannerurl:
                                        'http://image.tmdb.org/t/p/w500' +
                                            trending[index]['backdrop_path'],
                                    description: trending[index]['overview'],
                                    launch_on: trending[index]['release_date'],
                                    posterurl:
                                        'http://image.tmdb.org/t/p/w500' +
                                            trending[index]['poster_path'],
                                    vote: trending[index]['vote_average']
                                        .toString(),
                                  )));
                    },
                    child: trending[index]['title'] != null
                        ? Container(
                            width: 140,
                            child: Column(children: [
                              Container(
                                height: 200,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    image: DecorationImage(
                                        image: NetworkImage(
                                      'http://image.tmdb.org/t/p/w500' +
                                          trending[index]['poster_path'],
                                    ))),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                child: ModifiedText(
                                    color: Colors.white,
                                    size: 12,
                                    text: trending[index]['title'] != null
                                        ? trending[index]['title']
                                        : 'Loading'),
                              ),
                            ]),
                          )
                        : Container(),
                  );
                }),
          )
        ],
      ),
    );
  }
}
