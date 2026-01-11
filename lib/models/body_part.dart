enum Level{
  none,
  low,
  mild, 
  moderate, 
  severe 
}

enum BodyPart {
  head,
  leftArm,
  rightArm,
  abdomen,
  leftLeg,
  rightLeg,
  back
}

extension BodyPartExtension on BodyPart {
  int get id {
    switch (this) {
      case BodyPart.head:
        return 1;
      case BodyPart.leftArm:
        return 2;
      case BodyPart.rightArm:
        return 3;
      case BodyPart.abdomen:
        return 4;
      case BodyPart.leftLeg:
        return 5;
      case BodyPart.rightLeg:
        return 6;
      case BodyPart.back:
        return 7;
    }
  }

  String get name {
    switch (this) {
      case BodyPart.head:
        return 'head';
      case BodyPart.leftArm:
        return 'left arm';
      case BodyPart.rightArm:
        return 'right arm';
      case BodyPart.abdomen:
        return 'abdomen';
      case BodyPart.leftLeg:
        return 'left leg';
      case BodyPart.rightLeg:
        return 'right leg';
      case BodyPart.back:
        return 'back';
    }
  }

  String get icon {
    switch (this) {
      case BodyPart.head:
        return 'face';
      case BodyPart.leftArm:
      case BodyPart.rightArm:
        return 'handyman';
      case BodyPart.abdomen:
        return 'center_focus';
      case BodyPart.leftLeg:
      case BodyPart.rightLeg:
        return 'directions_walk';
      case BodyPart.back:
        return 'accessibility_new';
    }
  }

  static BodyPart fromId(int id) {
    return BodyPart.values.firstWhere(
      (bp) => bp.id == id,
      orElse: () => BodyPart.head,
    );
  }
}