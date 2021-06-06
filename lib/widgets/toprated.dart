import 'package:flutter/material.dart';
import 'package:movieapp/description.dart';
import 'package:movieapp/utils/text.dart';

class TopRatedMovies extends StatelessWidget {
  final List toprated;
  const TopRatedMovies({Key? key, required this.toprated}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ModifiedText(text: "Top Rated Movies", color: Colors.white, size: 20),
          SizedBox(
            height: 15.0,
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
                              name: toprated[index]['original_title'],
                              description: toprated[index]['overview'],
                              bannerUrl: 'https://image.tmdb.org/t/p/w500' +
                                  toprated[index]['backdrop_path'],
                              posterUrl: 'https://image.tmdb.org/t/p/w500' +
                                  toprated[index]['poster_path'],
                              vote: toprated[index]['vote_average'].toString(),
                              launchDate: toprated[index]['release_date']),
                        ),
                      );
                    },
                    child: Container(
                      width: 140,
                      child: Column(
                        children: [
                          Container(
                            height: 200,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                    'https://image.tmdb.org/t/p/w500' +
                                        toprated[index]['poster_path']),
                              ),
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          Container(
                            child: ModifiedText(
                              text: toprated[index]['title'] != null
                                  ? toprated[index]['title']
                                  : 'Loading',
                              size: 15,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
