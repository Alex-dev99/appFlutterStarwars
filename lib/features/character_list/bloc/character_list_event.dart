part of 'character_list_bloc.dart';

@immutable
sealed class CharacterListEvent {}

final class CharacterListFetchAllEvent extends CharacterListEvent {}
