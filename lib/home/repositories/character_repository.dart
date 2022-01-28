import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rickmorty_app/home/model/character.dart';
import 'package:rickmorty_app/utils/constants.dart';

class CharactersRepository {
  final String baseUrl;

  CharactersRepository({this.baseUrl = Constants.baseUrl});

  Future<List<Result>> fetchAllCharacters() async {
    final uri = Uri.http(baseUrl,'/api/character');
    final response = await http.Client().get(uri);
    if (json.decode(response.body) != null) {
      var characterResponse =
      CharacterResponse.fromJson(json.decode(response.body));
      return characterResponse.results;
    } else {
      return [];
    }
  }
}
