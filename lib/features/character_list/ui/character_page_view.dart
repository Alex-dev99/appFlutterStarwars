import 'package:flutter_api/core/services/character_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_api/features/character_list/bloc/character_list_bloc.dart';

class CharacterPageView extends StatefulWidget {
  const CharacterPageView({super.key});

  @override
  State<CharacterPageView> createState() => _CharacterPageViewState();
}

class _CharacterPageViewState extends State<CharacterPageView> {
  late CharacterListBloc characterListBloc;

  @override
  void initState() {
    super.initState();
    characterListBloc = CharacterListBloc(CharacterService())
      ..add(CharacterListFetchAllEvent());
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Star Wars Characters')),
      body: BlocBuilder<CharacterListBloc, CharacterListState>(
        bloc: characterListBloc,
        builder: (context, state) {
          if (state is CharacterListLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is CharacterListSucess) {
            return ListView.builder(
              itemCount: state.characterList.length,
              itemBuilder: (context, index) {
                return ListTile(title: Text(state.characterList[index].name));
              },
            );
          } else if (state is CharacterListError) {
            return Center(child: Text(state.message));
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
