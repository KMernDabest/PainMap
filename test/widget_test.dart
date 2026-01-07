import 'package:flutter_test/flutter_test.dart';
import 'package:painmap/app.dart';

void main() {
  testWidgets('App smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const PainMap());

    // Verify that the app loads without crashing
    expect(find.byType(PainMap), findsOneWidget);
  });
}
