enum SortType {
  myanmar,
  myanmarReverse,
  level,
  levelReverse,
}

extension SortTypeExt on SortType {
  String get title {
    switch (this) {
      case SortType.myanmar:
        return 'A→Z ascending order';
      case SortType.myanmarReverse:
        return 'Z→A descending order';
      case SortType.level:
        return 'level ascending order';
      case SortType.levelReverse:
        return 'level descending order';
    }
  }
}