import 'package:flutter/material.dart';
import 'package:movieapp/utils/text.dart';

class Description extends StatelessWidget {
  final String name, description, bannerUrl, posterUrl, vote, launchDate;
  const Description(
      {Key? key,
      required this.name,
      required this.description,
      required this.bannerUrl,
      required this.posterUrl,
      required this.vote,
      required this.launchDate})
      : super(key: key);

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
                      bannerUrl,
                      fit: BoxFit.cover,
                    ),
                  )),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ModifiedText(
              text: " ⭐ Rating : " + vote,
              size: 18,
              color: Colors.white,
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: ModifiedText(
                // ignore: unnecessary_null_comparison
                text: name != null ? name : "loading",
                color: Colors.white,
                size: 30,
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 10),
              child: ModifiedText(
                text: 'Launch Date : ' + launchDate,
                size: 18,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.all(8),
                  height: 200,
                  width: 100,
                  child: Image.network(posterUrl),
                ),
                Flexible(
                  child: Container(
                    child: ModifiedText(
                      text: description,
                      size: 15,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
