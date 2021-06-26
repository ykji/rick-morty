import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_morty/data/provider/feed_data_provider.dart';
import 'package:rick_morty/utils/global.dart';
import 'package:rick_morty/widgets/character_card.dart';

class FavoriteFeed extends StatefulWidget {
  @override
  _FavoriteFeedState createState() => _FavoriteFeedState();
}

class _FavoriteFeedState extends State<FavoriteFeed>
    with AutomaticKeepAliveClientMixin<FavoriteFeed> {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    logger.d("Building FavoriteFeed Screen");
    return Consumer<FeedDataProvider>(
      builder: (context, feedData, child) {
        return Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(h * 0.05),
            child: AppBar(
              title: Text(
                "Favorites",
                style: TextStyle(fontSize: h * 0.025),
              ),
              centerTitle: true,
              backgroundColor: Colors.brown[200],
              actions: feedData.favorite.length == 0
                  ? []
                  : [
                      InkWell(
                        child: Center(
                            child: Text(
                          "Clear All  ",
                          style: TextStyle(fontSize: h * 0.02),
                        )),
                        onTap: () {
                          showDialogBox(context);
                        },
                      )
                    ],
            ),
          ),
          backgroundColor: Colors.white54,
          body: Container(
            padding: EdgeInsets.symmetric(
              horizontal: w * 0.02,
              vertical: h * 0.02,
            ),
            child: feedData.favorite.length == 0
                ? Column(
                    children: [
                      SizedBox(height: h * 0.1),
                      Text(
                        "Don't you have any favorites?\nCome on dude!",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: h * 0.025),
                      ),
                      Image(image: AssetImage("assets/no_fav.png")),
                    ],
                  )
                : GridView.builder(
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: w * 0.5,
                      childAspectRatio: 4 / 5,
                      crossAxisSpacing: w * 0.02,
                      mainAxisSpacing: h * 0.01,
                    ),
                    itemCount: feedData.favorite.length,
                    itemBuilder: (BuildContext ctx, index) {
                      return CharacterCard(
                        index: feedData.favorite[index],
                        feedData: feedData,
                      );
                    },
                  ),
          ),
        );
      },
    );
  }

  showDialogBox(context) {
    return showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text("Clear"),
        content: Text("Do you want to clear all your favorites?"),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(ctx).pop();
            },
            child: Text("Cancel"),
          ),
          TextButton(
            onPressed: () {
              Provider.of<FeedDataProvider>(context, listen: false)
                  .clearAllFavorites();
              Navigator.of(ctx).pop();
            },
            child: Text("Yes"),
          ),
        ],
      ),
    );
  }
}
