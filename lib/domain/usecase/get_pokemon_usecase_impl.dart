import 'package:pokedex/domain/entity/PokemonEntity.dart';
import 'package:dartz/dartz.dart';
import 'package:pokedex/domain/repository/get_pokemon_repository.dart';
import 'package:pokedex/domain/usecase/get_pokemon_usecase.dart';

class GetPokemonUseCaseImp implements GetPokemonUseCase {
  final GetPokemonRepository _getCepRepository;
  GetPokemonUseCaseImp(this._getCepRepository);

  @override
  Future<Either<Exception, List<PokemonEntity>>> call() async {
    return await _getCepRepository();
  }
}