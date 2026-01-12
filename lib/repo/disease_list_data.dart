import '../models/disease.dart';
import '../models/body_part.dart';

class DiseaseRepository {
  static final List<Disease> _diseases = [
    // HEAD DISEASES
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
      description: "The most common type of headache causing mild to moderate pain and a feeling of tightness or pressure around the head. Often caused by stress, anxiety, poor posture, or muscle tension.",
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
      description: "Severe headache disorder causing intense throbbing pain, often accompanied by nausea and extreme sensitivity to stimuli. Can last hours to days and significantly impacts daily activities.",
    ),
    Disease(
      name: "Severe Migraine with Aura",
      bodyPart: BodyPart.head,
      painLevel: 6,
      description: "Advanced migraine with neurological symptoms preceding the headache. Requires prescription medication and often needs darkened, quiet environment.",
    ),
    Disease(
      name: "Cluster Headache",
      bodyPart: BodyPart.head,
      painLevel: 7,
      description: "Extremely painful headache occurring in clusters or cycles. Pain is focused around one eye and is often described as the worst pain imaginable.",
    ),
    Disease(
      name: "Acute Temporal Arteritis",
      bodyPart: BodyPart.head,
      painLevel: 8,
      description: "Inflammation of temporal arteries causing severe headache. Medical emergency requiring immediate treatment to prevent vision loss.",
    ),
    Disease(
      name: "Severe Meningitis",
      bodyPart: BodyPart.head,
      painLevel: 9,
      description: "Life-threatening inflammation of brain and spinal cord membranes. Requires immediate emergency medical attention and hospitalization.",
    ),
    Disease(
      name: "Brain Hemorrhage",
      bodyPart: BodyPart.head,
      painLevel: 10,
      description: "Medical emergency involving bleeding in the brain. The worst headache of one's life requiring immediate emergency intervention. Can be fatal without rapid treatment.",
    ),

    // LEFT ARM DISEASES
    Disease(
      name: "Minor Muscle Soreness",
      bodyPart: BodyPart.leftArm,
      painLevel: 1,
      description: "Normal delayed-onset muscle soreness (DOMS) from physical activity. Usually resolves with rest in 24-48 hours.",
    ),
    Disease(
      name: "Mild Tendonitis",
      bodyPart: BodyPart.leftArm,
      painLevel: 2,
      description: "Early-stage inflammation of tendons causing mild discomfort. Rest, ice, and anti-inflammatory medication usually sufficient.",
    ),
    Disease(
      name: "Cubital Tunnel Syndrome (mild)",
      bodyPart: BodyPart.leftArm,
      painLevel: 3,
      description: "Compression of ulnar nerve at elbow causing nerve symptoms. Often responds to activity modification and splinting.",
    ),
    Disease(
      name: "Moderate Bursitis",
      bodyPart: BodyPart.leftArm,
      painLevel: 4,
      description: "Inflammation of bursa sacs causing moderate pain and reduced mobility. May require corticosteroid injection.",
    ),
    Disease(
      name: "Rotator Cuff Strain",
      bodyPart: BodyPart.leftArm,
      painLevel: 5,
      description: "Partial tear or strain of rotator cuff muscles causing substantial pain and functional limitation. Physical therapy often required.",
    ),
    Disease(
      name: "Severe Bicep Tendon Tear",
      bodyPart: BodyPart.leftArm,
      painLevel: 6,
      description: "Rupture of bicep tendon causing marked pain and deformity. Often requires surgical evaluation and repair.",
    ),
    Disease(
      name: "Acute Compartment Syndrome",
      bodyPart: BodyPart.leftArm,
      painLevel: 7,
      description: "Medical emergency where increased pressure in muscle compartment reduces blood flow. Requires emergency surgical decompression.",
    ),
    Disease(
      name: "Severe Compound Fracture",
      bodyPart: BodyPart.leftArm,
      painLevel: 8,
      description: "Open fracture with bone breaking through skin. Surgical emergency requiring immediate medical attention to prevent infection and restore function.",
    ),
    Disease(
      name: "Acute Arterial Occlusion",
      bodyPart: BodyPart.leftArm,
      painLevel: 9,
      description: "Complete blockage of arm artery causing tissue death. Vascular emergency requiring immediate surgery to restore blood flow.",
    ),
    Disease(
      name: "Severe Crush Injury",
      bodyPart: BodyPart.leftArm,
      painLevel: 10,
      description: "Catastrophic trauma with extensive soft tissue, nerve, and vascular damage. Life-threatening injury requiring immediate emergency intervention.",
    ),

