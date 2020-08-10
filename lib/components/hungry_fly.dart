import 'package:flame/sprite.dart';
import 'package:flame_tester/my_game.dart';
import 'package:flutter/rendering.dart';

import 'fly.dart';

class HungryFly extends Fly {
  HungryFly(MyGame game, double x, double y) : super(game) {
    flyRect = Rect.fromLTWH(x, y, game.tileSize * 1.65, game.tileSize * 1.65);
    flyingSprite = List();
    flyingSprite.add(Sprite('flies/hungry-fly-1.png'));
    flyingSprite.add(Sprite('flies/hungry-fly-2.png'));
    deadSprite = Sprite('flies/hungry-fly-dead.png');
  }
}
