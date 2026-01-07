# PainMap

A Flutter application for tracking and diagnosing pain symptoms by body part location with intelligent disease matching.

## Features

- 🗺️ Interactive body diagram for pain location selection
- 📊 Pain level tracking (1-10 scale)
- 🔍 Smart disease matching based on symptoms and pain levels
- 📝 History tracking of logged symptoms
- 🔎 Search functionality for diseases and symptoms
- ⚠️ Emergency alerts for critical pain levels

---

### Prerequisites

- Flutter SDK (^3.10.4)
- Dart SDK
- Android Studio / VS Code with Flutter extensions
- iOS development tools (for iOS deployment)

### Installation

1. Clone the repository:

```bash
git clone https://github.com/KMernDabest/PainMap.git
cd PainMap
```

1. Verify Flutter installation:

```bash
flutter doctor
```

Make sure all required components are installed. Fix any issues reported.

1. Install all project dependencies:

```bash
flutter pub get
```

This will automatically download and install:

- `flutter_svg: ^1.1.0` - SVG rendering support
- `body_part_selector: any` - Interactive body diagram widget
- `shared_preferences: ^2.3.4` - Local data persistence
- `uuid: ^4.5.1` - Unique identifier generation
- `cupertino_icons: ^1.0.8` - iOS-style icons

1. Verify dependencies are installed:

```bash
flutter pub deps
```

1. Clean and rebuild (if needed):

```bash
flutter clean
flutter pub get
```

1. Run the app:

```bash
# For development
flutter run

## Project Architecture

### Directory Structure

```

lib/
├── main.dart                 # Application entry point
├── app.dart                  # Main app widget configuration
├── data/
│   └── data_repository.dart  # Data persistence layer
├── models/
│   ├── body_part.dart        # Body part model
│   ├── disease.dart          # Disease model
│   ├── history.dart          # History entry model
│   ├── symptom.dart          # Symptom model
│   └── user.dart             # User model
├── screen/
│   ├── home_screen.dart      # Main body diagram interface
│   ├── history_screen.dart   # History tracking screen
│   └── search_screen.dart    # Disease/symptom search
├── services/
│   └── symptom_matcher_service.dart  # Disease matching logic
└── widgets/
    ├── body_diagram.dart     # Interactive body diagram
    ├── bottom_navigation.dart # Navigation bar
    ├── category_card.dart    # Category display card
    ├── detail_disease.dart   # Disease detail view
    ├── disease_list_item.dart # Disease list item
    ├── history_card.dart     # History entry card
    ├── info_section.dart     # Information section widget
    └── symptom_list.dart     # Symptom list display

### Data Structure

data/
├── disease.json    # Disease database
├── symptom.json    # Symptom database
└── history.json    # User history data

### Core Components

#### Models

- **BodyPart**: Represents anatomical body regions
- **Disease**: Contains disease information, pain levels, and symptoms
- **Symptom**: Links symptoms to body parts
- **History**: Tracks user's logged pain events
- **User**: User profile information

#### Screens

- **HomeScreen**: Primary interface with interactive body diagram
- **HistoryScreen**: View past logged pain entries
- **SearchScreen**: Search and filter diseases/symptoms

#### Services

- **SymptomMatcherService**: Intelligent disease matching algorithm based on body part and pain level

#### Data Layer

- **DataRepository**: Handles data persistence using SharedPreferences

## Dependencies

```yaml
dependencies:
  flutter_svg: ^1.1.0          # SVG rendering
  body_part_selector: any       # Body part selection UI
  shared_preferences: ^2.3.4    # Local data storage
  uuid: ^4.5.1                  # Unique ID generation
  cupertino_icons: ^1.0.8       # iOS-style icons
```

## State Management

This project uses **StatefulWidget** for local state management without external state management libraries.

## Data Persistence

User data is persisted locally using **SharedPreferences**, including:

- Pain history logs
- User preferences
- Cached disease/symptom data

## Testing

The project includes comprehensive unit tests for all core components.

### Running Tests

Run all tests:

```bash
flutter test
```

Run specific test file:

```bash
flutter test test/models/disease_test.dart
```

Run tests with coverage:

```bash
flutter test --coverage
```

### Test Coverage

- **Models** (test/models/)
  - `disease_test.dart` - Disease model validation and list tests
  - `body_part_test.dart` - BodyPart enum and Level enum tests
  - `symptom_test.dart` - Symptom model and list validation
  - `history_test.dart` - History model, JSON serialization tests

- **Services** (test/services/)
  - `symptom_matcher_service_test.dart` - Disease matching algorithm tests

- **Data Layer** (test/data/)
  - `data_repository_test.dart` - Data persistence and CRUD operations

- **Widget Tests** (test/)
  - `widget_test.dart` - App initialization smoke test

### Test Statistics

- **43+ unit tests** covering core functionality
- Tests for CRUD operations, data validation, and business logic
- Mock data support using `shared_preferences` test package

## Color Scheme

Primary Colors:

- Primary Blue: `#2563EB`
- Background: `#F7FAFC`
- Pain Level Colors: Green → Yellow → Orange → Red (severity-based)

## Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## License

This project is a Flutter application for educational and medical tracking purposes.

## Resources

- [Flutter Documentation](https://docs.flutter.dev/)
- [Flutter Cookbook](https://docs.flutter.dev/cookbook)
- [Dart API Reference](https://api.dart.dev/)
