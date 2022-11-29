class PokemonEntity {
  int? id;
  String? num;
  String? name;
  String? img;

  String? height;
  String? weight;
  String? candy;
  int? candyCount;
  String? egg;
  double? spawnChance;
  String? spawnTime;
  List<double>? multipliers;

  PokemonEntity({
    this.id,
    this.num,
    this.name,
    this.img,
    this.height,
    this.weight,
    this.candy,
    this.candyCount,
    this.egg,
    this.spawnChance,
    this.spawnTime,
    this.multipliers,
  });
  }