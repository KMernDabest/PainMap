enum Level{
  none,
  low,
  mild, 
  moderate, 
  severe 
}

class BodyPart {
  final int id;
  final String name;
  final String? icon;

  BodyPart({
    required this.id,
    required this.name,
    this.icon,
  });

  factory BodyPart.fromJson(Map<String, dynamic> json) {
    return BodyPart(
      id: json['id'] as int,
      name: json['name'] as String,
      icon: json['icon'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'icon': icon,
  };

  @override
  String toString() => 'BodyPart(id: $id, name: $name, icon: $icon)';

  //Mock Data
  static List<BodyPart> get values => [
    BodyPart(id: 1, name: "general", icon: "accessibility"),
    BodyPart(id: 2, name: "skin", icon: "texture"),
    BodyPart(id: 3, name: "head", icon: "face"),
    BodyPart(id: 4, name: "neck", icon: "neck_health"),
    BodyPart(id: 5, name: "chest", icon: "favorite"),
    BodyPart(id: 6, name: "arms", icon: "handyman"),
    BodyPart(id: 7, name: "abdomen", icon: "center_focus"),
    BodyPart(id: 8, name: "pelvis", icon: "wc"),
    BodyPart(id: 9, name: "back", icon: "airline_seat_recline"),
    BodyPart(id: 10, name: "buttocks", icon:"airline_seat_flat"),
    BodyPart(id: 11, name:"leg",icon:"directions_walk")
  ];

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
