import 'package:pokedex/domain/entity/PokemonEntity.dart';
import 'package:dartz/dartz.dart';
abstract class GetPokemonUseCase{
  Future<Either<Exception,List<PokemonEntity>>> call();
}