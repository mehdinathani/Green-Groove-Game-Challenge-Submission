import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:greengroovechallenge/main.dart';

class IntroScreen extends StatelessWidget {
  final GreenGroove game;
  const IntroScreen({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
        onTap: () {
          game.playGunLoadSound();

          game.overlays.add('howto');
          game.overlays.remove('intro');
        },
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/bg3.jpg"),
                  fit: BoxFit.fill)),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.purple.withOpacity(0.5),
                              border: Border.all(color: Colors.black)),
                          child: const Center(
                            child: Text(
                              "About The Game",
                              style: TextStyle(
                                  fontSize: 52,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Center(
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.5),
                                border: Border.all(color: Colors.black)),
                            child: SizedBox(
                              child: DefaultTextStyle(
                                style: const TextStyle(
                                  fontSize: 30.0,
                                  fontFamily: 'Agne',
                                ),
                                child: AnimatedTextKit(
                                  animatedTexts: [
                                    TypewriterAnimatedText(
                                      'Every minute, countless trees are cut down, and marine life faces threats from plastic.',
                                      speed: const Duration(milliseconds: 100),
                                    ),
                                    TypewriterAnimatedText(
                                      "Let's save the world from global warming and environmental harm.",
                                      speed: const Duration(milliseconds: 100),
                                    ),
                                    TypewriterAnimatedText(
                                      "Let's Play the game, where every action translates into real-world impact!",
                                      speed: const Duration(milliseconds: 100),
                                    ),
                                    TypewriterAnimatedText(
                                      ' Be the change.',
                                      speed: const Duration(milliseconds: 100),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        // SizedBox(
                        //   child: AnimatedTextKit(
                        //     animatedTexts: [

                        //     ],
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  color: Colors.black.withOpacity(1),
                  child: Center(
                    child: DefaultTextStyle(
                      style: const TextStyle(
                        fontSize: 30.0,
                        fontFamily: 'Agne',
                      ),
                      child: AnimatedTextKit(animatedTexts: [
                        FlickerAnimatedText("Tap to Continue",
                            textStyle: const TextStyle(color: Colors.white)),
                      ], repeatForever: true),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