    // RIGHT ARM DISEASES
    Disease(
      name: "Mild Overuse Soreness",
      bodyPart: BodyPart.rightArm,
      painLevel: 1,
      description: "Common soreness from repetitive motions like typing or sports. Resolves with rest and gentle stretching.",
    ),
    Disease(
      name: "Early Carpal Tunnel Syndrome",
      bodyPart: BodyPart.rightArm,
      painLevel: 2,
      description: "Nerve compression in wrist causing intermittent symptoms. Often managed with wrist splints and ergonomic adjustments.",
    ),
    Disease(
      name: "Tennis Elbow",
      bodyPart: BodyPart.rightArm,
      painLevel: 3,
      description: "Lateral epicondylitis causing elbow pain from overuse. Responds to rest, ice, and physical therapy.",
    ),
    Disease(
      name: "Moderate Wrist Sprain",
      bodyPart: BodyPart.rightArm,
      painLevel: 4,
      description: "Torn or stretched wrist ligaments causing significant discomfort. May require immobilization with brace or cast.",
    ),
    Disease(
      name: "Frozen Shoulder",
      bodyPart: BodyPart.rightArm,
      painLevel: 5,
      description: "Adhesive capsulitis causing significant shoulder restriction and pain. Requires prolonged physical therapy and sometimes surgical intervention.",
    ),
    Disease(
      name: "Complete Rotator Cuff Tear",
      bodyPart: BodyPart.rightArm,
      painLevel: 6,
      description: "Full-thickness tear of rotator cuff requiring surgical repair. Causes severe functional impairment and constant pain.",
    ),
    Disease(
      name: "Severe Ulnar Nerve Injury",
      bodyPart: BodyPart.rightArm,
      painLevel: 7,
      description: "Significant nerve damage causing intense neuropathic pain and functional loss. Often requires nerve surgery and extensive rehabilitation.",
    ),
    Disease(
      name: "Humeral Shaft Fracture",
      bodyPart: BodyPart.rightArm,
      painLevel: 8,
      description: "Complete break of upper arm bone causing severe pain and requiring surgical fixation with plates or rods.",
    ),
    Disease(
      name: "Severe Electrical Burn",
      bodyPart: BodyPart.rightArm,
      painLevel: 9,
      description: "High-voltage electrical injury causing extensive internal damage beyond visible burns. Life-threatening condition requiring intensive care.",
    ),
    Disease(
      name: "Traumatic Amputation",
      bodyPart: BodyPart.rightArm,
      painLevel: 10,
      description: "Catastrophic injury with complete limb loss. Requires immediate tourniquet application and emergency surgical intervention to prevent death.",
    ),

    // ABDOMEN DISEASES
    Disease(
      name: "Mild Indigestion",
      bodyPart: BodyPart.abdomen,
      painLevel: 1,
      description: "Minor digestive upset from food or drink. Usually resolves on its own or with antacids.",
    ),
    Disease(
      name: "Constipation",
      bodyPart: BodyPart.abdomen,
      painLevel: 2,
      description: "Reduced bowel movements causing mild to moderate discomfort. Responds to increased fiber, fluids, and stool softeners.",
    ),
    Disease(
      name: "Gastritis",
      bodyPart: BodyPart.abdomen,
      painLevel: 3,
      description: "Inflammation of stomach lining causing moderate pain. Managed with acid reducers, dietary changes, and avoiding irritants.",
    ),
    Disease(
      name: "Irritable Bowel Syndrome (IBS)",
      bodyPart: BodyPart.abdomen,
      painLevel: 4,
      description: "Chronic condition causing significant abdominal discomfort and bowel changes. Requires dietary management and medication.",
    ),
    Disease(
      name: "Gastroenteritis",
      bodyPart: BodyPart.abdomen,
      painLevel: 5,
      description: "Viral or bacterial infection causing intense stomach flu symptoms. May require IV fluids if dehydration severe.",
    ),
    Disease(
      name: "Kidney Stones",
      bodyPart: BodyPart.abdomen,
      painLevel: 6,
      description: "Hard mineral deposits causing severe colicky pain as they pass through urinary tract. Often requires pain medication and sometimes surgical removal.",
    ),
    Disease(
      name: "Acute Pancreatitis",
      bodyPart: BodyPart.abdomen,
      painLevel: 7,
      description: "Inflammation of pancreas causing severe persistent pain. Requires hospitalization, IV fluids, and pain management.",
    ),
    Disease(
      name: "Acute Appendicitis",
      bodyPart: BodyPart.abdomen,
      painLevel: 8,
      description: "Inflamed appendix requiring emergency surgical removal. Delayed treatment risks rupture and life-threatening peritonitis.",
    ),
    Disease(
      name: "Perforated Ulcer",
      bodyPart: BodyPart.abdomen,
      painLevel: 9,
      description: "Hole in stomach or intestine wall spilling contents into abdomen. Surgical emergency causing severe peritonitis and sepsis if untreated.",
    ),
    Disease(
      name: "Ruptured Abdominal Aortic Aneurysm",
      bodyPart: BodyPart.abdomen,
      painLevel: 10,
      description: "Bursting of main abdominal artery causing massive internal bleeding. Most lethal surgical emergency requiring immediate operation. High mortality rate even with treatment.",
    ),

