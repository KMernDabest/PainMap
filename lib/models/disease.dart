

class Disease {
  final int id;
  final String name;
  final int bodyPartId;
  final String? description;
  final String? symptomDetails;
  // final int? level;

  Disease({
    required this.id,
    required this.name,
    required this.bodyPartId,
    this.description,
    this.symptomDetails,
    // this.level,
  });

  List<Disease> diseaseList = [
    //Head Diseases
    Disease(
      id: 1,
      name: "Migraine Headache",
      bodyPartId: 1,
      symptomDetails: "The most common symptoms of migraine include a dull or severe headache that may be worse on one side of the head, and a throbbing, pulsating, or pounding in the head. Other symptoms may include loss of appetite, nausea and vomiting, sensitivity to sound or light, chills, sweating, numbness or tingling, and increased urination.",
      description: "Migraines are a common type of headache that can cause severe pain. They can last for a few hours or a few days and may cause throbbing, sensitivity to sound or light, nausea, or vomiting. Migraines are caused by abnormal brain activity that is triggered by certain foods, stress, or other factors. Some people have an aura before a migraine, which can have symptoms that include temporary vision loss, seeing stars or flashes, or a tingling in an arm or leg. There is no cure for migraines, but medications can help reduce pain or stop migraines from occurring.",
    ),
    Disease(
      id: 2,
      name: "Labyrinthitis",
      bodyPartId: 1,
      symptomDetails: "Dizziness, loss of balance, a sensation of spinning or moving when you are still, nausea, vomiting, headache, hearing loss, difficulty concentrating, and ringing in the ears (tinnitus)",
      description: "Labyrinthitis is an infection and swelling in the inner ear. Usually, viruses cause labyrinthitis. Labyrinthitis may cause vertigo -- dizziness, loss of balance, nausea, vomiting -- and sometimes hearing loss. An inner ear infection is different from common childhood ear infections. Those are typically caused by bacteria in the middle ear.",
    ),
    Disease(
      id: 3,
      name: "Tension Headache",
      bodyPartId: 1,
      symptomDetails: "Dull, aching head pain, sensation of tightness or pressure across the forehead or on the sides and back of the head, tenderness on the scalp, neck and shoulder muscles",
      description: "Tension headaches are the most common type of headache. They can cause mild to moderate pain and a feeling of tightness or pressure around the head. Tension headaches are often caused by stress, anxiety, poor posture, or muscle tension in the neck and shoulders. They can last from 30 minutes to several hours and may occur frequently. Treatment for tension headaches includes over-the-counter pain relievers, stress management techniques, and lifestyle changes such as regular exercise and proper sleep habits.",
    ),
  ];

  @override
  String toString() => 'Disease(id: $id, name: $name, description: $description)';

}