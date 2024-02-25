import 'dart:io';

import 'package:flutter/material.dart';
import 'package:greengroovechallenge/main.dart';

class GameGoodEnd extends StatelessWidget {
  final GreenGroove game;
  const GameGoodEnd({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
        onTap: () {
          debugPrint('Tap on Good over Screen');

          // game.overlays.remove('goodover');
          // game.router.pushNamed('gameplay');
          game.overlays.add('menu');
          // game.gameStart();
        },
        child: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/bg6.jpg"),
                  opacity: 0.7,
                  fit: BoxFit.fill)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Expanded(child: SizedBox()),
              Center(
                child: Container(
                  color: Colors.black.withOpacity(0.3),
                  child: const Text(
                    "Congratulations, You Beat the Devil",
                    style: TextStyle(fontSize: 42, color: Colors.white),
                  ),
                ),
              ),
              const Expanded(child: SizedBox()),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: () {
                      game.overlays.remove('goodover');
                      game.overlays.add('menu');
                    },
                    child: Image.asset(
                      'assets/images/Reloadbutton.png',
                      width: 50,
                      height: 50,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      exit(0);
                    },
                    child: Image.asset(
                      'assets/images/Exitbutton.png',
                      width: 50,
                      height: 50,
                    ),
                  )
                ],
              ),
              const Expanded(child: SizedBox()),
              Container(
                width: double.infinity,
                color: Colors.black.withOpacity(0.3),
                child: const Column(
                  children: [
                    Text(
                      'For Global Gamers Challenge',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      'Made with ❤️ by mehdinathani',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      'Copyright © 2023 All rights reserved.',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
