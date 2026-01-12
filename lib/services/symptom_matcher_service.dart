import '../models/disease.dart';
import '../models/body_part.dart';
import '../repo/disease_list_data.dart';

class SymptomMatcherService {
  Disease? matchDisease(BodyPart bodyPart, int painLevel) {
    try {
      return DiseaseRepository.getAllDiseases().firstWhere(
        (disease) => disease.bodyPart == bodyPart && disease.painLevel == painLevel,
      );
    } catch (e) {
      return null;
    }
  }

  List<Disease> getDiseasesByBodyPart(BodyPart bodyPart) {
    return DiseaseRepository.getAllDiseases()
        .where((disease) => disease.bodyPart == bodyPart)
        .toList();
  }

  List<Disease> getDiseasesByPainLevel(int painLevel) {
    return DiseaseRepository.getAllDiseases()
        .where((disease) => disease.painLevel == painLevel)
        .toList();
  }

  Disease? findByName(String name) {
    try {
      return DiseaseRepository.getAllDiseases().firstWhere(
        (disease) => disease.name.toLowerCase() == name.toLowerCase(),
      );
    } catch (e) {
      return null;
    }
  }
}