    // LEFT LEG DISEASES
    Disease(
      name: "Minor Calf Cramp",
      bodyPart: BodyPart.leftLeg,
      painLevel: 1,
      description: "Common muscle cramp from dehydration or overuse. Relieved by stretching and hydration.",
    ),
    Disease(
      name: "Shin Splints",
      bodyPart: BodyPart.leftLeg,
      painLevel: 2,
      description: "Overuse injury common in runners. Responds to rest, ice, proper footwear, and gradual return to activity.",
    ),
    Disease(
      name: "Mild Ankle Sprain",
      bodyPart: BodyPart.leftLeg,
      painLevel: 3,
      description: "Stretched or partially torn ankle ligaments. Requires rest, ice, compression, elevation (RICE) and possibly bracing.",
    ),
    Disease(
      name: "Knee Osteoarthritis",
      bodyPart: BodyPart.leftLeg,
      painLevel: 4,
      description: "Wear and tear of knee cartilage causing chronic pain and reduced mobility. Managed with medications, physical therapy, and weight management.",
    ),
    Disease(
      name: "Meniscus Tear",
      bodyPart: BodyPart.leftLeg,
      painLevel: 5,
      description: "Torn knee cartilage causing significant pain and mechanical symptoms. Often requires arthroscopic surgery for repair or removal.",
    ),
    Disease(
      name: "ACL Tear",
      bodyPart: BodyPart.leftLeg,
      painLevel: 6,
      description: "Complete tear of anterior cruciate ligament causing severe pain and knee instability. Usually requires surgical reconstruction and months of rehabilitation.",
    ),
    Disease(
      name: "Severe Achilles Tendon Rupture",
      bodyPart: BodyPart.leftLeg,
      painLevel: 7,
      description: "Complete tear of Achilles tendon causing severe pain and loss of function. Requires surgical repair or prolonged immobilization.",
    ),
    Disease(
      name: "Tibial Plateau Fracture",
      bodyPart: BodyPart.leftLeg,
      painLevel: 8,
      description: "Break in upper shinbone affecting knee joint. Serious injury requiring surgical repair with plates and screws.",
    ),
    Disease(
      name: "Acute Compartment Syndrome (Leg)",
      bodyPart: BodyPart.leftLeg,
      painLevel: 9,
      description: "Surgical emergency where increased pressure cuts off blood flow to leg muscles. Requires emergency fasciotomy to prevent permanent damage.",
    ),
    Disease(
      name: "Femoral Artery Laceration",
      bodyPart: BodyPart.leftLeg,
      painLevel: 10,
      description: "Severed major leg artery causing life-threatening hemorrhage. Requires immediate tourniquet and emergency vascular surgery. Can be fatal within minutes without intervention.",
    ),

