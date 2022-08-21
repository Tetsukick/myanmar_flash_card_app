import 'package:bintango_jp/gen/assets.gen.dart';

enum LevelGroup {
  n5,
  n4,
  n3,
  n2,
  n1
}

extension LevelGroupExt on LevelGroup {
  int get range {
    switch (this) {
      case LevelGroup.n5:
        return 1;
      case LevelGroup.n4:
        return 2;
      case LevelGroup.n3:
        return 3;
      case LevelGroup.n2:
        return 4;
      case LevelGroup.n1:
        return 5;
    }
  }

  String get title {
    switch (this) {
      case LevelGroup.n5:
        return 'N5';
      case LevelGroup.n4:
        return 'N4';
      case LevelGroup.n3:
        return 'N3';
      case LevelGroup.n2:
        return 'N2';
      case LevelGroup.n1:
        return 'N1';
    }
  }

  SvgGenImage get svg {
    switch (this) {
      case LevelGroup.n5:
        return Assets.svg.cat;
      case LevelGroup.n4:
        return Assets.svg.easy;
      case LevelGroup.n3:
        return Assets.svg.world;
      case LevelGroup.n2:
        return Assets.svg.difficult;
      case LevelGroup.n1:
        return Assets.svg.ufo;
    }
  }

  double get testFactor {
    switch (this) {
      case LevelGroup.n5:
        return 1.0;
      case LevelGroup.n4:
        return 1.2;
      case LevelGroup.n3:
        return 1.5;
      case LevelGroup.n2:
        return 2.0;
      case LevelGroup.n1:
        return 3.0;
    }
  }

  static LevelGroup intToLevelGroup({required int value}) {
    switch (value) {
      case 1:
        return LevelGroup.n5;
      case 2:
        return LevelGroup.n4;
      case 3:
        return LevelGroup.n3;
      case 4:
        return LevelGroup.n2;
      case 5:
        return LevelGroup.n1;
      default:
        return LevelGroup.n5;
    }
  }
}