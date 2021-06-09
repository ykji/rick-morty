import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_morty/data/provider/bottom_bar_provider.dart';
import 'package:rick_morty/screens/feed.dart';
import 'package:rick_morty/utils/global.dart';

import 'favorite_feed.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController _pageController;

  final List<Widget> _children = [
    Feed(),
    FavoriteFeed(),
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
        initialPage: Provider.of<BottomNavigationBarProvider>(
      context,
      listen: false,
    ).currentIndex);
  }

  @override
  Widget build(BuildContext context) {
    logger.d("Building HomePage Screen");
    return Consumer<BottomNavigationBarProvider>(
      builder: (context, bottomNavigationBarProvider, child) {
        return Scaffold(
          body: PageView(
            controller: _pageController,
            physics: NeverScrollableScrollPhysics(),
            children: _children,
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: bottomNavigationBarProvider.currentIndex,
            onTap: (index) {
              bottomNavigationBarProvider.currentIndex = index;
              _pageController.jumpToPage(index);
            },
            showUnselectedLabels: true,
            backgroundColor: Colors.brown[50],
            items: [
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.news),
                label: "Feed",
              ),
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.square_favorites_alt),
                label: "Favorites",
              ),
            ],
          ),
        );
      },
    );
  }
}
