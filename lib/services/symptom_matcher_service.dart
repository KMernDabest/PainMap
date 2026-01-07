import '../models/disease.dart';

class SymptomMatcherService {
  /// Match disease by body part and pain level
  Disease? matchDisease(int bodyPartId, int painLevel) {
    try {
      return Disease.diseaseList.firstWhere(
        (disease) =>
            disease.bodyPartId == bodyPartId &&
            disease.painLevel == painLevel,
      );
    } catch (e) {
      return null;
    }
  }

  // Get all diseases for a specific body part and pain level
  // Originally intended to return multiple matches
  List<Disease> getAllMatchingDiseases(int bodyPartId, int painLevel) {
    return Disease.diseaseList
        .where((disease) =>
            disease.bodyPartId == bodyPartId &&
            disease.painLevel == painLevel)
        .toList();
  }
}