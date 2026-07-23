# ☕ DamasCoffee — A Flutter Coffee Ordering App

A feature-based Flutter application for browsing and ordering coffee and coffee beans, combining a hand-crafted UI with a Bloc-driven, layered architecture on the home feature.

---

## Overview

DamasCoffee simulates the core experience of a modern coffee shop app: a user moves through onboarding, logs in, browses a coffee and coffee-bean menu, opens product detail pages, manages a shopping cart with live quantity and price updates, and explores a loyalty/coupon section — all within a custom-themed, coffee-shop-inspired interface built entirely with native Flutter widgets.

The project started as a `setState`-driven mini project and is now in the middle of an architectural migration: the **home feature** has been refactored into a proper data → domain → presentation layering with `flutter_bloc`, while the rest of the app (auth, cart, checkout, profile, coupons) still relies on `StatefulWidget` / `setState`. That mix is intentional and visible in the code — it reflects a real, incremental refactor rather than a finished, uniform codebase.

---

## Features

**Onboarding**
- Three-step splash/onboarding flow that routes into the login screen

**Authentication**
- Login and registration screens with form validation (`Form` + `GlobalKey<FormState>`, inline validators for required fields, email format, password length, and password confirmation matching)
- International phone number input using the `country_picker` package

**Home & Product Browsing**
- Home data (banners, coffee list, bean list, filter labels) is fetched through a `HomeBloc`, which calls dedicated use cases (`GetBannersUseCase`, `GetBeansUseCase`, `GetCoffeesUseCase`) backed by a `HomeRepository` / `HomeRepositoryImpl`
- A `RequestStatus` enum (`initial`, `loading`, `success`, `failure`, `empty`) drives the UI state
- While data is loading, a dedicated **skeleton/wireframe screen** (`HomeWireframe`) is shown instead of the real content, with each section (header, search bar, banner, coffee list, bean list, bottom nav) rendering its own placeholder
- On failure, a simple error message sourced from a centralized `ErrorMessages` constants file is shown
- Header with a loyalty points badge, search bar, and category filter chips (UI only — see Current Limitations)
- Horizontally scrollable promo banner carousel
- Horizontally scrollable coffee and coffee-bean lists, each card showing image, name, roast level, rating, and price
- Bottom navigation between Home, Cart, Profile, and Coupons is also driven through the `HomeBloc` (`ChangeBottomNavEvent`), not local widget state

**Product Details**
- Separate detail screens for coffee drinks and coffee beans, opened via named routes that pass the selected product as route arguments
- Favorite toggle and a size/weight selector
- "Add to Cart" confirmation feedback via an animated snackbar

**Shopping Cart**
- Cart screen listing items from a static in-memory data source (`CartData`), rendered as `CartCard` widgets
- Each cart card manages its own quantity state; incrementing or decrementing recalculates that item's subtotal and the cart's grand total in real time using `fold`

**Checkout**
- Payment method selection screen (Wallet, iPhone/Apple Pay-style options, Google Pay) with a styled card preview, sourced from static data

**Loyalty & Coupons**
- Loyalty card UI showing a points balance and a QR-scan entry point
- List of discount coupons rendered from static coupon data

**Profile**
- Profile screen with avatar, account details, and a list of account options (Edit Profile, My Address, My Orders, Wishlist, Notifications, Change Password) sourced from static data

**Internationalization (scaffolded)**
- Flutter `gen-l10n` localization files exist for English and Arabic (`app_en.arb`, `app_ar.arb`, generated `AppLocalizations` classes), but they are not yet wired into `MaterialApp` — the app currently runs with an empty `localizationsDelegates` list

**Design System**
- A single `AppColors` source of truth driving a consistent color palette across the app

---



## Tech Stack

| Category | Technology |
|---|---|
| Language | Dart |
| Framework | Flutter |
| State Management | `flutter_bloc` (home feature) + native `StatefulWidget` / `setState` (auth, cart, checkout, profile, coupons) |
| Navigation | Flutter's built-in named-route `Navigator` |
| Localization | `flutter_localizations`, `intl`, Flutter `gen-l10n` (scaffolded, not yet active) |
| Third-Party Packages | `flutter_bloc`, `country_picker` |
| UI | Custom widgets — no UI component libraries |

