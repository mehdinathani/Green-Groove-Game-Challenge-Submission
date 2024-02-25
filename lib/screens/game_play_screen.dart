import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/input.dart';
import 'package:flame/parallax.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:greengroovechallenge/gui/countCounter.dart';
import 'package:greengroovechallenge/gui/elapsed_time.dart';
import 'package:greengroovechallenge/gui/ghealth.dart';
import 'package:greengroovechallenge/gui/iScore.dart';
import 'package:greengroovechallenge/gui/ihealth_bar.dart';
import 'package:greengroovechallenge/gui/pScore.dart';
import 'package:greengroovechallenge/gui/play_pause_button.dart';
import 'package:greengroovechallenge/main.dart';
import 'package:greengroovechallenge/sprites/bird.dart';
import 'package:greengroovechallenge/sprites/coins.dart';
import 'package:greengroovechallenge/sprites/tree.dart';
import 'package:greengroovechallenge/sprites/weapon_axe.dart';

class GamePlayScreen extends Component
    with HasGameRef<GreenGroove>, DragCallbacks, HasCollisionDetection {
  Timer interval = Timer(3, repeat: true);
  Timer intervalTenSec = Timer(10, repeat: true);
  Timer intervalforDP = Timer(5, repeat: true);
  Timer intervalforTree = Timer(10, repeat: true);
  late double upperLimit;
  late double lowerLimit;

  bool isTap = false;

  @override
  void onLoad() async {
    await super.onLoad();
    gameRef.elapsedTime.start();

    // // Generate file names for the animation frames
    // final List<String> frameFileNames = List.generate(
    //     50, (index) => 'running_${index.toString().padLeft(3, '0')}.png');

    ParallaxComponent bambooBidge = await gameRef.loadParallaxComponent([
      ParallaxImageData('forest_bridge.png'),
    ],
        baseVelocity: Vector2(100, 0),
        velocityMultiplierDelta: Vector2(1.6, 1.0));

    add(bambooBidge);

    add(gameRef.boy);
    add(gameRef.bird);
    // add(gameRef.weaponAxe);
    interval.onTick = () => add(Coins());
    intervalforTree.onTick = () => add(Tree());
    // intervalforDP.onTick = () => add(DevilsProducts());

    add(ElapsedTime());

    add(IHealthBar(
        position: kIsWeb
            ? Vector2(gameRef.size.x * .85, gameRef.size.y / 2 * 0.04)
            : Vector2(gameRef.size.x * .73, gameRef.size.y / 2 * 0.04),
        size: Vector2(gameRef.size.x / 2, gameRef.size.y / 2)));
    add(IScore());
    add(PScore());

    add(PlayPauseButton());
    add(
      TextComponent(
          text: "Your Contribution for Earth",
          scale: Vector2.all(1.5),
          position: Vector2(gameRef.size.x * .03, 7),
          textRenderer: TextPaint(
              style: const TextStyle(
                  color: Colors.black, fontWeight: FontWeight.bold))),
    );
    add(CountCounter());

    add(
      SpriteComponent(
        sprite: await Sprite.load("globalwarming.png"), size: Vector2(100, 100),
        // scale = Vector2.all(3);,
        position: Vector2(gameRef.size.x - 110, gameRef.size.y / 2 * 0.007),
      ),
    );

    add(SpriteButtonComponent(
        button: await Sprite.load("homebutton.png"),
        size: Vector2(50, 50),
        position: Vector2(gameRef.size.x * .05, gameRef.size.y / 2 * 1.7),
        onPressed: () {
          game.playGunLoadSound();
          game.gamePaused();
          game.overlays.add('menu');
        }));
    add(SpriteButtonComponent(
        button: await Sprite.load("Pausebutton.png"),
        size: Vector2(50, 50),
        position: Vector2(gameRef.size.x * .26, gameRef.size.y / 2 * 1.7),
        onPressed: () {
          game.playGunLoadSound();

          if (gameRef.isGamePaused) {
            gameRef.gameResume();
          } else {
            gameRef.gamePaused();
          }
        }));
    add(SpriteButtonComponent(
        button: await Sprite.load("Reloadbutton.png"),
        size: Vector2(50, 50),
        position: Vector2(gameRef.size.x * .47, gameRef.size.y / 2 * 1.7),
        onPressed: () {
          game.playGunLoadSound();

          // game.overlays.add('menu');
          // Future.delayed(const Duration(seconds: 3));

          // game.overlays.remove('menu');
          game.reset();
        }));
    add(SpriteButtonComponent(
        button: await Sprite.load("soundbutton.png"),
        size: Vector2(50, 50),
        position: Vector2(gameRef.size.x * .68, gameRef.size.y / 2 * 1.7),
        onPressed: () {
          game.playGunLoadSound();
        }));
    add(SpriteButtonComponent(
        button: await Sprite.load("sharebutton.png"),
        size: Vector2(50, 50),
        position: Vector2(gameRef.size.x * .89, gameRef.size.y / 2 * 1.7),
        onPressed: () {
          game.playGunLoadSound();

          // game.shareContribution();
        }));
    add(SpriteButtonComponent(
        button: await Sprite.load("Battleaxe01.png"),
        size: Vector2(50, 50),
        position: Vector2(gameRef.size.x * 0.03, gameRef.size.y * 0.4),
        onPressed: () {
          if (gameRef.coinCount < 1) {
            add(WeaponAxe());
          }
        }));
    intervalTenSec.onTick = () {
      if (!gameRef.skipNextMissile) {
        debugPrint("Missile launched");
        add(Bird());
      } else {
        gameRef.skipNextMissile =
            false; // Reset the flag for subsequent missiles
      }
    };
  }

  @override
  void update(double dt) {
    interval.update(dt);
    intervalTenSec.update(dt); // Update the 10-second timer as well
    intervalforDP.update(dt);
    intervalforTree.update(dt);

    super.update(dt);
  }

  // @override
  // void onTapDown(TapDownInfo) {
  //   debugPrint("Tap");
  //   gameRef.boy.isTap = true;
  // }
  @override
  void onDragUpdate(DragUpdateEvent event) {
    upperLimit = gameRef.size.y / 2 * 1.1;
    lowerLimit = gameRef.size.y / 2 * 0.4;
    // Extract the desired Y movement from the delta
    double yDelta = event.delta.y;

    // Update the Y position based on the yDelta
    gameRef.boy.position.y += yDelta;

    // Ensure the boy stays within the vertical bounds
    gameRef.boy.position.y =
        gameRef.boy.position.y.clamp(lowerLimit, upperLimit);

    super.onDragUpdate(event);
  }

  @override
  bool containsLocalPoint(Vector2 point) => true;
}
