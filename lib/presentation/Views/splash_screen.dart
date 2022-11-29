import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex/presentation/Views/home_page.dart';

import '../controllers/pokemon_controller.dart';

class SplashScreen extends StatefulWidget {


  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
 
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
        SystemChrome.setEnabledSystemUIOverlays(
        [
          SystemUiOverlay.bottom, //This line is used for showing the bottom bar
        ]
    );
    Future.delayed(Duration(seconds: 5), () {
  // 5s over, navigate to a new page
  Navigator.of(context).pushNamed('/home');
});
      
  }

  @override
  Widget build(BuildContext context) {
    return const DecoratedBox(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("splash.jpg"), fit: BoxFit.cover),
          ),
         
            
       
    );
  }
}