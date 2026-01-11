import '../models/disease.dart';
import '../models/body_part.dart';
import '../repo/disease_list.dart';

class SymptomMatcherService {
  /// Match disease by body part and pain level
  Disease? matchDisease(int bodyPartId, int painLevel) {
    try {
      return DiseaseRepository.getAllDiseases().firstWhere(
        (disease) =>
            disease.bodyPart.id == bodyPartId &&
            disease.painLevel == painLevel,
      );
    } catch (e) {
      return null;
    }
  }

  // Get all diseases for a specific body part and pain level
  // Originally intended to return multiple matches
  List<Disease> getAllMatchingDiseases(int bodyPartId, int painLevel) {
    return DiseaseRepository.getAllDiseases()
        .where((disease) =>
            disease.bodyPart.id == bodyPartId &&
            disease.painLevel == painLevel)
        .toList();
  }
}