import 'package:dartz/dartz.dart';
import 'package:pokedex/domain/entity/PokemonEntity.dart';

abstract class GetPokemonRepository{
  Future<Either<Exception,List<PokemonEntity>>> call();
}