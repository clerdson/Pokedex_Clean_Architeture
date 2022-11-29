import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex/presentation/Views/favoritos.dart';
import 'package:pokedex/presentation/Views/pokemon_detail.dart';
import '../controllers/pokemon_controller.dart';

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() {
    return new HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  late final PokemonController _controller;
  late String name;
  late String id;
  bool favorite = false;
  @override
  void initState() {
    super.initState();
    _controller = GetIt.I.get<PokemonController>();
    _controller.fetchData("");
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: TextField(
            decoration: InputDecoration(prefixIcon: Icon(Icons.search)),
            onChanged: (value) {
              _controller.fetchData(value);
            },
          ),
        ),
        backgroundColor: Colors.cyan,
        body: AnimatedBuilder(
          animation:
              Listenable.merge([_controller.posts, _controller.inLoader]),
          builder: (_, __) => _controller.inLoader.value
              ? Center(
                  child: CircularProgressIndicator(
                    color: Colors.grey[400],
                  ),
                )
              : GridView.count(
                  crossAxisCount: 2,
                  children: _controller.posts.value
                      .map((poke) => Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => PokeDetail(
                                              pokemon: poke,
                                            )));
                              },
                              child: Hero(
                                tag: poke.img!,
                                child: Card(
                                  color: Colors.grey[100],
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.1,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.4,
                                        child: Image.network(
                                          poke.img!,
                                        ),
                                      ),
                                     
                                      Text(
                                        poke.name!,
                                        style: TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      )
                                ]
                                  ),
                                ),
                              ),
                            ),
                          ))
                      .toList(),
                ),
        ));
  }
}
