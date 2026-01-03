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

// /// Body parts enumeration
// enum BodyPart {
//   general,
//   skin,
//   head,
//   neck,
//   chest,
//   arms,
//   abdomen,
//   pelvis,
//   back,
//   buttocks,
//   leg,
// }

// enum BodyArea{
// // Head Areas
//   scalp,
//   forehead,
//   eye,
//   nose,
//   ears,
//   face,
//   mouth,
//   jaw,

// //Neck Area
//   frontNeck,
//   backNeck,
//   sideNeck,

// //Chest Area
//   upperChest,
//   middleChest,
//   lowerChest,
//   ribs,
//   sternum,
//   breast,

// //Arm Area
//   shoulder,
//   upperArm,
//   elbow,
//   forearm,
//   wrist,
//   hand,
//   fingers,
//   armpit,


// //Abdomen Areas
//   upperAbdomen,
//   middleAbdomen,
//   lowerAbdomen,
//   sides,
//   epigastric,

// //Pelvis Areas
//   hip,
//   groin,
//   suprapubic,
//   genitals,

// //Back areas
//   upperBack,
//   middleBack,
//   lowerBack,
//   flank,
//   tailbone,

// //Buttocks areas
//   rectrum,

// //Legs Areas
//   thigh,
//   hamstring,
//   knee,
//   ankle,
//   foot,
//   toes,
//   popliteal,
//   shin,
//   heel,
//   calf,

//   //Skin Areas
//   skin,
//   general,
// }
