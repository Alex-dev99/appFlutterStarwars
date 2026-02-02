part of 'character_list_bloc.dart';

@immutable
sealed class CharacterListState {}

final class CharacterListInitial extends CharacterListState {}

final class CharacterListLoading extends CharacterListState {}

final class CharacterListSucess extends CharacterListState {
  final List<Character> characterList;
  CharacterListSucess({required this.characterList});
}

final class CharacterListError extends CharacterListState {
  final String message;

  CharacterListError({required this.message});
}
