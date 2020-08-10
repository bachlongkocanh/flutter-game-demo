import 'package:flame/sprite.dart';
import 'package:flame_tester/my_game.dart';
import 'package:flutter/rendering.dart';

import 'fly.dart';

class MachoFly extends Fly {
  MachoFly(MyGame game, double x, double y) : super(game) {
    flyRect = Rect.fromLTWH(x, y, game.tileSize * 2.025, game.tileSize * 2.025);
    flyingSprite = List();
    flyingSprite.add(Sprite('flies/macho-fly-1.png'));
    flyingSprite.add(Sprite('flies/macho-fly-2.png'));
    deadSprite = Sprite('flies/macho-fly-dead.png');
  }
}
