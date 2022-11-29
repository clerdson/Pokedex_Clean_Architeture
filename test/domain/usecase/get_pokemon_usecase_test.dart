import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex/data/datasource/remote/get_pokemon_datasource.dart';
import 'package:pokedex/data/get_pokemon_repository_imp.dart';
import 'package:pokedex/domain/entity/PokemonEntity.dart';
import 'package:pokedex/domain/repository/get_pokemon_por_nome_repository.dart';
import 'package:pokedex/domain/repository/get_pokemon_repository.dart';
import 'package:pokedex/domain/usecase/get_pokemon_usecase.dart';
import 'package:pokedex/domain/usecase/get_pokemon_usecase_impl.dart';
import 'package:pokedex/inject.dart';



void main() {
   Inject.initialize();
   final getIt = GetIt.instance;
  test('deve istaciar usecase passado', (){
   
GetPokemonUseCase useCase= GetPokemonUseCaseImp(getIt()) ;
  var result = useCase();
  expect(result, isInstanceOf<Future<Either<Exception,List<PokemonEntity>>>>());
  });
}