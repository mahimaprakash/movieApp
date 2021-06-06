import 'package:flutter/material.dart';
import 'package:movieapp/description.dart';
import 'package:movieapp/utils/text.dart';

class TrendingMovies extends StatelessWidget {
  final List trending;
  const TrendingMovies({Key? key, required this.trending}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ModifiedText(text: "Trending Now", color: Colors.white, size: 20),
          SizedBox(
            height: 15.0,
          ),
          Container(
            height: 300,
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
                            name: trending[index]['media_type'] == 'movie'
                                ? trending[index]['original_title']
                                : trending[index]['name'],
                            description: trending[index]['overview'],
                            bannerUrl: 'https://image.tmdb.org/t/p/w500' +
                                trending[index]['backdrop_path'],
                            posterUrl: 'https://image.tmdb.org/t/p/w500' +
                                trending[index]['poster_path'],
                            vote: trending[index]['vote_average'].toString(),
                            launchDate: trending[index]['media_type'] == 'movie'
                                ? trending[index]['release_date']
                                : trending[index]['first_air_date']),
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
                                      trending[index]['poster_path']),
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Container(
                          child: ModifiedText(
                            text: trending[index]['media_type'] == 'movie'
                                ? trending[index]['original_title']
                                : trending[index]['name'],
                            size: 15,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
