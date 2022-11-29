import 'package:dartz/dartz.dart';
import 'package:pokedex/data/datasource/remote/get_pokemon_datasource.dart';

import '../domain/entity/PokemonEntity.dart';
import '../domain/repository/get_pokemon_repository.dart';

class GetPokemonRepositoryImp implements GetPokemonRepository {
  final GetPokemonDataSource _getPokemonDataSource;
  GetPokemonRepositoryImp(this._getPokemonDataSource);

  @override
  Future<Either<Exception, List<PokemonEntity>>> call() async {
    return await _getPokemonDataSource();
  }
}