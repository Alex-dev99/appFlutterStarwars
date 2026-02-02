import 'package:flutter/material.dart';
import 'package:flutter_api/core/models/character_list_response.dart';
import 'package:flutter_api/core/services/character_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'character_list_event.dart';
part 'character_list_state.dart';

class CharacterListBloc extends Bloc<CharacterListEvent, CharacterListState> {
  CharacterListBloc(CharacterService characterService) : super(CharacterListInitial()) {
    on<CharacterListFetchAllEvent>((event, emit) async {
      emit(CharacterListLoading());
      try {
        var apiCharacterList = await characterService.getAllCharacters();
        emit(CharacterListSucess(characterList: apiCharacterList));
      } catch (e) {
        emit(CharacterListError(message: e.toString()));
      }
    });
  }
}
