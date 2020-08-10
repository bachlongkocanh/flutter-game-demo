import 'package:flame/sprite.dart';
import 'package:flame_tester/my_game.dart';
import 'package:flutter/rendering.dart';

import 'fly.dart';

class HouseFly extends Fly {
  HouseFly(MyGame game, double x, double y) : super(game) {
    flyRect = Rect.fromLTWH(x, y, game.tileSize * 1.5, game.tileSize * 1.5);
    flyingSprite = List<Sprite>();
    flyingSprite.add(Sprite('flies/house-fly-1.png'));
    flyingSprite.add(Sprite('flies/house-fly-2.png'));
    deadSprite = Sprite('flies/house-fly-dead.png');
  }
}
