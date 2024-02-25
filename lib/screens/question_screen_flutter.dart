import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:greengroovechallenge/main.dart';
import 'package:greengroovechallenge/model/questions_data.dart';

class QuestionScreen extends StatefulWidget {
  final GreenGroove game;
  const QuestionScreen({super.key, required this.game});

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  QuestionData randomQuestion = QuestionManager.getRandomQuestion();

  @override
  Widget build(BuildContext context) {
    log(randomQuestion.nature.toString());
    String questionURL = randomQuestion.questionImagePath;

    return Scaffold(
        body: Container(
      height: double.infinity,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/questionbg.jpg"),
              fit: BoxFit.fill)),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(18),
              child: Column(
                children: [
                  Container(
                    child: Column(
                      children: [
                        CachedNetworkImage(
                          height: 180,
                          width: 180,
                          imageUrl: questionURL,
                          placeholder: (context, url) =>
                              const CircularProgressIndicator(),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        ),
                        // Image.network(
                        //   randomQuestion.questionImagePath,
                        //   width: 170,
                        //   height: 170,

                        // ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          color: Colors.white.withOpacity(0.5),
                          child: Text(
                            randomQuestion.questionText,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                    //questions
                  ),
                  Center(
                    child: Container(
                      //buttons
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ElevatedButton(
                              onPressed: () {
                                if (randomQuestion.nature.toString() ==
                                    "QuestionNature.negative") {
                                  widget.game.iHappy();
                                } else {
                                  widget.game.pHappy();
                                }
                                debugPrint("Yes, Sure");
                                widget.game.gameResume();
                              },
                              child: const Text(
                                "Yes, Sure",
                                style: TextStyle(
                                    color: Colors.green, fontSize: 24),
                              )),
                          const SizedBox(
                            width: 20,
                          ),
                          ElevatedButton(
                              onPressed: () {
                                if (randomQuestion.nature.toString() ==
                                    "QuestionNature.positive") {
                                  widget.game.iHappy();
                                } else {
                                  widget.game.pHappy();
                                }
                                widget.game.gameResume();
                                debugPrint("No, Thanks");
                              },
                              child: const Text(
                                "No, Thanks",
                                style: TextStyle(
                                    color: Colors.green, fontSize: 24),
                              ))
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
