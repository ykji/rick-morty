import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_morty/data/provider/feed_data_provider.dart';
import 'package:rick_morty/utils/global.dart';
import 'package:rick_morty/widgets/character_card.dart';

class Feed extends StatefulWidget {
  @override
  _FeedState createState() => _FeedState();
}

class _FeedState extends State<Feed> with AutomaticKeepAliveClientMixin<Feed> {
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
              _scrollController.position.maxScrollExtent &&
          !Provider.of<FeedDataProvider>(context, listen: false).isLoading) {
        Provider.of<FeedDataProvider>(context, listen: false)
            .addCharactersInList();
      }
    });
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    logger.d("Building Feed Screen");
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(h * 0.05),
        child: AppBar(
          title: Text(
            "Rick And Morty",
            style: TextStyle(fontSize: h * 0.025),
          ),
          centerTitle: true,
          backgroundColor: Colors.brown[200],
        ),
      ),
      backgroundColor: Colors.brown[100],
      body: Consumer<FeedDataProvider>(
        builder: (context, feedData, child) {
          if (feedData.characters.length > 0 && feedData.characters != null) {
            return Container(
              padding: EdgeInsets.symmetric(
                horizontal: w * 0.02,
                vertical: h * 0.01,
              ),
              child: Column(
                children: [
                  Expanded(
                    child: GridView.builder(
                      controller: _scrollController,
                      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: w * 0.5,
                        childAspectRatio: 4 / 5,
                        crossAxisSpacing: w * 0.02,
                        mainAxisSpacing: h * 0.005,
                      ),
                      itemCount: feedData.characters.length,
                      itemBuilder: (BuildContext ctx, index) =>
                          CharacterCard(index: index, feedData: feedData),
                    ),
                  ),
                  // this will appear during the network call of next page
                  if (feedData.isLoading)
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(child: CircularProgressIndicator()),
                    )
                ],
              ),
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
