import 'package:dartz/dartz.dart';

import '../entity/PokemonEntity.dart';

abstract class GetPokemonNameRepository{
  PokemonEntity call(String pokemon){
    if(pokemon.contains('bulbasaur')){
      return PokemonEntity(name:'bulbasaur');
    }
     return PokemonEntity(name: 'xxx');
  }
}