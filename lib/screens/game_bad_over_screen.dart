import 'dart:io';

import 'package:flutter/material.dart';
import 'package:greengroovechallenge/main.dart';

class GameBadEnd extends StatelessWidget {
  final GreenGroove game;
  const GameBadEnd({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
        onTap: () {
          debugPrint('Tap on bad over Screen');

          // game.overlays.remove('goodover');
          // game.router.pushNamed('gameplay');
          game.overlays.add('menu');
          // game.gameStart();
        },
        child: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/gamelostbg.jpg"),
                  opacity: 0.7,
                  fit: BoxFit.fill)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Expanded(child: SizedBox()),
              Center(
                child: Container(
                  color: Colors.black.withOpacity(0.3),
                  child: const Column(
                    children: [
                      Text(
                        "Game Lost",
                        style: TextStyle(fontSize: 42, color: Colors.white),
                      ),
                      Text(
                        "You failed to beat the Global Warming and save the Earth.",
                        style: TextStyle(fontSize: 42, color: Colors.white),
                      ),
                      Text(
                        "Try Again",
                        style: TextStyle(fontSize: 42, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
              const Expanded(child: SizedBox()),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Image.asset(
                    'assets/images/Reloadbutton.png',
                    width: 50,
                    height: 50,
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
                      'Global Gamers Challenge',
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
