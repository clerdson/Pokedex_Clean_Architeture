import 'package:flutter/material.dart';
import 'package:pokedex/domain/entity/PokemonEntity.dart';
import 'package:pokedex/presentation/Views/favoritos.dart';
class PokeDetail extends StatefulWidget {
  final PokemonEntity pokemon;

  PokeDetail({required this.pokemon});

  @override
  State<PokeDetail> createState() => _PokeDetailState();
}

class _PokeDetailState extends State<PokeDetail> {
  bool favorite = false;

  bodyWidget(BuildContext context) => Stack(
        children: <Widget>[
          Positioned(
            height: MediaQuery.of(context).size.height / 1.5,
            width: MediaQuery.of(context).size.width - 20,
            left: 10.0,
            top: MediaQuery.of(context).size.height * 0.1,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  SizedBox(
                    height: 70.0,
                  ),
                  Text(
                    widget.pokemon.name!,
                    style:
                        TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
                  ),
                   favorite
                                      ? IconButton(
                                          onPressed: () {
                                            setState(() {
                                              favorite = !favorite;
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          Favorite(
                                                          id:widget.pokemon
                                                      .id.toString()!,
                                                            name:
                                                                widget.pokemon.name!
                                                                  ,
                                                          ),),);
                                            },);
                                          },
                                          icon: Icon(Icons.favorite))
                                      : IconButton(
                                          onPressed: () {
                                            setState(() {
                                              favorite = !favorite;
                                            });
                                          },
                                          icon: Icon(Icons.favorite_outline)),
                  Text("Height: ${widget.pokemon.height}"),
                  Text("Weight: ${widget.pokemon.weight}"),
                  Text(
                    "Types",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Hero(
                tag: widget.pokemon.img!,
                child: Container(
                  height: 200.0,
                  width: 200.0,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(widget.pokemon.img!))),
                )),
          )
        ],
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.cyan,
        title: Text(widget.pokemon.name!),
      ),
      body: bodyWidget(context),
    );
  }
}