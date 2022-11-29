import '../../domain/entity/PokemonEntity.dart';

extension PokemonDTO on PokemonEntity {
  static PokemonEntity fromJson(Map<String, dynamic> json) {
    return PokemonEntity(
      id: json['id'],
      num: json['num'],
      name: json['name'],
      img: json['img'].replaceFirst("http", "https"),
      height: json['height'],
      weight: json['weight'],
      candy: json['candy'],
      candyCount: json['candy_count'],
      egg: json['egg'],
      spawnTime: json['spawn_time'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['num'] = num;
    data['name'] = name;
    data['img'] = img;
    data['height'] = height;
    data['weight'] = weight;
    data['candy'] = candy;
    data['candy_count'] = candyCount;
    data['egg'] = egg;
    data['spawn_chance'] = spawnChance;

    data['spawn_time'] = this.spawnTime;
    data['multipliers'] = this.multipliers;

    return data;
  }
}
