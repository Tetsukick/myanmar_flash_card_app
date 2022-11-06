import 'package:flutter/cupertino.dart';
import 'package:bintango_jp/gen/assets.gen.dart';

import '../utils/analytics/analytics_parameters.dart';

enum WordStatusType {
  notLearned,
  notRemembered,
  remembered,
  perfectRemembered,
}

extension WordStatusTypeExt on WordStatusType {
  int get id => index;

  String get title {
    switch (this) {
      case WordStatusType.notLearned:
        return 'not yet learned';
      case WordStatusType.notRemembered:
        return 'not yet remember';
      case WordStatusType.remembered:
        return 'almost remember';
      case WordStatusType.perfectRemembered:
        return 'remembered';
    }
  }

  String get actionTitle {
    switch (this) {
      case WordStatusType.notLearned:
        return '';
      case WordStatusType.notRemembered:
        return 'not remember';
      case WordStatusType.remembered:
        return 'almost remember';
      case WordStatusType.perfectRemembered:
        return 'remembered';
    }
  }

  Widget get icon {
    const height = 16.0;
    const width = 16.0;
    switch (this) {
      case WordStatusType.notLearned:
        return Assets.png.minus128.image(height: height, width: width);
      case WordStatusType.notRemembered:
        return Assets.png.cancelRed128.image(height: height, width: width);
      case WordStatusType.remembered:
        return Assets.png.checkedGreen128.image(height: height, width: width);
      case WordStatusType.perfectRemembered:
        return Assets.png.checkGreenRich64.image(height: height, width: width);
    }
  }

  Widget get iconLarge {
    const height = 40.0;
    const width = 40.0;
    switch (this) {
      case WordStatusType.notLearned:
        return Assets.png.minus128.image(height: height, width: width);
      case WordStatusType.notRemembered:
        return Assets.png.cancelRed128.image(height: height, width: width);
      case WordStatusType.remembered:
        return Assets.png.checkedGreen128.image(height: height, width: width);
      case WordStatusType.perfectRemembered:
        return Assets.png.checkGreenRich64.image(height: height, width: width);
    }
  }

  FlushCardItem get analyticsItem {
    switch (this) {
      case WordStatusType.notLearned:
        return FlushCardItem.unknown;
      case WordStatusType.notRemembered:
        return FlushCardItem.unknown;
      case WordStatusType.remembered:
        return FlushCardItem.remember;
      case WordStatusType.perfectRemembered:
        return FlushCardItem.remember;
    }
  }

  static WordStatusType intToWordStatusType(int id) {
    switch (id) {
      case 0:
        return WordStatusType.notLearned;
      case 1:
        return WordStatusType.notRemembered;
      case 2:
        return WordStatusType.remembered;
      case 3:
        return WordStatusType.perfectRemembered;
      default:
        return WordStatusType.notLearned;
    }
  }
}