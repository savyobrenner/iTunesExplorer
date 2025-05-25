# iTunesExplorer 🎵

<p align="center">
  <img src="https://github.com/user-attachments/assets/e4ed91ed-f0ae-4da0-9506-acb11e5fae0d" width="30%">
  <img src="https://github.com/user-attachments/assets/34df42c4-32de-497b-a501-87fe52b069bf" width="30%">
  <img src="https://github.com/user-attachments/assets/a2126ff0-4db1-47de-8fb4-31c07b655676" width="30%">
</p>

iTunesExplorer is a SwiftUI-based iOS app that lists the **Top Albums** from the iTunes RSS Feed.  
It follows a clean architecture using **MVVM + Coordinators**, with offline support, localization, dependency injection, testing with Maestro, and a basic design system.

---

## 📦 Features

- ✅ Top 100 Albums from iTunes API
- ✅ Modular architecture (MVVM + Coordinators)
- ✅ Custom reusable UI Components (DesignSystem)
- ✅ Localization: 🇺🇸 English, 🇵🇹 Portuguese, 🇪🇸 Spanish
- ✅ Offline mode with local caching
- ✅ Cellular network detection with data usage suggestion
- ✅ Floating alerts & system alert integration
- ✅ Deep linking to Apple Music
- ✅ Unit tests + Maestro UI tests

---

## 🧱 Architecture Overview

```
Shared/
├── Analytics
├── Application
├── Assets
├── Base
├── DesignSystem
├── Endpoints
├── Extensions
├── Factory
├── Helpers
├── LaunchScreen
├── Layers
├── Localization
├── Models
├── Navigation
└── ViewModifier

Sources/
├── Splash
├── Home
└── AlbumDetails
```

---

## 🧪 Testing

### ✅ Unit Tests

To run unit tests in Xcode:

1. Open the iTunesExplorer project in Xcode.
2. Press `Cmd + U` to run all tests.

### 🎯 UI Tests with Maestro

This project uses [Maestro](https://maestro.mobile.dev/) for lightweight UI automation.

#### Installation
Using Homebrew:

```bash
brew install maestro
```

#### Folder Structure

```bash
maestro/
├── test_splash.yaml
├── test_home.yaml
├── test_album_details.yaml
└── test_offline_mode.yaml
```

#### Running the Tests

```bash
maestro test maestro/test_splash.yaml
maestro test maestro/test_home_load.yaml
```

Or run all tests inside the folder:

```bash
maestro test maestro/
```

> ℹ️ **Note:**  
> For the `test_offline_mode.yaml` to work properly, make sure to **enable Airplane Mode** on your **Mac or Simulator** to simulate loss of internet connection.

---

## 📲 Requirements

- Xcode 16+
- iOS 16+

---

## 📐 Design System

Located in `Shared/DesignSystem`, the app includes:

- **Atoms** (e.g., `CachedImageView`)
- **Molecules** (e.g., `AlbumRowView`)
- Custom reusable components with consistent layout and behavior
- **Color and Typography systems** that follow a centralized branding strategy
- Supports easy updates to match brand identity

> Currently following the **Teya** brand guidelines, using the **Figtree** typeface and a defined palette for primary, secondary, ...

---

## 👨‍💻 Author

Developed by [Savyo Brenner](https://github.com/savyobrenner)
