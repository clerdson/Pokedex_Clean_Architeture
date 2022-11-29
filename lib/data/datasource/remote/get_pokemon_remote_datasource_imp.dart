import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:pokedex/data/datasource/remote/get_pokemon_datasource.dart';
import 'package:pokedex/data/dto/models.dart';
import 'package:pokedex/domain/entity/PokemonEntity.dart';
import 'package:http/http.dart' as http;

class GetPokemonRemoteDataSourceImp implements GetPokemonDataSource{
  @override
  Future<Either<Exception, List<PokemonEntity>>> call() async{
    var url = "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json";

    var response = await http.get(Uri.parse(url));
    var decodedJson = jsonDecode(response.body);
    if (response.statusCode == 200) {
      List<PokemonEntity> json   = decodedJson['pokemon'].map((e)=>PokemonDTO.fromJson(e)).toList().cast<PokemonEntity>();
      return Right(json);
    } else {
      throw Exception('Failed to load album');
    }
  }
  
  }

