import 'package:flutter/material.dart';

import '../../domain/entity/PokemonEntity.dart';
import '../../domain/usecase/get_pokemon_usecase.dart';

class PokemonController {
  final GetPokemonUseCase _getPokemonUseCase;
  PokemonController(this._getPokemonUseCase) {
    fetchData("");
  }
  ValueNotifier<List<PokemonEntity>> posts =
      ValueNotifier<List<PokemonEntity>>([]);
  ValueNotifier<bool> inLoader = ValueNotifier<bool>(false);
  List<PokemonEntity>? _cachedPokemons;
  fetchData(String text) async {
    inLoader.value = true;
    var result = await _getPokemonUseCase();


    result.fold(
      (error) => debugPrint(error.toString()),
      (success) {
        _cachedPokemons = success;
        List<PokemonEntity> item = _cachedPokemons!.where((element) {
          var name = element.name!.toLowerCase();
          var input = text.toLowerCase();
          return name.contains(input);
        }).toList();
        posts.value = item;
        inLoader.value = false;
      }
    );

  }
}
