import 'package:flutter/material.dart';

import 'package:pokedex/inject.dart';
import 'package:pokedex/presentation/Views/home_page.dart';
import 'package:pokedex/presentation/Views/pokemon_detail.dart';
import 'package:pokedex/presentation/Views/splash_screen.dart';



void main(){
  Inject.initialize();
   runApp(MaterialApp(
      title: "Poke App",
    
      
   
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
       routes: {
        '/': (context) =>SplashScreen(),
      '/home': (context) => HomePage(),
      
    },
    ));
}

