# 🩺 Symptom & Disease Explorer App (Flutter)

A **Flutter-based mobile application** that helps users explore **diseases by body part and symptoms**, presented in a **clean, friendly, and intuitive UI**.

---

##  Overview

This application allows users to:

- Select a **body part**
- Automatically view **related diseases**
- Read **disease descriptions and symptoms**
- Navigate smoothly with a **modern UI**
- Perform fast, offline-friendly searches

Designed for:
- Health education
- Medical learning projects
- Symptom awareness apps
- Flutter academic projects

---

##  Features

-  Body-part-based disease search  
-  Automatic category selection  
-  Smart disease filtering  
-  Detailed disease information screen  
-  Clean and friendly UI  
-  Offline-ready (local data source)  
-  Modular and scalable architecture  

---

##  App Flow

1. User selects a **body part**
2. App navigates to the **Search Screen**
3. The selected body part is **automatically activated**
4. Related diseases are displayed instantly
5. User taps a disease to view full details

---

## 🗂️ Project Structure

```
lib/
│
├── models/
│ ├── disease.dart
│ ├── symptom.dart
│ |── body_part.dart
| └── history.dart
│
├── screens/
│ ├── search_screen.dart
| ├── history_screen.dart
│ └── home_screen.dart
│
├── widgets/
│ ├── disease_list_item.dart
│ ├── category_card.dart
│ └── info_section.dart
| ...
│
├── services/
│ └── disease_matching_service.dart
│
└── main.dart
```


---

##  Data Models

### Disease Model

```dart
class Disease {
  final int id;
  final int painLevel;
  final String name;
  final int bodyPartId;
  final String? description;
  final String? symptomDetails;
}
```
### Symptom Model


```dart
class Symptom {
  final int id;
  final String name;
  final List<Disease> diseasesId;
  final BodyPart bodyPart;
}
```
### History Model
```dart
class History {
  final String id;
  final Symptom symptomName;
  final Disease disease;
  final BodyPart bodyPart;
  final DateTime dateLogged;
  final int? level;
  final String? notes;
}
```
