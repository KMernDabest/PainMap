import 'package:flutter_test/flutter_test.dart';
import 'package:painmap/models/body_part.dart';

void main() {
  group('BodyPart Enum Tests', () {
    test('BodyPart should have correct id values', () {
      expect(BodyPart.head.id, 1);
      expect(BodyPart.leftArm.id, 2);
      expect(BodyPart.rightArm.id, 3);
      expect(BodyPart.abdomen.id, 4);
      expect(BodyPart.leftLeg.id, 5);
      expect(BodyPart.rightLeg.id, 6);
      expect(BodyPart.back.id, 7);
    });

    test('BodyPart should have correct name values', () {
      expect(BodyPart.head.name, 'head');
      expect(BodyPart.leftArm.name, 'left arm');
      expect(BodyPart.rightArm.name, 'right arm');
      expect(BodyPart.abdomen.name, 'abdomen');
      expect(BodyPart.leftLeg.name, 'left leg');
      expect(BodyPart.rightLeg.name, 'right leg');
      expect(BodyPart.back.name, 'back');
    });

    test('BodyPart should have correct icon values', () {
      expect(BodyPart.head.icon, 'face');
      expect(BodyPart.leftArm.icon, 'handyman');
      expect(BodyPart.rightArm.icon, 'handyman');
      expect(BodyPart.abdomen.icon, 'center_focus');
      expect(BodyPart.leftLeg.icon, 'directions_walk');
      expect(BodyPart.rightLeg.icon, 'directions_walk');
      expect(BodyPart.back.icon, 'accessibility_new');
    });

    test('BodyPart should have 7 values', () {
      expect(BodyPart.values.length, 7);
    });

    test('BodyPart IDs should be unique', () {
      final ids = BodyPart.values.map((bp) => bp.id).toSet();
      expect(ids.length, BodyPart.values.length);
    });

    test('should find BodyPart by id', () {
      final bodyPart = BodyPart.values.firstWhere((bp) => bp.id == 1);
      expect(bodyPart, BodyPart.head);
    });
  });

  group('Level Enum Tests', () {
    test('Level should have all expected values', () {
      expect(Level.values, contains(Level.none));
      expect(Level.values, contains(Level.low));
      expect(Level.values, contains(Level.mild));
      expect(Level.values, contains(Level.moderate));
      expect(Level.values, contains(Level.severe));
    });

    test('Level should have 5 values', () {
      expect(Level.values.length, 5);
    });
  });
}
