import 'package:flutter_api/core/models/character_list_response.dart';

abstract class CharacterInterface {
  Future<List<Character>> getAllCharacters();
  Future<Character> getOneCharacter(String id);
}
