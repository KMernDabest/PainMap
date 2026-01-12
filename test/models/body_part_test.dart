import 'package:flutter_test/flutter_test.dart';
import 'package:painmap/models/body_part.dart';

void main() {
  group('BodyPart Enum Tests', () {
    test('BodyPart should have correct name values', () {
      expect(BodyPart.head.name, 'HEAD');
      expect(BodyPart.leftArm.name, 'LEFT_ARM');
      expect(BodyPart.rightArm.name, 'RIGHT_ARM');
      expect(BodyPart.abdomen.name, 'ABDOMEN');
      expect(BodyPart.leftLeg.name, 'LEFT_LEG');
      expect(BodyPart.rightLeg.name, 'RIGHT_LEG');
      expect(BodyPart.back.name, 'BACK');
    });

    test('BodyPart should have 7 values', () {
      expect(BodyPart.values.length, 7);
    });

    test('BodyPart should contain all expected values', () {
      expect(BodyPart.values, contains(BodyPart.head));
      expect(BodyPart.values, contains(BodyPart.leftArm));
      expect(BodyPart.values, contains(BodyPart.rightArm));
      expect(BodyPart.values, contains(BodyPart.abdomen));
      expect(BodyPart.values, contains(BodyPart.leftLeg));
      expect(BodyPart.values, contains(BodyPart.rightLeg));
      expect(BodyPart.values, contains(BodyPart.back));
    });
  });
}
