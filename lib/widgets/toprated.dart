// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../description.dart';
import '../utils/text.dart';

class TopRated extends StatelessWidget {
  const TopRated({
    Key? key,
    required this.toprated,
  }) : super(key: key);
  final List toprated;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ModifiedText(
            text: 'Top Rated Movies',
            color: Colors.yellow,
            size: 26,
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 270,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: toprated.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Description(
                                    name: toprated[index]['title'],
                                    bannerurl:
                                        'http://image.tmdb.org/t/p/w500' +
                                            toprated[index]['backdrop_path'],
                                    description: toprated[index]['overview'],
                                    launch_on: toprated[index]['release_date'],
                                    posterurl:
                                        'http://image.tmdb.org/t/p/w500' +
                                            toprated[index]['poster_path'],
                                    vote: toprated[index]['vote_average']
                                        .toString(),
                                  )));
                    },
                    child: Container(
                      width: 140,
                      child: Column(children: [
                        Container(
                          height: 200,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              image: DecorationImage(
                                  image: NetworkImage(
                                      'http://image.tmdb.org/t/p/w500' +
                                          toprated[index]['poster_path']))),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          padding: EdgeInsets.all(5),
                          child: ModifiedText(
                              color: Colors.white,
                              size: 15,
                              text: toprated[index]['title'] != null
                                  ? toprated[index]['title']
                                  : 'Loading'),
                        ),
                      ]),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
