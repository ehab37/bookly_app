# My Bookly

My Bookly is a modern Flutter application designed for book enthusiasts to discover, search, and explore detailed information about books. The app is built with **Clean Architecture** principles and a **Feature-driven** structure to ensure scalability, maintainability, and testability.

## 🚀 Features

- **Splash Screen:** A smooth introduction to the application.
- **Home View:** 
    - **All Books:** A horizontal scrollable list of books.
    - **Newest Books:** A vertical list showing the latest additions.
- **Book Details:** Comprehensive view for each book, including descriptions and a "Similar Books" section.
- **Search:** Quickly find books by title or author.
- **Responsive UI:** Elegant dark theme with custom typography and smooth animations.

## 🏗️ Architecture

The project follows a **Clean Architecture** approach organized by features:

- **Core:** Contains shared utilities, error handling (`Failure` classes), and global configurations like routing and service discovery.
- **Features:** Each feature (Home, Search, Splash) is isolated into its own layer:
    - **Data:** Repository implementations, models, and data sources (API services).
    - **Domain:** Business logic (Entities and Use Cases - *if explicitly defined*).
    - **Presentation:** UI widgets and state management using the BLoC/Cubit pattern.

## 🛠️ Tech Stack

- **State Management:** [flutter_bloc](https://pub.dev/packages/flutter_bloc) (using Cubits for lightweight state handling).
- **Navigation:** [go_router](https://pub.dev/packages/go_router) for declarative and deep-linkable routing.
- **Networking:** [dio](https://pub.dev/packages/dio) for efficient HTTP requests.
- **Dependency Injection:** [get_it](https://pub.dev/packages/get_it) for service locator pattern.
- **Data Comparison:** [equatable](https://pub.dev/packages/equatable) for value-based equality.
- **Functional Programming:** [dartz](https://pub.dev/packages/dartz) for handling functional error management (`Either`).
- **Typography:** [google_fonts](https://pub.dev/packages/google_fonts) and custom local fonts.
- **Image Caching:** [cached_network_image](https://pub.dev/packages/cached_network_image).

## 📂 Project Structure

```text
lib/
├── core/                  # Shared utilities, errors, and routers
│   ├── errors/            # Custom failure and error handling
│   └── utils/             # API services, App Router, and Service Locator
├── features/              # Feature-based organization
│   ├── home/              # Home feature (Data, Presentation)
│   ├── search/            # Search feature
│   └── splash/            # Splash screen views
├── constants.dart         # Global constants (colors, etc.)
└── main.dart              # App entry point and Bloc initialization
```

## ⚙️ Getting Started

### Prerequisites

- Flutter SDK (>=3.1.0)
- Dart SDK

### Installation

1.  **Clone the repository:**
    ```bash
    git clone https://github.com/your-username/my_bookly.git
    ```
2.  **Navigate to the project directory:**
    ```bash
    cd my_bookly
    ```
3.  **Install dependencies:**
    ```bash
    flutter pub get
    ```
4.  **Run the application:**
    ```bash
    flutter run
    ```

## 🛡️ Error Handling

The application uses a robust error handling mechanism implemented via the `Failure` class and its specialization `ServerFailure`. It gracefully handles various `DioException` types including timeouts, connection errors, and bad responses from the server.
