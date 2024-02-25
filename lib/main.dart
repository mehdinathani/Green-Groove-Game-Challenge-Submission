import 'package:flame/events.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart' hide Route;
import 'package:greengroovechallenge/screens/game_bad_over_screen.dart';
import 'package:greengroovechallenge/screens/game_good_over_screen.dart';
import 'package:greengroovechallenge/screens/game_howto_screen_Flutter.dart';
import 'package:greengroovechallenge/screens/game_intro_screen_Flutter.dart';
import 'package:greengroovechallenge/screens/game_over_screen.dart';
import 'package:greengroovechallenge/screens/game_play_screen.dart';
import 'package:greengroovechallenge/screens/game_start_screen_Flutter.dart';
import 'package:greengroovechallenge/screens/question_screen_flutter.dart';
import 'package:greengroovechallenge/screens/start_screen.dart';
import 'package:greengroovechallenge/sprites/bird.dart';
import 'package:greengroovechallenge/sprites/coins.dart';
import 'package:greengroovechallenge/sprites/player.dart';
import 'package:greengroovechallenge/sprites/tree.dart';
import 'package:greengroovechallenge/sprites/weapon_axe.dart';

void main() {
  runApp(
    GameWidget<GreenGroove>.controlled(
      loadingBuilder: (p0) => const Material(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ),
      errorBuilder: (p0, error) => Material(
        child: Text(error.toString()),
      ),
      gameFactory: GreenGroove.new,
      overlayBuilderMap: {
        "menu": (_, game) => MenuScreen(game: game),
        "howto": (_, game) => HowToScreen(game: game),
        "question": (_, game) => QuestionScreen(game: game),
        "goodover": (_, game) => GameGoodEnd(game: game),
        "badover": (_, game) => GameBadEnd(game: game),
        "intro": (_, game) => IntroScreen(game: game),
      },
      initialActiveOverlays: const ['menu'],
    ),
  );
}

class GreenGroove extends FlameGame with TapCallbacks, HasCollisionDetection {
  var bglobe = const AssetImage("assets/images/globe.jpg");
  Stopwatch elapsedTime = Stopwatch();
  bool gameOver = false;
  bool showingGameOverScreen = false;
  Vector2 jump = Vector2(0, -80);
  late final RouterComponent router;
  Boy boy = Boy();
  Bird bird = Bird();
  Tree tree = Tree();
  WeaponAxe weaponAxe = WeaponAxe();
  Coins coins = Coins();
  AudioPlayer audioPlayer = AudioPlayer();

  // bool isGameRunning = false;

  int pScore = 0;
  int iScore = 25;
  int devilsProductEat = 0;
  int coinCount = 0;
  bool isGamePaused = false;
  final bgm = FlameAudio.bgm;
  AudioCache cache = AudioCache();

  bool skipNextMissile = false; // Flag to indicate skipping

  @override
  Future<void> onLoad() async {
    Flame.device.setLandscape();
    Flame.device.fullScreen();

    WidgetsFlutterBinding.ensureInitialized();

    super.onLoad();

    add(
      router = RouterComponent(
        initialRoute: 'gameplay',
        routes: {
          'gameplay': Route(GamePlayScreen.new),
          'gameover': Route(GameOverScreen.new),
          'start': Route(StartScreen.new),
        },
      ),
    );
    gamePaused();
  }

  @override
  void update(double dt) {
    if (gameOver && !showingGameOverScreen) {
      // router.pushNamed('gameover');
      showingGameOverScreen = true;
    }
    if (iScore <= 0) {
      // bgm.pause();
      gamePaused();
      bgm.stop();
      gameOver = true;
      debugPrint("iscore $iScore");
      overlays.add("goodover");
    }

    if (iScore >= 100 || pScore < 0) {
      gamePaused();
      overlays.add("badover");
    }

    super.update(dt);
  }

  void gamePaused() {
    elapsedTime.stop();
    bgm.pause();
    isGamePaused = true;
    pauseEngine();
  }

  void showQuestionSheet() {
    gamePaused();
    overlays.add("question");
  }

  void gameResume() {
    elapsedTime.start();
    // p.resume();
    // Duration()
    isGamePaused = false;
    overlays.remove('question');
    bgm.resume();

    // overlays.remove('start');
    showingGameOverScreen = false;
    gameOver = false;
    resumeEngine();
    Future.delayed(const Duration(seconds: 10));

    bgm.resume();
  }

  void reset() {
    isGamePaused = false;
    gameOver = false;
    showingGameOverScreen = false;
    boy.animationTicker?.reset();
    coins.animationTicker?.reset();
    elapsedTime.reset();
    iScore = 25;
    pScore = 0;
    coinCount = 0;
    bgm.stop();

    // bgm.resume();
  }

  void onmissileCollision() {
    FlameAudio.play('birddying.mp3');
    iScore++;
  }

  Future<void> gameStart() async {
    showingGameOverScreen = false;
    overlays.remove('menu');
    overlays.remove('goodover');
    overlays.remove('badover');
    overlays.remove('howto');
    overlays.remove('intro');
    reset();
    elapsedTime.start();

    resumeEngine();

    // await bgm.play('bgsound.mp3');
    // router.pushNamed('gameplay');
    // overlays.add('menu');
    debugPrint("gameStart function");
  }

  pHappy() async {
    pScore++;
    iScore--;
    skipNextMissile = true;

    FlameAudio.play('birdsing.mp3');
  }

  iHappy() {
    pScore--;
    iScore++;
    FlameAudio.audioCache.clearAll();

    FlameAudio.play('explosive.mp3');
  }

  void handleUserResponse(bool userAnsweredYes) {
    // Implement your logic to handle the user's response here
    // Access the user's choice using userAnsweredYes

    // Example:
    if (userAnsweredYes) {
      // User answered yes
      print("User said yes!");
      // Perform actions based on yes response
    } else {
      // User answered no
      print("User said no.");
      // Perform actions based on no response
    }
  }

  // void shareApp() {
  //   Share.share(
  //     'Lets defeat the Devil togeather, \n \nwebsite : https://mehdinathani.github.io/projects/GreenGroove/ \n \nDownload the App : http://tinyurl.com/GreenGroove',
  //   );
  // }

  // void shareContribution() {
  //   Share.share(
  //     "I have contributed $pScore ❤️ and $coinCount 🪙 to the battle against the devil. \n \nLet's join forces and take on the challenge together! \n \nJoin me on: https://mehdinathani.github.io/projects/GreenGroove/ \n\nor\n\nDownload the app: http://tinyurl.com/GreenGroove",
  //   );
  // }

  void playGunLoadSound() {
    FlameAudio.play("loadGun.mp3");
  }

  void eatDevilsProduct() {
    FlameAudio.play("babycrysound.mp3");
    iScore++;
    coinCount--;
    pScore--;
    devilsProductEat++;
  }

  void onTreeCut() {
    FlameAudio.play("treecutting.mp3");
    iScore++;
    coinCount--;
    pScore--;
    // devilsProductEat++;
  }
}
