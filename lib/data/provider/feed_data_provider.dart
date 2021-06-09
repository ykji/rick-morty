import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:rick_morty/data/models/character.dart';
import 'package:rick_morty/data/models/list_characters.dart';
import 'package:rick_morty/services/dio_service.dart';
import 'package:rick_morty/utils/global.dart';

class FeedDataProvider extends ChangeNotifier {
  List<int> favorite = [];
  List<Character> characters = [];
  int page = 1;
  bool isLoading = false;

  FeedDataProvider() {
    logger.d("Inside FeedData Provider Constructor");
    addCharactersInList();
  }

  addCharactersInList() async {
    if (page <= 34) {
      DioService dioService = DioService();
      Response response;
      List<Character> newCharacters;
      isLoading = true;
      notifyListeners();
      try {
        response = await dioService.getRequest("character/?page=$page");
        newCharacters = ListCharacters.fromJson(response.data).characters;
        characters.addAll(newCharacters);
        isLoading = false;
        ++page;
      } catch (e) {
        isLoading = false;
        logger.e("Error at catch of FeedDataProvider");
        logger.d(e);
      }
      notifyListeners();
    }
  }

  changeFavorite(index) {
    if (favorite.contains(index)) {
      favorite.remove(index);
    } else {
      favorite.add(index);
    }
    notifyListeners();
  }

  clearAllFavorites() {
    favorite.clear();
    notifyListeners();
  }
}
