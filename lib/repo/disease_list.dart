import '../models/disease.dart';
import '../models/body_part.dart';

class DiseaseRepository {
  static const List<Disease> _diseases = [
    // HEAD DISEASES (painLevel: 1-10)
    Disease(
      name: "Mild Sinus Pressure",
      bodyPart: BodyPart.head,
      painLevel: 1,
      description: "Minor sinus congestion causing minimal discomfort, usually relieved by over-the-counter decongestants.",
    ),
    Disease(
      name: "Eye Strain",
      bodyPart: BodyPart.head,
      painLevel: 2,
      description: "Caused by prolonged screen time or reading. Rest and proper lighting usually provide relief.",
    ),
    Disease(
      name: "Tension Headache",
      bodyPart: BodyPart.head,
      painLevel: 3,
      description: "The most common type of headache causing mild to moderate pain and a feeling of tightness or pressure around the head.",
    ),
    Disease(
      name: "Sinus Infection",
      bodyPart: BodyPart.head,
      painLevel: 4,
      description: "Inflammation of the sinuses causing significant facial pain and pressure, often requiring antibiotics if bacterial.",
    ),
    Disease(
      name: "Migraine Headache",
      bodyPart: BodyPart.head,
      painLevel: 5,
      description: "Severe headache disorder causing intense throbbing pain, often accompanied by nausea and extreme sensitivity to stimuli.",
    ),
    Disease(
      name: "Severe Migraine",
      bodyPart: BodyPart.head,
      painLevel: 6,
      description: "Intense migraine with visual disturbances and severe nausea. May require prescription medication and complete rest.",
    ),
    Disease(
      name: "Cluster Headache",
      bodyPart: BodyPart.head,
      painLevel: 7,
      description: "Extremely painful headache concentrated around one eye, occurring in clusters. Often described as a burning or piercing sensation.",
    ),
    Disease(
      name: "Temporal Arteritis",
      bodyPart: BodyPart.head,
      painLevel: 8,
      description: "Inflammation of temporal arteries causing severe headache, scalp tenderness, and vision problems. Requires immediate medical attention.",
    ),
    Disease(
      name: "Meningitis",
      bodyPart: BodyPart.head,
      painLevel: 9,
      description: "Severe inflammation of brain and spinal cord membranes. Life-threatening condition with intense headache, fever, and neck stiffness. Seek emergency care immediately.",
    ),
    Disease(
      name: "Brain Hemorrhage",
      bodyPart: BodyPart.head,
      painLevel: 10,
      description: "Critical medical emergency - bleeding in the brain causing sudden, severe headache. Call 911 immediately. May cause loss of consciousness and stroke symptoms.",
    ),

    // LEFT ARM DISEASES (painLevel: 1-10)
    Disease(
      name: "Minor Muscle Soreness",
      bodyPart: BodyPart.leftArm,
      painLevel: 1,
      description: "Mild aching in arm muscles, typically from overuse or new exercise. Rest and gentle stretching provide relief.",
    ),
    Disease(
      name: "Mild Strain",
      bodyPart: BodyPart.leftArm,
      painLevel: 2,
      description: "Slight muscle or tendon strain causing minor discomfort with movement. Usually heals with rest and ice.",
    ),
    Disease(
      name: "Cubital Tunnel Syndrome",
      bodyPart: BodyPart.leftArm,
      painLevel: 3,
      description: "Compression of ulnar nerve at elbow causing tingling in ring and little fingers, with moderate elbow pain.",
    ),
    Disease(
      name: "Tennis Elbow",
      bodyPart: BodyPart.leftArm,
      painLevel: 4,
      description: "Inflammation of tendons in elbow causing pain on outer side. Common in repetitive arm movements.",
    ),
    Disease(
      name: "Rotator Cuff Tendinitis",
      bodyPart: BodyPart.leftArm,
      painLevel: 5,
      description: "Inflammation of shoulder tendons causing significant pain with arm elevation. May require physical therapy.",
    ),
    Disease(
      name: "Bicep Tendon Tear",
      bodyPart: BodyPart.leftArm,
      painLevel: 6,
      description: "Partial tear of bicep tendon causing sharp pain, visible bruising, and weakness in arm. May show 'Popeye' bulge.",
    ),
    Disease(
      name: "Shoulder Dislocation",
      bodyPart: BodyPart.leftArm,
      painLevel: 7,
      description: "Shoulder joint forced out of socket causing severe pain and visible deformity. Requires immediate medical reduction.",
    ),
    Disease(
      name: "Compound Fracture",
      bodyPart: BodyPart.leftArm,
      painLevel: 8,
      description: "Severe fracture where bone pierces through skin. Extremely painful and requires emergency surgical intervention.",
    ),
    Disease(
      name: "Acute Compartment Syndrome",
      bodyPart: BodyPart.leftArm,
      painLevel: 9,
      description: "Critical condition with dangerous pressure buildup in arm muscles. Causes severe pain, numbness, and potential tissue death. Emergency surgery needed.",
    ),
    Disease(
      name: "Severe Crush Injury",
      bodyPart: BodyPart.leftArm,
      painLevel: 10,
      description: "Traumatic crushing of arm tissues causing excruciating pain, massive swelling, and potential limb loss. Call 911 immediately.",
    ),

    // RIGHT ARM DISEASES (painLevel: 1-10)
    Disease(
      name: "Minor Muscle Soreness",
      bodyPart: BodyPart.rightArm,
      painLevel: 1,
      description: "Mild aching in arm muscles, typically from overuse or new exercise. Rest and gentle stretching provide relief.",
    ),
    Disease(
      name: "Mild Strain",
      bodyPart: BodyPart.rightArm,
      painLevel: 2,
      description: "Slight muscle or tendon strain causing minor discomfort with movement. Usually heals with rest and ice.",
    ),
    Disease(
      name: "Cubital Tunnel Syndrome",
      bodyPart: BodyPart.rightArm,
      painLevel: 3,
      description: "Compression of ulnar nerve at elbow causing tingling in ring and little fingers, with moderate elbow pain.",
    ),
    Disease(
      name: "Tennis Elbow",
      bodyPart: BodyPart.rightArm,
      painLevel: 4,
      description: "Inflammation of tendons in elbow causing pain on outer side. Common in repetitive arm movements.",
    ),
    Disease(
      name: "Rotator Cuff Tendinitis",
      bodyPart: BodyPart.rightArm,
      painLevel: 5,
      description: "Inflammation of shoulder tendons causing significant pain with arm elevation. May require physical therapy.",
    ),
    Disease(
      name: "Bicep Tendon Tear",
      bodyPart: BodyPart.rightArm,
      painLevel: 6,
      description: "Partial tear of bicep tendon causing sharp pain, visible bruising, and weakness in arm. May show 'Popeye' bulge.",
    ),
    Disease(
      name: "Shoulder Dislocation",
      bodyPart: BodyPart.rightArm,
      painLevel: 7,
      description: "Shoulder joint forced out of socket causing severe pain and visible deformity. Requires immediate medical reduction.",
    ),
    Disease(
      name: "Compound Fracture",
      bodyPart: BodyPart.rightArm,
      painLevel: 8,
      description: "Severe fracture where bone pierces through skin. Extremely painful and requires emergency surgical intervention.",
    ),
    Disease(
      name: "Acute Compartment Syndrome",
      bodyPart: BodyPart.rightArm,
      painLevel: 9,
      description: "Critical condition with dangerous pressure buildup in arm muscles. Causes severe pain, numbness, and potential tissue death. Emergency surgery needed.",
    ),
    Disease(
      name: "Severe Crush Injury",
      bodyPart: BodyPart.rightArm,
      painLevel: 10,
      description: "Traumatic crushing of arm tissues causing excruciating pain, massive swelling, and potential limb loss. Call 911 immediately.",
    ),

    // ABDOMEN DISEASES (painLevel: 1-10)
    Disease(
      name: "Mild Indigestion",
      bodyPart: BodyPart.abdomen,
      painLevel: 1,
      description: "Minor stomach discomfort from overeating or rich foods. Usually relieved with antacids and time.",
    ),
    Disease(
      name: "Gas Pain",
      bodyPart: BodyPart.abdomen,
      painLevel: 2,
      description: "Bloating and cramping from trapped intestinal gas. Walking and over-the-counter remedies typically help.",
    ),
    Disease(
      name: "Gastritis",
      bodyPart: BodyPart.abdomen,
      painLevel: 3,
      description: "Inflammation of stomach lining causing burning pain in upper abdomen. May require dietary changes and medication.",
    ),
    Disease(
      name: "Gallstones",
      bodyPart: BodyPart.abdomen,
      painLevel: 4,
      description: "Hardened deposits in gallbladder causing pain in upper right abdomen, especially after fatty meals.",
    ),
    Disease(
      name: "Kidney Stones",
      bodyPart: BodyPart.abdomen,
      painLevel: 5,
      description: "Hard mineral deposits causing severe cramping pain in abdomen and back. May require medical intervention to pass.",
    ),
    Disease(
      name: "Diverticulitis",
      bodyPart: BodyPart.abdomen,
      painLevel: 6,
      description: "Inflammation of intestinal pouches causing significant lower left abdominal pain, fever, and changes in bowel habits.",
    ),
    Disease(
      name: "Acute Pancreatitis",
      bodyPart: BodyPart.abdomen,
      painLevel: 7,
      description: "Severe inflammation of pancreas causing intense upper abdominal pain radiating to back. Requires hospitalization.",
    ),
    Disease(
      name: "Intestinal Obstruction",
      bodyPart: BodyPart.abdomen,
      painLevel: 8,
      description: "Blockage preventing normal passage of food and fluids. Causes severe cramping, vomiting, and abdominal distension. Emergency surgery may be needed.",
    ),
    Disease(
      name: "Ruptured Appendicitis",
      bodyPart: BodyPart.abdomen,
      painLevel: 9,
      description: "Life-threatening rupture of inflamed appendix spreading infection throughout abdomen. Causes excruciating pain, high fever. Emergency surgery required immediately.",
    ),
    Disease(
      name: "Perforated Ulcer",
      bodyPart: BodyPart.abdomen,
      painLevel: 10,
      description: "Critical emergency - hole in stomach or intestinal wall causing sudden, severe abdominal pain. Risk of sepsis and death. Call 911 immediately.",
    ),

    // LEFT LEG DISEASES (painLevel: 1-10)
    Disease(
      name: "Mild Muscle Fatigue",
      bodyPart: BodyPart.leftLeg,
      painLevel: 1,
      description: "Light tiredness in leg muscles from walking or standing. Rest and elevation provide quick relief.",
    ),
    Disease(
      name: "Shin Splints",
      bodyPart: BodyPart.leftLeg,
      painLevel: 2,
      description: "Pain along shin bone from repetitive stress, common in runners. Rest, ice, and proper footwear help.",
    ),
    Disease(
      name: "Muscle Strain",
      bodyPart: BodyPart.leftLeg,
      painLevel: 3,
      description: "Pulled muscle in thigh or calf causing moderate pain with movement. Requires rest, ice, and gentle stretching.",
    ),
    Disease(
      name: "Knee Meniscus Tear",
      bodyPart: BodyPart.leftLeg,
      painLevel: 4,
      description: "Tear in knee cartilage causing pain, swelling, and difficulty straightening leg. May require physical therapy or surgery.",
    ),
    Disease(
      name: "Deep Vein Thrombosis",
      bodyPart: BodyPart.leftLeg,
      painLevel: 5,
      description: "Blood clot in deep leg vein causing calf pain, swelling, and warmth. Requires immediate anticoagulation treatment to prevent pulmonary embolism.",
    ),
    Disease(
      name: "ACL Tear",
      bodyPart: BodyPart.leftLeg,
      painLevel: 6,
      description: "Rupture of knee ligament causing sharp pain, immediate swelling, and instability. Often requires surgical reconstruction.",
    ),
    Disease(
      name: "Femur Fracture",
      bodyPart: BodyPart.leftLeg,
      painLevel: 7,
      description: "Break in thigh bone causing severe pain and inability to bear weight. Requires surgical repair with rods or plates.",
    ),
    Disease(
      name: "Compound Leg Fracture",
      bodyPart: BodyPart.leftLeg,
      painLevel: 8,
      description: "Severe fracture with bone protruding through skin. High infection risk and requires emergency surgical intervention.",
    ),
    Disease(
      name: "Compartment Syndrome",
      bodyPart: BodyPart.leftLeg,
      painLevel: 9,
      description: "Critical pressure buildup in leg compartments cutting off blood flow. Causes excruciating pain and can lead to tissue death. Emergency fasciotomy needed.",
    ),
    Disease(
      name: "Traumatic Amputation",
      bodyPart: BodyPart.leftLeg,
      painLevel: 10,
      description: "Catastrophic injury resulting in partial or complete leg loss. Extreme pain with massive blood loss and shock. Call 911 and apply tourniquet immediately.",
    ),

    // RIGHT LEG DISEASES (painLevel: 1-10)
    Disease(
      name: "Mild Muscle Fatigue",
      bodyPart: BodyPart.rightLeg,
      painLevel: 1,
      description: "Light tiredness in leg muscles from walking or standing. Rest and elevation provide quick relief.",
    ),
    Disease(
      name: "Shin Splints",
      bodyPart: BodyPart.rightLeg,
      painLevel: 2,
      description: "Pain along shin bone from repetitive stress, common in runners. Rest, ice, and proper footwear help.",
    ),
    Disease(
      name: "Muscle Strain",
      bodyPart: BodyPart.rightLeg,
      painLevel: 3,
      description: "Pulled muscle in thigh or calf causing moderate pain with movement. Requires rest, ice, and gentle stretching.",
    ),
    Disease(
      name: "Knee Meniscus Tear",
      bodyPart: BodyPart.rightLeg,
      painLevel: 4,
      description: "Tear in knee cartilage causing pain, swelling, and difficulty straightening leg. May require physical therapy or surgery.",
    ),
    Disease(
      name: "Deep Vein Thrombosis",
      bodyPart: BodyPart.rightLeg,
      painLevel: 5,
      description: "Blood clot in deep leg vein causing calf pain, swelling, and warmth. Requires immediate anticoagulation treatment to prevent pulmonary embolism.",
    ),
    Disease(
      name: "ACL Tear",
      bodyPart: BodyPart.rightLeg,
      painLevel: 6,
      description: "Rupture of knee ligament causing sharp pain, immediate swelling, and instability. Often requires surgical reconstruction.",
    ),
    Disease(
      name: "Femur Fracture",
      bodyPart: BodyPart.rightLeg,
      painLevel: 7,
      description: "Break in thigh bone causing severe pain and inability to bear weight. Requires surgical repair with rods or plates.",
    ),
    Disease(
      name: "Compound Leg Fracture",
      bodyPart: BodyPart.rightLeg,
      painLevel: 8,
      description: "Severe fracture with bone protruding through skin. High infection risk and requires emergency surgical intervention.",
    ),
    Disease(
      name: "Compartment Syndrome",
      bodyPart: BodyPart.rightLeg,
      painLevel: 9,
      description: "Critical pressure buildup in leg compartments cutting off blood flow. Causes excruciating pain and can lead to tissue death. Emergency fasciotomy needed.",
    ),
    Disease(
      name: "Traumatic Amputation",
      bodyPart: BodyPart.rightLeg,
      painLevel: 10,
      description: "Catastrophic injury resulting in partial or complete leg loss. Extreme pain with massive blood loss and shock. Call 911 and apply tourniquet immediately.",
    ),

    // BACK DISEASES (painLevel: 1-10)
    Disease(
      name: "Muscle Stiffness",
      bodyPart: BodyPart.back,
      painLevel: 1,
      description: "Mild back stiffness from poor posture or prolonged sitting. Stretching and movement typically resolve discomfort.",
    ),
    Disease(
      name: "Muscle Strain",
      bodyPart: BodyPart.back,
      painLevel: 2,
      description: "Pulled back muscle from lifting or twisting. Rest, ice, and over-the-counter pain relievers help recovery.",
    ),
    Disease(
      name: "Lumbar Sprain",
      bodyPart: BodyPart.back,
      painLevel: 3,
      description: "Stretched or torn ligaments in lower back causing moderate pain with movement. Usually heals with rest and physical therapy.",
    ),
    Disease(
      name: "Herniated Disc",
      bodyPart: BodyPart.back,
      painLevel: 4,
      description: "Bulging spinal disc pressing on nerves causing back pain and possible leg numbness. May require physical therapy or injections.",
    ),
    Disease(
      name: "Sciatica",
      bodyPart: BodyPart.back,
      painLevel: 5,
      description: "Compression of sciatic nerve causing sharp pain radiating from lower back through buttocks down leg. Can be debilitating.",
    ),
    Disease(
      name: "Severe Disc Herniation",
      bodyPart: BodyPart.back,
      painLevel: 6,
      description: "Major disc rupture with significant nerve compression. Causes intense pain, weakness, and possible loss of bladder control. May need surgery.",
    ),
    Disease(
      name: "Spinal Stenosis",
      bodyPart: BodyPart.back,
      painLevel: 7,
      description: "Narrowing of spinal canal compressing nerves. Causes severe back pain, leg weakness, and difficulty walking. Often requires surgical decompression.",
    ),
    Disease(
      name: "Compression Fracture",
      bodyPart: BodyPart.back,
      painLevel: 8,
      description: "Vertebra collapse causing sudden, severe back pain. Common in osteoporosis. May require vertebroplasty or kyphoplasty.",
    ),
    Disease(
      name: "Cauda Equina Syndrome",
      bodyPart: BodyPart.back,
      painLevel: 9,
      description: "Critical emergency with severe nerve compression at spine base. Causes excruciating back pain, leg paralysis, and loss of bowel/bladder control. Emergency surgery required within 48 hours to prevent permanent damage.",
    ),
    Disease(
      name: "Spinal Cord Injury",
      bodyPart: BodyPart.back,
      painLevel: 10,
      description: "Catastrophic trauma to spinal cord causing unbearable pain and potential paralysis. Life-threatening emergency requiring immediate immobilization and transport. Call 911 immediately.",
    ),
  ];

  static Disease? findByBodyPartAndPainLevel(BodyPart bodyPart, int painLevel) {
    try {
      return _diseases.firstWhere(
        (disease) => disease.bodyPart == bodyPart && disease.painLevel == painLevel,
      );
    } catch (e) {
      return null;
    }
  }

  static Disease? findByName(String name) {
    try {
      return _diseases.firstWhere(
        (disease) => disease.name.toLowerCase() == name.toLowerCase(),
      );
    } catch (e) {
      return null;
    }
  }

  static List<Disease> getAllDiseases() => List.unmodifiable(_diseases);

  static List<Disease> findByBodyPart(BodyPart bodyPart) {
    return _diseases.where((disease) => disease.bodyPart == bodyPart).toList();
  }
}
