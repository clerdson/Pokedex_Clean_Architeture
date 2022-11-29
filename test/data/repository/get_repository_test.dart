import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex/data/get_pokemon_repository_imp.dart';
import 'package:pokedex/domain/entity/PokemonEntity.dart';
import 'package:pokedex/domain/repository/get_pokemon_repository.dart';
import 'package:pokedex/inject.dart';

import '../../domain/usecase/get_pokemon_usecase_test.dart';

void main() {
   Inject.initialize();
   final getIt = GetIt.instance;
  test('deve istaciar repository passado', (){
   
GetPokemonRepository repository= GetPokemonRepositoryImp(getIt()) ;
  var result = repository();
  expect(result, isInstanceOf<Future<Either<Exception,List<PokemonEntity>>>>());
  });
}