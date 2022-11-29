import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex/data/datasource/remote/get_pokemon_datasource.dart';
import 'package:pokedex/data/datasource/remote/get_pokemon_remote_datasource_imp.dart';
import 'package:pokedex/domain/entity/PokemonEntity.dart';
import 'package:pokedex/inject.dart';

void main() {
   Inject.initialize();
   final getIt = GetIt.instance;
  test('datasource passado', (){
   
GetPokemonDataSource repository= GetPokemonRemoteDataSourceImp() ;
  var result = repository();
  expect(result, isInstanceOf<Future<Either<Exception,List<PokemonEntity>>>>());
  });
}