*(This repository contains the `lib/` source only, so exact package versions aren't listed here — see `pubspec.yaml` in the full project for pinned versions.)*

---

## Architecture

The app is organized as a **feature-based structure**, with the **home feature** additionally split into clear layers:

- **`data/`** — static datasets/models (`CoffeeProduct`, `BeanProduct`, `PromoBannerData`, etc.) and, for `home`, a `HomeRepository` interface with a `HomeRepositoryImpl` implementation that currently serves the static datasets asynchronously
- **`domain/`** *(home feature only)* — use cases (`GetBannersUseCase`, `GetBeansUseCase`, `GetCoffeesUseCase`) that sit between the Bloc and the repository, each exposing a single `call()` method
- **`presentation/`**
  - `logic/bloc/` *(home only)* — `HomeBloc`, `HomeEvent`, `HomeState` implementing the Bloc pattern
  - `screens/` — full-page widgets
  - `widgets/` — smaller, reusable UI pieces scoped to that feature
  - `wireframe/` *(home only)* — skeleton-loading widgets mirroring the real home layout, shown while `HomeBloc` is in a loading state

Other features (`auth`, `cart`, `checkout`, `cobon`, `profile`) still follow a simpler `data/` + `presentation/` split without a domain layer or Bloc, using `setState` for local UI state.

Shared, app-wide concerns — routing, color tokens, error message constants, and the `RequestStatus` enum — live in `lib/core/`, so they can be reused across features without duplication.

This is not a full Clean Architecture implementation across the whole app; it's best described as a project mid-refactor, where one feature (`home`) demonstrates the intended target pattern (data/domain/presentation + Bloc) and the rest hasn't been migrated yet.

---

## Project Structure

```
lib/
├── main.dart                          # App entry point
├── app.dart                           # MaterialApp setup, BlocProvider wiring, routes, locale config
│
├── core/
│   ├── routing/
│   │   └── app_routes.dart            # Centralized named routes
│   ├── theme/color/
│   │   └── app_colors.dart            # App-wide color tokens
│   ├── enums/
│   │   └── request_status.dart        # RequestStatus (initial/loading/success/failure/empty)
│   ├── constants/
│   │   └── error_messages.dart        # Centralized user-facing error strings
│   ├── validators/
│   │   └── app_validators.dart        # Reserved for shared form validators (currently empty)
│   └── widgets/
│       └── app_bottom_nav_bar.dart    # Shared bottom navigation bar
│
├── Localization/
│   └── l10n/                          # Generated EN/AR localization files (not yet wired in)
│
└── features/
    ├── spalsh/                        # Onboarding (3-slide splash flow)
    │   └── presentation/screens/
    │
    ├── auth/
    │   └── presentation/
    │       ├── login/
    │       └── register/
    │
    ├── home/
    │   ├── data/
    │   │   ├── banner_data.dart, beans_data.dart, coffee_data.dart, filters_data.dart, label_data.dart
    │   │   └── repositories/          # HomeRepository (interface) + HomeRepositoryImpl
    │   ├── domain/
    │   │   └── usecases/              # GetBannersUseCase, GetBeansUseCase, GetCoffeesUseCase
    │   └── presentation/
    │       ├── logic/bloc/            # HomeBloc, HomeEvent, HomeState
    │       ├── screens/               # main_screen, coffee/beans details
    │       ├── widgets/               # header, searchbox, filter, coffeecard, beancard, promobanner, body
    │       └── wireframe/             # Skeleton-loading placeholder widgets
    │
    ├── cart/
    │   ├── data/                      # cart_data.dart (CartItemModel)
    │   └── presentation/
    │       ├── screens/cart_screen.dart
    │       └── widgets/cart_card.dart, cart_header_icon.dart
    │
    ├── checkout/
    │   ├── data/checkout_data.dart    # Payment method options
    │   └── presentation/screens/checkout_screen.dart
    │
    ├── cobon/                         # Coupons & loyalty
    │   ├── data/coupon_data.dart
    │   └── presentation/
    │       ├── screens/coupon_screen.dart
    │       └── widgets/               # coupon_card, custom_card, header, section_label
    │
    └── profile/
        ├── data/profile_data.dart
        └── presentation/screens/profile_screen.dart
```

---

## State Management

The **home feature** is the part of the app that uses `flutter_bloc`:

- **Events** — `LoadHomeEvent` (fired once on app start, via `App`'s `BlocProvider`) and `ChangeBottomNavEvent(index)` (fired when the user taps a bottom nav item)
- **State** — a single immutable `HomeState` holding `status`, `bottomNavStatus`, `banners`, `beans`, `coffees`, `labels`, `currentIndex`, and an optional `errorMessage`, updated via `copyWith`
- **Business logic separation** — `HomeBloc` doesn't touch the data layer directly; it calls the three use cases, which in turn call `HomeRepository`. This keeps the Bloc focused on orchestrating loading/success/failure state rather than knowing where the data comes from
- **UI rebuilding flow** — `MainScreen` wraps its body in a `BlocBuilder<HomeBloc, HomeState>`. Depending on `state.status`, it renders the `HomeWireframe` (loading), an error message (failure), or the actual page for `state.currentIndex` (success). The bottom navigation bar reads `state.currentIndex` and dispatches `ChangeBottomNavEvent` on tap instead of managing an index locally
- Note: `_onLoadHome` in `HomeBloc` currently adds an artificial `Future.delayed(Duration(seconds: 5))` before fetching data — useful for demonstrating the loading/wireframe state during development

All other features (auth, cart, checkout, profile, coupons) manage their own local UI state with `setState` inside `StatefulWidget`s — for example, `CartCard` owns its quantity state and recalculates totals locally with `fold`.

---

## Installation

### Prerequisites
- [Flutter SDK](https://docs.flutter.dev/get-started/install) installed and configured
- A connected device, emulator, or simulator

### Steps

```bash
# Clone the repository
git clone https://github.com/<your-username>/<repo-name>.git
cd <repo-name>

# Install dependencies
flutter pub get

# Run the app
flutter run
```

> **Note:** This repository contains the `lib/` source directory. To run the project locally, place it inside a standard Flutter project (with a valid `pubspec.yaml` declaring `flutter_bloc`, `country_picker`, `flutter_localizations`, and the project's image assets under `assets/images/`) generated via `flutter create`.

---

## Development Notes

- Centralized `AppColors`, `AppRoutes`, and `ErrorMessages` keep styling, navigation, and user-facing error text in one place instead of scattered across screens
- Text editing controllers in `StatefulWidget`s (e.g. login/register) are properly disposed in `dispose()`
- The home feature's loading state is handled with a dedicated skeleton UI (`HomeWireframe` and its per-section wireframe widgets) rather than a single generic spinner, so the layout doesn't jump once real content arrives
- Cart quantity management is a genuinely interactive feature backed by correct recalculation logic (`fold` over cart items for `price × quantity`), not just static UI
- The `RequestStatus` enum and `HomeState.copyWith` pattern show a deliberate attempt at predictable, immutable state updates for the migrated feature

---

## Current Limitations

- **Search bar and filter chips** on the home screen are interactive in the UI but do not yet filter the displayed product lists
- **Checkout total** is currently static rather than calculated from the live cart
- **Authentication** is client-side form validation only — there is no backend or persistence layer
- **Profile actions** (account options, logout) are present in the UI but not yet wired to functionality
- **Localization** files are generated but not yet connected to `MaterialApp`'s `localizationsDelegates`
- **`app_validators.dart`** exists as a placeholder for shared validators but is currently empty — validation logic still lives inline in the login/register screens
- Only the `home` feature has been migrated to the Bloc + domain/repository pattern; the rest of the app still uses `setState`

---

## Future Improvements

- Wire the search bar and filter chips into actual list filtering logic
- Connect the cart total to the checkout screen for an accurate, dynamic payment summary
- Introduce a backend (e.g. Firebase or a REST API) for real authentication, persistent cart state, and order history
- Activate the existing `gen-l10n` localization setup for full English/Arabic support
- Continue the migration of `auth`, `cart`, `checkout`, `cobon`, and `profile` from `setState` to the Bloc + domain/repository pattern already used in `home`
- Move shared form validation logic into `app_validators.dart` instead of keeping it inline per screen
- Implement the "My Orders," "Wishlist," and "Notifications" profile destinations

---

## Author

Built as a hands-on mini project to practice feature-based Flutter architecture, an incremental migration to `flutter_bloc`, and end-to-end mobile UI development — from onboarding through checkout.
