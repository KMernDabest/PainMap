enum Level{
  none,
  low,
  mild, 
  moderate, 
  severe 
}

enum BodyPart {
  head(1, 'head', 'face'),
  leftArm(2, 'left arm', 'handyman'),
  rightArm(3, 'right arm', 'handyman'),
  abdomen(4, 'abdomen', 'center_focus'),
  leftLeg(5, 'left leg', 'directions_walk'),
  rightLeg(6, 'right leg', 'directions_walk'),
  back(7, 'back', 'accessibility_new');

  final int id;
  final String name;
  final String icon;

  const BodyPart(this.id, this.name, this.icon);
}