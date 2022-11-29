
import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex/domain/entity/PokemonEntity.dart';

Future<void> main() async {
  PokemonEntity entity = PokemonEntity(
     name:'bulbasaur',
     id: 1
     );
  test('not null', () {
    expect(entity, isNotNull);
  });
  test('cep is =', () {
    expect(entity.name, 'bulbasaur');
  });
  test('uf is =', () {
    expect(entity.id, 1);
  });
}

