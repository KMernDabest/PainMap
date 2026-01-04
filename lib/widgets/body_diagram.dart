import 'package:flutter/material.dart';
import 'package:body_part_selector/body_part_selector.dart';
import 'package:painmap/models/body_part.dart' as app;

class BodyDiagram extends StatefulWidget {
  final void Function(app.BodyPart)? onBodyPartTapped;

  const BodyDiagram({
    this.onBodyPartTapped,
    super.key,
  });

  @override
  State<BodyDiagram> createState() => _BodyDiagramState();
}

class _BodyDiagramState extends State<BodyDiagram> {
  BodyParts bodyParts = const BodyParts();
  BodySide currentSide = BodySide.front;

  // These parts are the id mappings to that part of the body and it's from the body part selector library
  app.BodyPart? _mapToAppBodyPart(BodyParts parts) {
    // Determine which body part was tapped based on the selection
    
    // Head (works on both front and back)
    if (parts.head && !bodyParts.head) return app.BodyPart.head;
    
    // Back areas (back view only) - any back/torso area click returns 'back'
    if (currentSide == BodySide.back) {
      // Check for neck or torso areas on back view
      if ((parts.neck && !bodyParts.neck) ||
          (parts.upperBody && !bodyParts.upperBody) ||
          (parts.lowerBody && !bodyParts.lowerBody)) {
        return app.BodyPart.back;
      }
    }
    
    // Arms (works on both front and back)
    if ((parts.leftShoulder || parts.leftUpperArm || parts.leftLowerArm || parts.leftHand) &&
        !(bodyParts.leftShoulder || bodyParts.leftUpperArm || bodyParts.leftLowerArm || bodyParts.leftHand)) {
      return app.BodyPart.leftArm;
    }
    if ((parts.rightShoulder || parts.rightUpperArm || parts.rightLowerArm || parts.rightHand) &&
        !(bodyParts.rightShoulder || bodyParts.rightUpperArm || bodyParts.rightLowerArm || bodyParts.rightHand)) {
      return app.BodyPart.rightArm;
    }
    
    // Abdomen (front view only)
    if ((parts.abdomen || parts.upperBody || parts.lowerBody) &&
        !(bodyParts.abdomen || bodyParts.upperBody || bodyParts.lowerBody) &&
        currentSide == BodySide.front) {
      return app.BodyPart.abdomen;
    }
    
    // Legs (works on both front and back)
    if ((parts.leftUpperLeg || parts.leftLowerLeg || parts.leftKnee || parts.leftFoot) &&
        !(bodyParts.leftUpperLeg || bodyParts.leftLowerLeg || bodyParts.leftKnee || bodyParts.leftFoot)) {
      return app.BodyPart.leftLeg;
    }
    if ((parts.rightUpperLeg || parts.rightLowerLeg || parts.rightKnee || parts.rightFoot) &&
        !(bodyParts.rightUpperLeg || bodyParts.rightLowerLeg || bodyParts.rightKnee || bodyParts.rightFoot)) {
      return app.BodyPart.rightLeg;
    }
    
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
       child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.5,
              child: BodyPartSelector(
                bodyParts: bodyParts,
                side: currentSide,
                selectedColor: Colors.grey[300]!,
                unselectedColor: Colors.grey[200]!,
                selectedOutlineColor: Colors.grey[400]!,
                unselectedOutlineColor: Colors.grey[350]!,
                onSelectionUpdated: (selection) {
                  final tappedPart = _mapToAppBodyPart(selection);
                  if (tappedPart != null) {
                    widget.onBodyPartTapped?.call(tappedPart);
                  }
                  // Reset selection immediately to allow repeated taps
                  setState(() {
                    bodyParts = const BodyParts();
                  });
                },
              ),
            ),
            const SizedBox(height: 32),
            ElevatedButton.icon(
              onPressed: () {
                setState(() {
                  currentSide = currentSide == BodySide.front 
                      ? BodySide.back 
                      : BodySide.front;
                });
              },
              icon: const Icon(Icons.swap_horiz),
              label: Text(currentSide == BodySide.front ? 'View Back' : 'View Front'),
            ),
          ],
        ),
      ),
    );
  }
}
