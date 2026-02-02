import 'package:flutter_api/core/interfaces/character_interface.dart';
import 'package:flutter_api/core/models/character_list_response.dart';
import 'package:http/http.dart' as http;

class CharacterService implements CharacterInterface {
  final String _apiBaseUrl = "https://swapi.dev/api/people/";

  @override
  Future<List<Character>> getAllCharacters() async {
    var url = Uri.parse(_apiBaseUrl + '?page=1');
    try {
      var response = await http.get(url);

      if (response.statusCode == 200 || response.statusCode == 201) {
        /*var characterListResponse = CharacterListResponse.fromJson(
          jsonDecode(response.body),
        );*/
        try {
          var characterListResponse = CharacterListResponse.fromJson(response.body);
          return characterListResponse.results;
        } catch (e) {
          // parse error
          print('Parsing SWAPI response failed: $e');
          print('Response body: ${response.body}');
          return [];
        }
      } else {
        print('SWAPI returned status ${response.statusCode}');
        print('Response body: ${response.body}');
        return [];
      }
    } catch (e) {
      print('HTTP request failed: $e');
      return [];
    }
  }

  @override
  Future<Character> getOneCharacter(String id) {
    throw UnimplementedError();
  }
}
