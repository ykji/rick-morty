import 'package:flutter/material.dart';
import 'package:rick_morty/data/provider/feed_data_provider.dart';
import 'package:rick_morty/screens/character_details.dart';
import 'package:rick_morty/widgets/network_image_widget.dart';

class CharacterCard extends StatelessWidget {
  CharacterCard({this.index, this.feedData});

  final int index;
  final FeedDataProvider feedData;

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          CharacterDetails.routeName,
          arguments: Arguments(index, feedData),
        );
      },
      child: Container(
        child: Column(
          children: [
            Container(
              child: showImage(
                url: feedData.characters[index].imageUrl,
                radius: w * 0.1,
                height: h * 0.21,
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      feedData.characters[index].name,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: h * 0.018,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: feedData.favorite.contains(index)
                        ? Icon(Icons.favorite, color: Colors.red)
                        : Icon(Icons.favorite_border_outlined),
                    iconSize: h * 0.03,
                    onPressed: () {
                      feedData.changeFavorite(index);
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
