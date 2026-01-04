import 'body_part.dart';
import './disease.dart';


class Symptom {
  final int id;
  final String name;
  final List<Disease> diseasesId;
  final BodyPart bodyPart;
  
  Symptom({
    required this.id,
    required this.name,
    required this.bodyPart,
    this.diseasesId = const [],
  });

  static List<Symptom> symptomList = [
    //Head Symptoms
    Symptom(id: 1, name: "Dizziness", diseasesId: [], bodyPart: BodyPart.head),
    Symptom(id: 2, name: "Fever", diseasesId: [], bodyPart: BodyPart.head),
    Symptom(id: 3, name: "Insomnia", diseasesId: [], bodyPart: BodyPart.head), 
    Symptom(id: 4, name: "Memory Loss", diseasesId: [], bodyPart: BodyPart.head),
    Symptom(id: 6, name: "Migraine Headache", diseasesId: [], bodyPart: BodyPart.head),
    Symptom(id: 7, name: "Really sleepy during the day", diseasesId: [], bodyPart: BodyPart.head),
    Symptom(id: 8, name: "Severe headache", diseasesId: [], bodyPart: BodyPart.head),
    Symptom(id: 9, name: "Tension headache", diseasesId: [], bodyPart: BodyPart.head),
    Symptom(id: 10, name: "Trouble Concentrating", diseasesId: [], bodyPart: BodyPart.head),

    //LeftArm Symptoms
    Symptom(id: 11, name: "Arm pain", diseasesId: [], bodyPart: BodyPart.leftArm),
    Symptom(id: 12, name: "Numbness in fingers", diseasesId: [], bodyPart: BodyPart.leftArm),
    Symptom(id: 13, name: "Tingling sensation", diseasesId: [], bodyPart: BodyPart.leftArm),   
    Symptom(id: 14, name: "Weak grip", diseasesId: [], bodyPart: BodyPart.leftArm),
    Symptom(id: 15, name: "Wrist pain", diseasesId: [], bodyPart: BodyPart.leftArm),
    Symptom(id: 16, name: "Elbow pain", diseasesId: [], bodyPart: BodyPart.leftArm),
    Symptom(id: 17, name: "Shoulder stiffness", diseasesId: [], bodyPart: BodyPart.leftArm),
    Symptom(id: 18, name: "Limited arm movement", diseasesId: [], bodyPart: BodyPart.leftArm),
    Symptom(id: 19, name: "Muscle cramps", diseasesId: [], bodyPart: BodyPart.leftArm),
    Symptom(id: 20, name: "Swelling in arm", diseasesId: [], bodyPart: BodyPart.leftArm),

    //RightArm Symptoms
    Symptom(id: 21, name: "Arm pain", diseasesId: [], bodyPart: BodyPart.rightArm),
    Symptom(id: 22, name: "Numbness in fingers", diseasesId: [], bodyPart: BodyPart.rightArm),
    Symptom(id: 23, name: "Tingling sensation", diseasesId: [], bodyPart: BodyPart.rightArm),
    Symptom(id: 24, name: "Weak grip", diseasesId: [], bodyPart: BodyPart.rightArm),  
    Symptom(id: 25, name: "Wrist pain", diseasesId: [], bodyPart: BodyPart.rightArm),
    Symptom(id: 26, name: "Elbow pain", diseasesId: [], bodyPart: BodyPart.rightArm),
    Symptom(id: 27, name: "Shoulder stiffness", diseasesId: [], bodyPart: BodyPart.rightArm),
    Symptom(id: 28, name: "Limited arm movement", diseasesId: [], bodyPart: BodyPart.rightArm),
    Symptom(id: 29, name: "Muscle cramps", diseasesId: [], bodyPart: BodyPart.rightArm),
    Symptom(id: 30, name: "Swelling in arm", diseasesId: [], bodyPart: BodyPart.rightArm),

    //Abdomen Symptoms
    Symptom(id: 31, name: "Abdominal pain", diseasesId: [], bodyPart: BodyPart.abdomen),
    Symptom(id: 32, name: "Bloating", diseasesId: [], bodyPart: BodyPart.abdomen),
    Symptom(id: 33, name: "Constipation", diseasesId: [], bodyPart: BodyPart.abdomen),
    Symptom(id: 34, name: "Diarrhea", diseasesId: [], bodyPart: BodyPart.abdomen),
    Symptom(id: 35, name: "Fatigue", diseasesId: [], bodyPart: BodyPart.abdomen),
    Symptom(id: 36, name: "Nausea", diseasesId: [], bodyPart: BodyPart.abdomen),
    Symptom(id: 37, name: "Vomiting", diseasesId: [], bodyPart: BodyPart.abdomen),
    Symptom(id: 38, name: "Loss of appetite", diseasesId: [], bodyPart: BodyPart.abdomen),        
    Symptom(id: 39, name: "Weight loss", diseasesId: [], bodyPart: BodyPart.abdomen),
    Symptom(id: 40, name: "Acid reflux", diseasesId: [], bodyPart: BodyPart.abdomen),


    //LeftLeg Symptoms
    Symptom(id: 41, name: "Leg pain", diseasesId: [], bodyPart: BodyPart.leftLeg),
    Symptom(id: 42, name: "Numbness in toes", diseasesId: [], bodyPart: BodyPart.leftLeg),
    Symptom(id: 43, name: "Tingling sensation", diseasesId: [], bodyPart: BodyPart.leftLeg),
    Symptom(id: 44, name: "Weak legs", diseasesId: [], bodyPart: BodyPart.leftLeg),
    Symptom(id: 45, name: "Leg swelling", diseasesId: [], bodyPart: BodyPart.leftLeg),
    Symptom(id: 46, name: "Knee pain", diseasesId: [], bodyPart: BodyPart.leftLeg),
    Symptom(id: 47, name: "Muscle cramps", diseasesId: [], bodyPart: BodyPart.leftLeg),
    Symptom(id: 48, name: "Limited leg movement", diseasesId: [], bodyPart: BodyPart.leftLeg),
    Symptom(id: 49, name: "Foot pain", diseasesId: [], bodyPart: BodyPart.leftLeg),
    Symptom(id: 50, name: "Swelling in leg", diseasesId: [], bodyPart: BodyPart.leftLeg),

    //RightLeg Symptoms
    Symptom(id: 51, name: "Leg pain", diseasesId: [], bodyPart: BodyPart.rightLeg),
    Symptom(id: 52, name: "Numbness in toes", diseasesId: [], bodyPart: BodyPart.rightLeg),
    Symptom(id: 53, name: "Tingling sensation", diseasesId: [], bodyPart: BodyPart.rightLeg),
    Symptom(id: 54, name: "Weak legs", diseasesId: [], bodyPart: BodyPart.rightLeg),
    Symptom(id: 55, name: "Leg swelling", diseasesId: [], bodyPart: BodyPart.rightLeg),
    Symptom(id: 56, name: "Knee pain", diseasesId: [], bodyPart: BodyPart.rightLeg),
    Symptom(id: 57, name: "Muscle cramps", diseasesId: [], bodyPart: BodyPart.rightLeg),
    Symptom(id: 58, name: "Limited leg movement", diseasesId: [], bodyPart: BodyPart.rightLeg),
    Symptom(id: 59, name: "Foot pain", diseasesId: [], bodyPart: BodyPart.rightLeg),
    Symptom(id: 60, name: "Swelling in leg", diseasesId: [], bodyPart: BodyPart.rightLeg),

    //Back Symptoms
    Symptom(id: 61, name: "Back pain", diseasesId: [], bodyPart: BodyPart.back),
    Symptom(id: 62, name: "Numbness in back", diseasesId: [], bodyPart: BodyPart.back),
    Symptom(id: 63, name: "Muscle stiffness", diseasesId: [], bodyPart: BodyPart.back),
    Symptom(id: 64, name: "Limited back movement", diseasesId: [], bodyPart: BodyPart.back),
    Symptom(id: 65, name: "Muscle spasms", diseasesId: [], bodyPart: BodyPart.back),
    Symptom(id: 66, name: "Back swelling", diseasesId: [], bodyPart: BodyPart.back),
    Symptom(id: 67, name: "Sharp back pain", diseasesId: [], bodyPart: BodyPart.back),
    Symptom(id: 68, name: "Back stiffness", diseasesId: [], bodyPart: BodyPart.back),
    Symptom(id: 69, name: "Radiating back pain", diseasesId: [], bodyPart: BodyPart.back),
    Symptom(id: 70, name: "Muscle weakness", diseasesId: [], bodyPart: BodyPart.back),
  ];
}