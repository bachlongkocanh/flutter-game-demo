import 'dart:math';
import 'dart:ui';

import 'package:flame/flame.dart';
import 'package:flame/game/game.dart';
import 'package:flame/gestures.dart';
import 'package:flutter/gestures.dart';

import 'components/agile_fly.dart';
import 'components/backyard.dart';
import 'components/drooler_fly.dart';
import 'components/fly.dart';
import 'components/house_fly.dart';
import 'components/hungry_fly.dart';
import 'components/macho_fly.dart';

class MyGame extends Game with TapDetector {
  Size screenSize;
  double tileSize;

  Paint paint;

  Backyard background;

  final int scale = 5;

  final int numberOfFly = 3;

  bool respawn = false;

  List<Fly> flies;
  final rnd = Random();

  MyGame() {
    initialize();
  }

  void spawnFly() {
    double x = rnd.nextDouble() * (screenSize.width - tileSize);
    double y = rnd.nextDouble() * (screenSize.height - tileSize);

    switch (rnd.nextInt(5)) {
      case 0:
        flies.add(HouseFly(this, x, y));
        break;
      case 1:
        flies.add(DroolerFly(this, x, y));
        break;
      case 2:
        flies.add(AgileFly(this, x, y));
        break;
      case 3:
        flies.add(MachoFly(this, x, y));
        break;
      case 4:
        flies.add(HungryFly(this, x, y));
        break;
    }
  }

  void initialize() async {
    flies = List<Fly>();
    resize(await Flame.util.initialDimensions());

    background = Backyard(this);
    for (var i = 0; i < numberOfFly; i++) {
      spawnFly();
    }
  }

  @override
  void render(Canvas canvas) {
    background.render(canvas);

    flies.forEach((Fly fly) => fly.render(canvas));
  }

  @override
  void update(double t) {
    flies.forEach((element) => element.update(t));
    flies.removeWhere((element) => element.isOffScreen);

    if (respawn) {
      respawn = false;
      spawnFly();
    }
  }

  @override
  void resize(Size size) {
    screenSize = size;
    tileSize = screenSize.width / 9;
  }

  @override
  void onTapDown(TapDownDetails details) {
    flies.forEach((Fly fly) {
      if (fly.flyRect.contains(details.globalPosition)) {
        fly.onTapDown();
        respawn = true;
      }
    });
  }
}
