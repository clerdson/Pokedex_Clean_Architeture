import 'package:get_it/get_it.dart';
import 'package:pokedex/presentation/controllers/pokemon_controller.dart';

import 'data/datasource/remote/get_pokemon_datasource.dart';
import 'data/datasource/remote/get_pokemon_remote_datasource_imp.dart';
import 'data/get_pokemon_repository_imp.dart';
import 'domain/repository/get_pokemon_repository.dart';
import 'domain/usecase/get_pokemon_usecase.dart';
import 'domain/usecase/get_pokemon_usecase_impl.dart';

class Inject {
  static initialize() {
    // core
    final getIt = GetIt.instance;
    // datasources
    getIt.registerLazySingleton<GetPokemonDataSource>(
      () => GetPokemonRemoteDataSourceImp(),
    );
    // repositories
    getIt.registerLazySingleton<GetPokemonRepository>(
      () => GetPokemonRepositoryImp(getIt()),
    );
    // usecases
    getIt.registerLazySingleton<GetPokemonUseCase>(
      () => GetPokemonUseCaseImp(getIt()),
    );
    // controllers
    getIt.registerLazySingleton<PokemonController>(
      () => PokemonController(getIt()),
    );
  }
}
