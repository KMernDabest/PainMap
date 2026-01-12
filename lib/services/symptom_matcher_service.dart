import '../models/disease.dart';
import '../models/body_part.dart';
import '../repo/disease_list_data.dart';

class SymptomMatcherService {
  /// Match disease by body part and pain level
  Disease? matchDisease(BodyPart bodyPart, int painLevel) {
    return DiseaseRepository.findByBodyPartAndPainLevel(bodyPart, painLevel);
  }

  /// Get all diseases for a specific body part
  List<Disease> getDiseasesByBodyPart(BodyPart bodyPart) {
    return DiseaseRepository.getAllDiseases()
        .where((disease) => disease.bodyPart == bodyPart)
        .toList();
  }

  /// Get all diseases for a specific pain level
  List<Disease> getDiseasesByPainLevel(int painLevel) {
    return DiseaseRepository.getAllDiseases()
        .where((disease) => disease.painLevel == painLevel)
        .toList();
  }
}