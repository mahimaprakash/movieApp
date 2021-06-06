import 'package:flutter/material.dart';
import 'package:movieapp/description.dart';
import 'package:movieapp/utils/text.dart';

class TV extends StatelessWidget {
  final List tv;
  const TV({Key? key, required this.tv}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ModifiedText(text: "Popular TV Shows", color: Colors.white, size: 20),
          SizedBox(
            height: 15.0,
          ),
          Container(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: tv.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Description(
                            name: tv[index]['name'],
                            description: tv[index]['overview'],
                            bannerUrl: 'https://image.tmdb.org/t/p/w500' +
                                tv[index]['backdrop_path'],
                            posterUrl: 'https://image.tmdb.org/t/p/w500' +
                                tv[index]['poster_path'],
                            vote: tv[index]['vote_average'].toString(),
                            launchDate: tv[index]['first_air_date']),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Container(
                      width: 250,
                      child: Column(
                        children: [
                          Container(
                            height: 140,
                            width: 270,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                  'https://image.tmdb.org/t/p/w500' +
                                      tv[index]['backdrop_path'],
                                ),
                                fit: BoxFit.cover,
                              ),
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            child: ModifiedText(
                              text: tv[index]['original_name'] != null
                                  ? tv[index]['original_name']
                                  : 'Loading',
                              size: 20,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
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
