import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:rick_morty/data/models/origin.dart';
import 'package:rick_morty/data/provider/bottom_bar_provider.dart';
import 'package:rick_morty/data/provider/feed_data_provider.dart';
import 'package:rick_morty/screens/character_details.dart';
import 'package:rick_morty/screens/homepage.dart';
import 'package:path_provider/path_provider.dart' as pathProvider;

import 'data/models/character.dart';
import 'data/models/list_characters.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Directory directory = await pathProvider.getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  Hive.registerAdapter(ListCharactersAdapter());
  Hive.registerAdapter(CharacterAdapter());
  Hive.registerAdapter(OriginAdapter());
  await Hive.openBox("rick-morty");
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