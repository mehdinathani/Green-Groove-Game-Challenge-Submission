import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:greengroovechallenge/main.dart';

class MenuScreen extends StatelessWidget {
  final GreenGroove game;
  const MenuScreen({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
        onTap: () async {
          game.playGunLoadSound();
          // await _showNameInputDialog(context);
          game.overlays.add('intro');
          game.overlays.remove('menu');
        },
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/bg1.jpg"),
                  fit: BoxFit.fill)),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // SizedBox(
                      //   width: MediaQuery.of(context).size.width * 0.1,
                      // ),
                      Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(
                              height: 50,
                            ),
                            SizedBox(
                              child: Text(
                                "Green Groove Challenge",
                                style: TextStyle(
                                    backgroundColor:
                                        Colors.white.withOpacity(0.7),
                                    decorationStyle: TextDecorationStyle.wavy,
                                    fontSize: 52,
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Center(
                              child: SizedBox(
                                width: 250.0,
                                child: DefaultTextStyle(
                                  style: const TextStyle(
                                    fontSize: 55,
                                    color: Colors.white,
                                    shadows: [
                                      Shadow(
                                        blurRadius: 7.0,
                                        color: Colors.white,
                                        offset: Offset(0, 0),
                                      ),
                                    ],
                                  ),
                                  child: AnimatedTextKit(
                                    repeatForever: true,
                                    animatedTexts: [
                                      FlickerAnimatedText("Let's Go."),
                                    ],
                                    onTap: () {
                                      debugPrint("Tap Event");
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                color: Colors.black.withOpacity(0.3),
                child: const Column(
                  children: [
                    Text(
                      'For Global Citizens Challenge',
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
                      'Copyright © 2024 All rights reserved.',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
