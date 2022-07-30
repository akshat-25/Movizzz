// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:movies_api/utils/text.dart';

class Description extends StatelessWidget {
  const Description({
    Key? key,
    required this.name,
    required this.description,
    required this.bannerurl,
    required this.posterurl,
    required this.vote,
    required this.launch_on,
  }) : super(key: key);
  final String name, description, bannerurl, posterurl, vote, launch_on;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Container(
          child: ListView(
            children: [
              Container(
                height: 250,
                child: Stack(
                  children: [
                    Positioned(
                        child: Container(
                      height: 250,
                      width: MediaQuery.of(context).size.width,
                      child: Image.network(
                        bannerurl,
                        fit: BoxFit.cover,
                      ),
                    )),
                    Positioned(
                        bottom: 10,
                        child: ModifiedText(
                          color: Colors.white,
                          size: 20,
                          text: '⭐ Average Rating -' + vote,
                        ))
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: ModifiedText(
                  color: Colors.white,
                  size: 24,
                  text: name != null ? name : 'Not Loaded',
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 10),
                child: ModifiedText(
                  color: Colors.white,
                  size: 15,
                  text: 'Released On -' + launch_on,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        image: NetworkImage(
                          posterurl,
                        ),
                        fit: BoxFit.contain)),
                margin: EdgeInsets.only(left: 100, right: 100),
                height: 200,
                width: 100,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    child: Container(
                      padding: EdgeInsets.all(5),
                      child: ModifiedText(
                        color: Colors.white,
                        size: 15,
                        text: description,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ));
  }
}
