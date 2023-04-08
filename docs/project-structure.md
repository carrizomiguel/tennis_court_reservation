# Installation and Configuration

- [Project Folder Structure](#project-folder-structure)
- [Feature Folder Structure](#feature-folder-structure)


## Project Folder Structure
```
├── lib/
|   ├── core/
|   |   ├── error/
│   │   ├── network/
│   │   ├── storage/
│   │   ├── util/
|   |   └── core.dart
|   ├── ui/
|   |   ├── app/
│   │   │   ├── data/
│   │   │   ├── presentation/
│   │   │   └── app.dart
│   │   ├── features/
│   │   │   ├── feature1/
│   │   │   │   ├── data/
│   │   │   │   ├── presentation/
│   │   │   │   └── feature1.dart
│   │   │   └── feature2/
│   │   │       ├── data/
│   │   │       ├── presentation/
│   │   │       └── feature2.dart
│   │   └── shared/
|   ├── bootstrap.dart
│   └── main.dart
├── pubspec.yaml
└── README.md
```

## |Feature Folder Structure
```
└── feature1/
    ├── data/
    |   ├── datasources/
    |   ├── models/
    |   └── repositories/
    ├── presentation/
    |   ├── bloc/
    |   ├── views/
    |   └── widgets/
    └── feature1.dart
```
### Description
- **feature1/ :** This is the root folder for the feature, and its name should be descriptive of what the feature does.
    - **data/ :** This folder contains all the data-related classes for the feature, such as datasources, models, and repositories.
        - **datasources/ :** This folder contains classes that abstract the source of the data for the feature. Examples of datasources could be an API, a local database, or shared preferences.
        - **models/ :** This folder contains the data models used by the feature. Models are typically plain Dart classes that represent the data in the feature.
        - **repositories/ :** This folder contains the repository class for the feature. The repository is responsible for orchestrating the flow of data between the datasources and the presentation layer.
    - **presentation/ :** This folder contains all the classes related to the UI of the feature, such as blocs, views, and widgets.
        - **bloc/ :** This folder contains the business logic classes for the feature. A bloc typically contains the logic for reacting to user events, fetching data, and updating the UI.
        - **views/ :** This folder contains the widget that represents the screen of the feature. A view is responsible for laying out the UI and reacting to user events.
        - **widgets/ :** This folder contains any reusable UI components that the feature might need.
    - **feature1.dart :** This is the barrel file for the feature. A barrel file is a file that exports (i.e. re-exports) all the important classes and files in a directory or package. In this case, feature1.dart would export all the BLoCs, views, and widgets for the feature, so that other parts of the application can easily import and use them.