    // RIGHT LEG DISEASES
    Disease(
      name: "Mild Foot Fatigue",
      bodyPart: BodyPart.rightLeg,
      painLevel: 1,
      description: "Normal foot fatigue from prolonged standing or walking. Relieved by rest and foot elevation.",
    ),
    Disease(
      name: "Plantar Fasciitis (early)",
      bodyPart: BodyPart.rightLeg,
      painLevel: 2,
      description: "Inflammation of plantar fascia causing heel pain. Managed with stretching, proper footwear, and orthotics.",
    ),
    Disease(
      name: "Moderate Ankle Sprain",
      bodyPart: BodyPart.rightLeg,
      painLevel: 3,
      description: "Partially torn ankle ligaments causing moderate functional impairment. Requires immobilization and physical therapy.",
    ),
    Disease(
      name: "Stress Fracture",
      bodyPart: BodyPart.rightLeg,
      painLevel: 4,
      description: "Small crack in bone from repetitive stress. Requires rest, protective boot, and gradual return to activity over 6-8 weeks.",
    ),
    Disease(
      name: "Deep Vein Thrombosis (DVT)",
      bodyPart: BodyPart.rightLeg,
      painLevel: 5,
      description: "Blood clot in deep leg vein causing significant pain and swelling. Requires immediate anticoagulation to prevent pulmonary embolism.",
    ),
    Disease(
      name: "Severe Patellar Dislocation",
      bodyPart: BodyPart.rightLeg,
      painLevel: 6,
      description: "Kneecap moves out of position causing severe pain. Requires reduction (repositioning) and often surgical stabilization.",
    ),
    Disease(
      name: "Tibial Fracture",
      bodyPart: BodyPart.rightLeg,
      painLevel: 7,
      description: "Complete break of shin bone causing severe pain and requiring surgical fixation with rods or plates.",
    ),
    Disease(
      name: "Hip Fracture",
      bodyPart: BodyPart.rightLeg,
      painLevel: 8,
      description: "Break in upper thighbone requiring emergency surgery. Common in elderly and requires immediate surgical pinning or replacement.",
    ),
    Disease(
      name: "Multiple Trauma with Pelvic Fracture",
      bodyPart: BodyPart.rightLeg,
      painLevel: 9,
      description: "Severe pelvic break causing massive internal bleeding. Life-threatening injury requiring emergency stabilization and surgery.",
    ),
    Disease(
      name: "Traumatic Lower Limb Amputation",
      bodyPart: BodyPart.rightLeg,
      painLevel: 10,
      description: "Catastrophic traumatic injury with complete leg separation. Requires immediate tourniquet, emergency transport, and surgical intervention. High risk of death from blood loss.",
    ),

    // BACK DISEASES
    Disease(
      name: "Mild Muscle Stiffness",
      bodyPart: BodyPart.back,
      painLevel: 1,
      description: "Common stiffness from poor posture or prolonged sitting. Improves with stretching and movement.",
    ),
    Disease(
      name: "Muscle Strain",
      bodyPart: BodyPart.back,
      painLevel: 2,
      description: "Overstretched or torn muscle fibers causing mild to moderate pain. Responds to rest, ice, and over-the-counter pain relievers.",
    ),
    Disease(
      name: "Mechanical Back Pain",
      bodyPart: BodyPart.back,
      painLevel: 3,
      description: "Non-specific back pain from muscle or ligament strain. Managed with physical therapy, proper body mechanics, and core strengthening.",
    ),
    Disease(
      name: "Herniated Disc (mild)",
      bodyPart: BodyPart.back,
      painLevel: 4,
      description: "Bulging spinal disc pressing on nerve causing moderate pain and nerve symptoms. Often responds to conservative treatment.",
    ),
    Disease(
      name: "Sciatica",
      bodyPart: BodyPart.back,
      painLevel: 5,
      description: "Severe nerve irritation causing intense radiating pain. May require epidural injections or surgery if conservative treatment fails.",
    ),
    Disease(
      name: "Severe Herniated Disc",
      bodyPart: BodyPart.back,
      painLevel: 6,
      description: "Large disc herniation with severe nerve compression. Often requires surgical discectomy to relieve pressure.",
    ),
    Disease(
      name: "Spinal Stenosis (severe)",
      bodyPart: BodyPart.back,
      painLevel: 7,
      description: "Narrowing of spinal canal causing significant nerve compression. May require decompressive surgery if symptoms are severe.",
    ),
    Disease(
      name: "Compression Fracture",
      bodyPart: BodyPart.back,
      painLevel: 8,
      description: "Vertebral collapse from osteoporosis or trauma. Causes severe pain and may require vertebroplasty or kyphoplasty.",
    ),
    Disease(
      name: "Cauda Equina Syndrome",
      bodyPart: BodyPart.back,
      painLevel: 9,
      description: "Surgical emergency with compression of nerve roots at base of spine. Requires immediate surgery within 48 hours to prevent permanent paralysis and incontinence.",
    ),
    Disease(
      name: "Spinal Cord Transection",
      bodyPart: BodyPart.back,
      painLevel: 10,
      description: "Complete severing of spinal cord causing permanent paralysis and loss of all function below injury level. Devastating injury requiring immediate emergency spinal stabilization.",
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

  static List<Disease> getAllDiseases() {
    return List.unmodifiable(_diseases);
  }
}
