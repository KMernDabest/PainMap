

class Disease {
  final int id;
  final int painLevel;
  final String name;
  final int bodyPartId;
  final String? description;
  final String? symptomDetails;

  Disease({
    required this.id,
    required this.painLevel,
    required this.name,
    required this.bodyPartId,
    this.description,
    this.symptomDetails,
  });

  String fromId(int bodyPartId) {
    switch (bodyPartId) {
      case 1:
        return 'Head';
      case 2:
        return 'Left Arm';
      case 3:
        return 'Right Arm';
      case 4:
        return 'Abdomen';
      case 5:
        return 'Left Leg';
      case 6:
        return 'Right Leg';
      case 7:
        return 'Back';
      default:
        return 'Unknown';
    }
  }

  static final List<Disease> diseaseList = [
    // HEAD DISEASES (bodyPartId: 1)
    Disease(
      id: 1,
      painLevel: 1,
      name: "Mild Sinus Pressure",
      bodyPartId: 1,
      symptomDetails: "Slight pressure around eyes and forehead, minor facial tenderness",
      description: "Minor sinus congestion causing minimal discomfort, usually relieved by over-the-counter decongestants.",
    ),
    Disease(
      id: 2,
      painLevel: 2,
      name: "Eye Strain",
      bodyPartId: 1,
      symptomDetails: "Tired eyes, slight headache behind eyes, difficulty focusing",
      description: "Caused by prolonged screen time or reading. Rest and proper lighting usually provide relief.",
    ),
    Disease(
      id: 3,
      painLevel: 3,
      name: "Tension Headache",
      bodyPartId: 1,
      symptomDetails: "Dull, aching head pain, sensation of tightness or pressure across the forehead or on the sides and back of the head, tenderness on the scalp, neck and shoulder muscles",
      description: "The most common type of headache causing mild to moderate pain and a feeling of tightness or pressure around the head. Often caused by stress, anxiety, poor posture, or muscle tension.",
    ),
    Disease(
      id: 4,
      painLevel: 4,
      name: "Sinus Infection",
      bodyPartId: 1,
      symptomDetails: "Facial pain and pressure, thick nasal discharge, reduced sense of smell, cough, fever",
      description: "Inflammation of the sinuses causing significant facial pain and pressure, often requiring antibiotics if bacterial.",
    ),
    Disease(
      id: 5,
      painLevel: 5,
      name: "Migraine Headache",
      bodyPartId: 1,
      symptomDetails: "Throbbing, pulsating pain usually on one side, nausea and vomiting, sensitivity to sound or light, visual disturbances (aura), numbness or tingling",
      description: "Severe headache disorder causing intense throbbing pain, often accompanied by nausea and extreme sensitivity to stimuli. Can last hours to days and significantly impacts daily activities.",
    ),
    Disease(
      id: 6,
      painLevel: 6,
      name: "Severe Migraine with Aura",
      bodyPartId: 1,
      symptomDetails: "Intense throbbing pain, visual disturbances, temporary vision loss, severe nausea, vomiting, extreme light and sound sensitivity",
      description: "Advanced migraine with neurological symptoms preceding the headache. Requires prescription medication and often needs darkened, quiet environment.",
    ),
    Disease(
      id: 7,
      painLevel: 7,
      name: "Cluster Headache",
      bodyPartId: 1,
      symptomDetails: "Severe burning or piercing pain around one eye, eye redness and tearing, nasal congestion, restlessness, agitation",
      description: "Extremely painful headache occurring in clusters or cycles. Pain is focused around one eye and is often described as the worst pain imaginable.",
    ),
    Disease(
      id: 8,
      painLevel: 8,
      name: "Acute Temporal Arteritis",
      bodyPartId: 1,
      symptomDetails: "Severe throbbing temple pain, scalp tenderness, jaw pain when chewing, vision problems, fever, fatigue",
      description: "Inflammation of temporal arteries causing severe headache. Medical emergency requiring immediate treatment to prevent vision loss.",
    ),
    Disease(
      id: 9,
      painLevel: 9,
      name: "Severe Meningitis",
      bodyPartId: 1,
      symptomDetails: "Extreme headache, severe neck stiffness, high fever, confusion, sensitivity to light, vomiting, altered mental state",
      description: "Life-threatening inflammation of brain and spinal cord membranes. Requires immediate emergency medical attention and hospitalization.",
    ),
    Disease(
      id: 10,
      painLevel: 10,
      name: "Brain Hemorrhage",
      bodyPartId: 1,
      symptomDetails: "Sudden, severe thunderclap headache, loss of consciousness, seizures, severe confusion, weakness or numbness, difficulty speaking",
      description: "Medical emergency involving bleeding in the brain. The worst headache of one's life requiring immediate emergency intervention. Can be fatal without rapid treatment.",
    ),

    // LEFT ARM DISEASES (bodyPartId: 2)
    Disease(
      id: 11,
      painLevel: 1,
      name: "Minor Muscle Soreness",
      bodyPartId: 2,
      symptomDetails: "Mild aching in arm muscles, slight stiffness after exercise",
      description: "Normal delayed-onset muscle soreness (DOMS) from physical activity. Usually resolves with rest in 24-48 hours.",
    ),
    Disease(
      id: 12,
      painLevel: 2,
      name: "Mild Tendonitis",
      bodyPartId: 2,
      symptomDetails: "Slight pain when moving arm, minor swelling, tenderness to touch",
      description: "Early-stage inflammation of tendons causing mild discomfort. Rest, ice, and anti-inflammatory medication usually sufficient.",
    ),
    Disease(
      id: 13,
      painLevel: 3,
      name: "Cubital Tunnel Syndrome (mild)",
      bodyPartId: 2,
      symptomDetails: "Tingling in ring and little fingers, occasional numbness, mild elbow discomfort",
      description: "Compression of ulnar nerve at elbow causing nerve symptoms. Often responds to activity modification and splinting.",
    ),
    Disease(
      id: 14,
      painLevel: 4,
      name: "Moderate Bursitis",
      bodyPartId: 2,
      symptomDetails: "Noticeable shoulder or elbow pain, swelling, warmth, limited range of motion",
      description: "Inflammation of bursa sacs causing moderate pain and reduced mobility. May require corticosteroid injection.",
    ),
    Disease(
      id: 15,
      painLevel: 5,
      name: "Rotator Cuff Strain",
      bodyPartId: 2,
      symptomDetails: "Significant shoulder pain, difficulty raising arm, pain at night, weakness in arm",
      description: "Partial tear or strain of rotator cuff muscles causing substantial pain and functional limitation. Physical therapy often required.",
    ),
    Disease(
      id: 16,
      painLevel: 6,
      name: "Severe Bicep Tendon Tear",
      bodyPartId: 2,
      symptomDetails: "Sudden severe pain, visible bruising, bulge in arm (Popeye sign), significant weakness",
      description: "Rupture of bicep tendon causing marked pain and deformity. Often requires surgical evaluation and repair.",
    ),
    Disease(
      id: 17,
      painLevel: 7,
      name: "Acute Compartment Syndrome",
      bodyPartId: 2,
      symptomDetails: "Severe pain disproportionate to injury, tight swelling, numbness, pale or dark skin, severe weakness",
      description: "Medical emergency where increased pressure in muscle compartment reduces blood flow. Requires emergency surgical decompression.",
    ),
    Disease(
      id: 18,
      painLevel: 8,
      name: "Severe Compound Fracture",
      bodyPartId: 2,
      symptomDetails: "Extreme pain, visible bone through skin, severe bleeding, deformity, shock symptoms",
      description: "Open fracture with bone breaking through skin. Surgical emergency requiring immediate medical attention to prevent infection and restore function.",
    ),
    Disease(
      id: 19,
      painLevel: 9,
      name: "Acute Arterial Occlusion",
      bodyPartId: 2,
      symptomDetails: "Sudden severe pain, cold pale arm, no pulse, paralysis, loss of sensation",
      description: "Complete blockage of arm artery causing tissue death. Vascular emergency requiring immediate surgery to restore blood flow.",
    ),
    Disease(
      id: 20,
      painLevel: 10,
      name: "Severe Crush Injury",
      bodyPartId: 2,
      symptomDetails: "Unbearable pain, massive tissue damage, severe bleeding, shock, potential amputation needed",
      description: "Catastrophic trauma with extensive soft tissue, nerve, and vascular damage. Life-threatening injury requiring immediate emergency intervention.",
    ),

    // RIGHT ARM DISEASES (bodyPartId: 3)
    Disease(
      id: 21,
      painLevel: 3,
      name: "Mild Overuse Soreness",
      bodyPartId: 3,
      symptomDetails: "Light aching after repetitive activities, mild stiffness in forearm",
      description: "Common soreness from repetitive motions like typing or sports. Resolves with rest and gentle stretching.",
    ),
    Disease(
      id: 22,
      painLevel: 2,
      name: "Early Carpal Tunnel Syndrome",
      bodyPartId: 3,
      symptomDetails: "Occasional tingling in thumb and fingers, mild hand numbness at night",
      description: "Nerve compression in wrist causing intermittent symptoms. Often managed with wrist splints and ergonomic adjustments.",
    ),
    Disease(
      id: 23,
      painLevel: 3,
      name: "Tennis Elbow",
      bodyPartId: 3,
      symptomDetails: "Pain on outside of elbow, weak grip strength, pain when lifting objects",
      description: "Lateral epicondylitis causing elbow pain from overuse. Responds to rest, ice, and physical therapy.",
    ),
    Disease(
      id: 24,
      painLevel: 4,
      name: "Moderate Wrist Sprain",
      bodyPartId: 3,
      symptomDetails: "Noticeable wrist pain, swelling, bruising, reduced grip, pain with movement",
      description: "Torn or stretched wrist ligaments causing significant discomfort. May require immobilization with brace or cast.",
    ),
    Disease(
      id: 25,
      painLevel: 5,
      name: "Frozen Shoulder",
      bodyPartId: 3,
      symptomDetails: "Severe stiffness, progressive loss of motion, constant dull ache, pain interfering with sleep",
      description: "Adhesive capsulitis causing significant shoulder restriction and pain. Requires prolonged physical therapy and sometimes surgical intervention.",
    ),
    Disease(
      id: 26,
      painLevel: 6,
      name: "Complete Rotator Cuff Tear",
      bodyPartId: 3,
      symptomDetails: "Intense shoulder pain, inability to lift arm, severe weakness, night pain preventing sleep",
      description: "Full-thickness tear of rotator cuff requiring surgical repair. Causes severe functional impairment and constant pain.",
    ),
    Disease(
      id: 27,
      painLevel: 7,
      name: "Severe Ulnar Nerve Injury",
      bodyPartId: 3,
      symptomDetails: "Severe burning pain, complete numbness in hand, claw-like hand deformity, muscle wasting",
      description: "Significant nerve damage causing intense neuropathic pain and functional loss. Often requires nerve surgery and extensive rehabilitation.",
    ),
    Disease(
      id: 28,
      painLevel: 8,
      name: "Humeral Shaft Fracture",
      bodyPartId: 3,
      symptomDetails: "Extreme pain, obvious arm deformity, inability to move arm, swelling, bruising, possible nerve damage",
      description: "Complete break of upper arm bone causing severe pain and requiring surgical fixation with plates or rods.",
    ),
    Disease(
      id: 29,
      painLevel: 9,
      name: "Severe Electrical Burn",
      bodyPartId: 3,
      symptomDetails: "Excruciating pain, deep tissue destruction, muscle and nerve damage, cardiac arrhythmias",
      description: "High-voltage electrical injury causing extensive internal damage beyond visible burns. Life-threatening condition requiring intensive care.",
    ),
    Disease(
      id: 30,
      painLevel: 10,
      name: "Traumatic Amputation",
      bodyPartId: 3,
      symptomDetails: "Complete loss of limb, extreme pain, massive hemorrhage, shock, life-threatening blood loss",
      description: "Catastrophic injury with complete limb loss. Requires immediate tourniquet application and emergency surgical intervention to prevent death.",
    ),

    // ABDOMEN DISEASES (bodyPartId: 4)
    Disease(
      id: 31,
      painLevel: 1,
      name: "Mild Indigestion",
      bodyPartId: 4,
      symptomDetails: "Slight stomach discomfort, mild bloating, occasional gas",
      description: "Minor digestive upset from food or drink. Usually resolves on its own or with antacids.",
    ),
    Disease(
      id: 32,
      painLevel: 2,
      name: "Constipation",
      bodyPartId: 4,
      symptomDetails: "Lower abdominal cramping, bloating, difficulty passing stool",
      description: "Reduced bowel movements causing mild to moderate discomfort. Responds to increased fiber, fluids, and stool softeners.",
    ),
    Disease(
      id: 33,
      painLevel: 3,
      name: "Gastritis",
      bodyPartId: 4,
      symptomDetails: "Upper abdominal burning, nausea, feeling full quickly, occasional vomiting",
      description: "Inflammation of stomach lining causing moderate pain. Managed with acid reducers, dietary changes, and avoiding irritants.",
    ),
    Disease(
      id: 34,
      painLevel: 4,
      name: "Irritable Bowel Syndrome (IBS)",
      bodyPartId: 4,
      symptomDetails: "Cramping abdominal pain, alternating diarrhea and constipation, bloating, mucus in stool",
      description: "Chronic condition causing significant abdominal discomfort and bowel changes. Requires dietary management and medication.",
    ),
    Disease(
      id: 35,
      painLevel: 5,
      name: "Gastroenteritis",
      bodyPartId: 4,
      symptomDetails: "Severe cramping, diarrhea, vomiting, fever, dehydration, body aches",
      description: "Viral or bacterial infection causing intense stomach flu symptoms. May require IV fluids if dehydration severe.",
    ),
    Disease(
      id: 36,
      painLevel: 6,
      name: "Kidney Stones",
      bodyPartId: 4,
      symptomDetails: "Intense wave-like pain in side and back, radiating to lower abdomen and groin, blood in urine, nausea, vomiting",
      description: "Hard mineral deposits causing severe colicky pain as they pass through urinary tract. Often requires pain medication and sometimes surgical removal.",
    ),
    Disease(  
      id: 37,
      painLevel: 7,
      name: "Acute Pancreatitis",
      bodyPartId: 4,
      symptomDetails: "Severe upper abdominal pain radiating to back, worsens after eating, nausea, vomiting, fever, rapid pulse",
      description: "Inflammation of pancreas causing severe persistent pain. Requires hospitalization, IV fluids, and pain management.",
    ),
    Disease(
      id: 38,
      painLevel: 8,
      name: "Acute Appendicitis",
      bodyPartId: 4,
      symptomDetails: "Sudden severe pain starting near navel then moving to lower right abdomen, fever, nausea, vomiting, loss of appetite, rebound tenderness",
      description: "Inflamed appendix requiring emergency surgical removal. Delayed treatment risks rupture and life-threatening peritonitis.",
    ),
    Disease(
      id: 39,
      painLevel: 9,
      name: "Perforated Ulcer",
      bodyPartId: 4,
      symptomDetails: "Sudden, severe, sharp abdominal pain, rigid abdomen, signs of shock, severe nausea, inability to pass gas",
      description: "Hole in stomach or intestine wall spilling contents into abdomen. Surgical emergency causing severe peritonitis and sepsis if untreated.",
    ),
    Disease(
      id: 40,
      painLevel: 10,
      name: "Ruptured Abdominal Aortic Aneurysm",
      bodyPartId: 4,
      symptomDetails: "Sudden catastrophic abdominal or back pain, rapid pulse, loss of consciousness, severe drop in blood pressure, imminent death without surgery",
      description: "Bursting of main abdominal artery causing massive internal bleeding. Most lethal surgical emergency requiring immediate operation. High mortality rate even with treatment.",
    ),

    // LEFT LEG DISEASES (bodyPartId: 5)
    Disease(
      id: 41,
      painLevel: 1,
      name: "Minor Calf Cramp",
      bodyPartId: 5,
      symptomDetails: "Brief muscle spasm, temporary tightness, mild residual soreness",
      description: "Common muscle cramp from dehydration or overuse. Relieved by stretching and hydration.",
    ),
    Disease(
      id: 42,
      painLevel: 2,
      name: "Shin Splints",
      bodyPartId: 5,
      symptomDetails: "Dull ache along shin bone, tenderness, pain during and after exercise",
      description: "Overuse injury common in runners. Responds to rest, ice, proper footwear, and gradual return to activity.",
    ),
    Disease(
      id: 43,
      painLevel: 3,
      name: "Mild Ankle Sprain",
      bodyPartId: 5,
      symptomDetails: "Ankle pain and swelling, mild bruising, difficulty walking, tenderness",
      description: "Stretched or partially torn ankle ligaments. Requires rest, ice, compression, elevation (RICE) and possibly bracing.",
    ),
    Disease(
      id: 44,
      painLevel: 4,
      name: "Knee Osteoarthritis",
      bodyPartId: 5,
      symptomDetails: "Knee pain and stiffness, worse in morning or after sitting, grinding sensation, reduced flexibility",
      description: "Wear and tear of knee cartilage causing chronic pain and reduced mobility. Managed with medications, physical therapy, and weight management.",
    ),
    Disease(
      id: 45,
      painLevel: 5,
      name: "Meniscus Tear",
      bodyPartId: 5,
      symptomDetails: "Knee pain especially with twisting, swelling, stiffness, locking or catching sensation, difficulty straightening knee",
      description: "Torn knee cartilage causing significant pain and mechanical symptoms. Often requires arthroscopic surgery for repair or removal.",
    ),
    Disease(
      id: 46,
      painLevel: 6,
      name: "ACL Tear",
      bodyPartId: 5,
      symptomDetails: "Sudden severe knee pain with pop sound, rapid swelling, instability, inability to bear weight",
      description: "Complete tear of anterior cruciate ligament causing severe pain and knee instability. Usually requires surgical reconstruction and months of rehabilitation.",
    ),
    Disease(
      id: 47,
      painLevel: 7,
      name: "Severe Achilles Tendon Rupture",
      bodyPartId: 5,
      symptomDetails: "Sudden severe pain in back of ankle with pop or snap sound, inability to stand on toes, visible gap in tendon, significant swelling",
      description: "Complete tear of Achilles tendon causing severe pain and loss of function. Requires surgical repair or prolonged immobilization.",
    ),
    Disease(
      id: 48,
      painLevel: 8,
      name: "Tibial Plateau Fracture",
      bodyPartId: 5,
      symptomDetails: "Severe knee pain, rapid massive swelling, complete inability to bear weight, visible deformity",
      description: "Break in upper shinbone affecting knee joint. Serious injury requiring surgical repair with plates and screws.",
    ),
    Disease(
      id: 49,
      painLevel: 9,
      name: "Acute Compartment Syndrome",
      bodyPartId: 5,
      symptomDetails: "Extreme leg pain, severe tightness, numbness and tingling, pale or dusky skin, paralysis",
      description: "Surgical emergency where increased pressure cuts off blood flow to leg muscles. Requires emergency fasciotomy to prevent permanent damage.",
    ),
    Disease(
      id: 50,
      painLevel: 10,
      name: "Femoral Artery Laceration",
      bodyPartId: 5,
      symptomDetails: "Catastrophic pain, massive bleeding, rapid blood loss, shock, loss of consciousness, potential death within minutes",
      description: "Severed major leg artery causing life-threatening hemorrhage. Requires immediate tourniquet and emergency vascular surgery. Can be fatal within minutes without intervention.",
    ),

    // RIGHT LEG DISEASES (bodyPartId: 6)
    Disease(
      id: 51,
      painLevel: 1,
      name: "Mild Foot Fatigue",
      bodyPartId: 6,
      symptomDetails: "Slight aching in feet after standing, minor soreness in arch",
      description: "Normal foot fatigue from prolonged standing or walking. Relieved by rest and foot elevation.",
    ),
    Disease(
      id: 52,
      painLevel: 2,
      name: "Plantar Fasciitis (early)",
      bodyPartId: 6,
      symptomDetails: "Heel pain especially with first steps in morning, tenderness in arch, pain after prolonged standing",
      description: "Inflammation of plantar fascia causing heel pain. Managed with stretching, proper footwear, and orthotics.",
    ),
    Disease(
      id: 53,
      painLevel: 3,
      name: "Moderate Ankle Sprain",
      bodyPartId: 6,
      symptomDetails: "Significant ankle pain and swelling, bruising, difficulty bearing weight, joint instability",
      description: "Partially torn ankle ligaments causing moderate functional impairment. Requires immobilization and physical therapy.",
    ),
    Disease(
      id: 54,
      painLevel: 4,
      name: "Stress Fracture",
      bodyPartId: 6,
      symptomDetails: "Localized bone pain, worsens with activity, improves with rest, swelling, tenderness",
      description: "Small crack in bone from repetitive stress. Requires rest, protective boot, and gradual return to activity over 6-8 weeks.",
    ),
    Disease(
      id: 55,
      painLevel: 5,
      name: "Deep Vein Thrombosis (DVT)",
      bodyPartId: 6,
      symptomDetails: "Calf pain and swelling, warmth, redness, tenderness, leg feels heavy",
      description: "Blood clot in deep leg vein causing significant pain and swelling. Requires immediate anticoagulation to prevent pulmonary embolism.",
    ),
    Disease(
      id: 56,
      painLevel: 6,
      name: "Severe Patellar Dislocation",
      bodyPartId: 6,
      symptomDetails: "Intense knee pain, visible kneecap displacement, inability to straighten leg, swelling, deformity",
      description: "Kneecap moves out of position causing severe pain. Requires reduction (repositioning) and often surgical stabilization.",
    ),
    Disease(
      id: 57,
      painLevel: 7,
      name: "Tibial Fracture",
      bodyPartId: 6,
      symptomDetails: "Severe leg pain, obvious deformity, inability to bear weight, swelling, bruising, possible open wound",
      description: "Complete break of shin bone causing severe pain and requiring surgical fixation with rods or plates.",
    ),
    Disease(
      id: 58,
      painLevel: 8,
      name: "Hip Fracture",
      bodyPartId: 6,
      symptomDetails: "Severe hip and groin pain, inability to stand or walk, leg appears shorter and turned outward, severe bruising",
      description: "Break in upper thighbone requiring emergency surgery. Common in elderly and requires immediate surgical pinning or replacement.",
    ),
    Disease(
      id: 59,
      painLevel: 9,
      name: "Multiple Trauma with Pelvic Fracture",
      bodyPartId: 6,
      symptomDetails: "Extreme pain, unable to move leg, internal bleeding, shock, low blood pressure, possible nerve damage",
      description: "Severe pelvic break causing massive internal bleeding. Life-threatening injury requiring emergency stabilization and surgery.",
    ),
    Disease(
      id: 60,
      painLevel: 10,
      name: "Traumatic Lower Limb Amputation",
      bodyPartId: 6,
      symptomDetails: "Complete leg loss, unbearable pain, massive bleeding, shock, life-threatening hemorrhage, potential death",
      description: "Catastrophic traumatic injury with complete leg separation. Requires immediate tourniquet, emergency transport, and surgical intervention. High risk of death from blood loss.",
    ),

    // BACK DISEASES (bodyPartId: 7)
    Disease(
      id: 61,
      painLevel: 1,
      name: "Mild Muscle Stiffness",
      bodyPartId: 7,
      symptomDetails: "Slight tightness in lower back, minor discomfort with bending",
      description: "Common stiffness from poor posture or prolonged sitting. Improves with stretching and movement.",
    ),
    Disease(
      id: 62,
      painLevel: 2,
      name: "Muscle Strain",
      bodyPartId: 7,
      symptomDetails: "Dull aching, muscle tightness, limited range of motion, pain with certain movements",
      description: "Overstretched or torn muscle fibers causing mild to moderate pain. Responds to rest, ice, and over-the-counter pain relievers.",
    ),
    Disease(
      id: 63,
      painLevel: 3,
      name: "Mechanical Back Pain",
      bodyPartId: 7,
      symptomDetails: "Lower back pain, stiffness, pain worsens with activity, improves with rest, limited flexibility",
      description: "Non-specific back pain from muscle or ligament strain. Managed with physical therapy, proper body mechanics, and core strengthening.",
    ),
    Disease(
      id: 64,
      painLevel: 4,
      name: "Herniated Disc (mild)",
      bodyPartId: 7,
      symptomDetails: "Back pain radiating down leg, numbness or tingling, weakness, pain worsens with sitting or bending",
      description: "Bulging spinal disc pressing on nerve causing moderate pain and nerve symptoms. Often responds to conservative treatment.",
    ),
    Disease(
      id: 65,
      painLevel: 5,
      name: "Sciatica",
      bodyPartId: 7,
      symptomDetails: "Sharp shooting pain from lower back down leg, burning sensation, numbness, difficulty standing from sitting",
      description: "Severe nerve irritation causing intense radiating pain. May require epidural injections or surgery if conservative treatment fails.",
    ),
    Disease(
      id: 66,
      painLevel: 6,
      name: "Severe Herniated Disc",
      bodyPartId: 7,
      symptomDetails: "Intense back and leg pain, significant numbness, muscle weakness, difficulty walking, loss of reflexes",
      description: "Large disc herniation with severe nerve compression. Often requires surgical discectomy to relieve pressure.",
    ),
    Disease(
      id: 67,
      painLevel: 7,
      name: "Spinal Stenosis (severe)",
      bodyPartId: 7,
      symptomDetails: "Severe back and leg pain, numbness, weakness in legs, difficulty walking, pain improves when leaning forward",
      description: "Narrowing of spinal canal causing significant nerve compression. May require decompressive surgery if symptoms are severe.",
    ),
    Disease(
      id: 68,
      painLevel: 8,
      name: "Compression Fracture",
      bodyPartId: 7,
      symptomDetails: "Sudden severe back pain, height loss, stooped posture, pain worsens with movement, difficulty standing straight",
      description: "Vertebral collapse from osteoporosis or trauma. Causes severe pain and may require vertebroplasty or kyphoplasty.",
    ),
    Disease(
      id: 69,
      painLevel: 9,
      name: "Cauda Equina Syndrome",
      bodyPartId: 7,
      symptomDetails: "Severe lower back pain, bilateral leg weakness, numbness in saddle area, loss of bowel/bladder control, sexual dysfunction",
      description: "Surgical emergency with compression of nerve roots at base of spine. Requires immediate surgery within 48 hours to prevent permanent paralysis and incontinence.",
    ),
    Disease(
      id: 70,
      painLevel: 10,
      name: "Spinal Cord Transection",
      bodyPartId: 7,
      symptomDetails: "Catastrophic pain, complete paralysis below injury, total loss of sensation, inability to breathe if high injury, spinal shock",
      description: "Complete severing of spinal cord causing permanent paralysis and loss of all function below injury level. Devastating injury requiring immediate emergency spinal stabilization.",
    ),
  ];

  @override
  String toString() => 'Disease(painLevel: $painLevel, name: $name, description: $description)';

}