import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:greengroovechallenge/main.dart';

class HowToScreen extends StatelessWidget {
  final GreenGroove game;
  const HowToScreen({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
        onTap: () {
          game.playGunLoadSound();
          game.gameStart();
        },
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/bg6.jpg"),
                  fit: BoxFit.fill)),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.purple.withOpacity(0.5),
                      border: Border.all(color: Colors.black)),
                  child: const Center(
                    child: Text(
                      "How to Play ?",
                      style: TextStyle(
                          fontSize: 52,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 0, 0, 0)
                                  .withOpacity(0.5),
                              border: Border.all(color: Colors.black)),
                          child: const Row(
                            children: [
                              Expanded(
                                child: Column(
                                  children: [
                                    Text(
                                      "Don'ts",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 22,
                                      ),
                                    ),
                                    Text(
                                      "‣ Usage of disposable plastic. \n\n‣ Waste Water. \n\n‣ Cut down Trees and Plants. \n\n‣ Kill Birds and Animals without reason. \n\n‣ Increase Electricity and Fuel usage. \n\n‣ and anything which are harmfull for our earth.\n",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 22),
                                    )
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    Text(
                                      "Do's",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 22,
                                      ),
                                    ),
                                    Text(
                                      "‣ Plant Trees \n\n‣ Prefer E copy instead of paper. \n\n‣ Recycle papers and plastic. \n\n‣ Choose LED Bulbs and energy efficient Appliancies. \n\n‣ and everything which are benificial for our earth.\n",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 22),
                                    )
                                  ],
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
                  color: Colors.red.withOpacity(1),
                  child: Center(
                    child: DefaultTextStyle(
                      style: const TextStyle(
                        fontSize: 30.0,
                        fontFamily: 'Agne',
                      ),
                      child: AnimatedTextKit(animatedTexts: [
                        FlickerAnimatedText("Tap to Continue"),
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
