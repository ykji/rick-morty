import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:rick_morty/data/provider/bottom_bar_provider.dart';
import 'package:rick_morty/data/provider/feed_data_provider.dart';
import 'package:rick_morty/screens/character_details.dart';
import 'package:rick_morty/screens/homepage.dart';
import 'package:path_provider/path_provider.dart' as pathProvider;

void main() async {
  Directory directory = await pathProvider.getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<FeedDataProvider>(
          create: (context) => FeedDataProvider(),
        ),
        ChangeNotifierProvider<BottomNavigationBarProvider>(
          create: (context) => BottomNavigationBarProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Rick&Morty',
        theme: ThemeData(
          fontFamily: "Poppins",
          primarySwatch: Colors.brown,
        ),
        home: HomePage(),
        routes: {
          CharacterDetails.routeName: (context) => CharacterDetails(),
        },
      ),
    );
  }
}

// doubts :
// doubt in UI: name p#10
// auto refresh

// confirm :
// check try catch
// check arguments
// check status code 200 thing