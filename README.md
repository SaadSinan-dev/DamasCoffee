# ☕ DamasCoffee— A Flutter Coffee Ordering App

A clean, feature-based Flutter application for browsing and ordering coffee and coffee beans, built with a scalable project architecture and a fully custom, hand-crafted UI.

This project was built as a hands-on mini project to apply core Flutter concepts — navigation, state management with `setState`, reusable widget composition, and a maintainable feature-based folder structure — in the context of a real, end-to-end mobile shopping flow.

---

## Overview

Brew simulates the experience of a modern coffee shop app: users move through an onboarding flow, authenticate, browse a curated coffee and coffee-bean menu, view rich product detail pages, manage a shopping cart with live price calculation, and explore a loyalty coupon system — all wrapped in a warm, custom-themed interface built entirely with native Flutter widgets.

The project intentionally avoids unnecessary third-party state management libraries, demonstrating that a well-organized `StatefulWidget` / `setState` approach, combined with a disciplined folder structure, is enough to keep a multi-screen app readable and maintainable.

---

## Key Features

**Onboarding**
- Three-step animated splash/onboarding flow introducing the app before routing into authentication

**Authentication**
- Login and registration screens with form validation (required fields, email format check, password length, password confirmation matching)
- International phone number input with an integrated country code picker

**Home & Product Browsing**
- Custom header with a loyalty points badge
- Search bar and category filter chips (Cappuccino, Espresso, Americano, Macchiato)
- Horizontally scrollable promotional banner carousel
- Horizontally scrollable coffee and coffee-bean product lists, each card showing image, name, roast level, rating, and price

**Product Details**
- Dedicated detail screens for both coffee drinks and coffee beans
- Hero image header with a blurred glass-style info card (name, origin, rating, roast level)
- Favorite toggle and a size/weight selector
- "Add to Cart" confirmation feedback via an animated snackbar

**Shopping Cart**
- Cart screen listing all added items with image, roast level, and size
- **Live quantity adjustment** (increment/decrement) with **real-time per-item and total price recalculation**
- Dynamic total computed by folding over cart items (`price × quantity`)

**Checkout**
- Payment method selection screen (Credit Card, Wallet, Apple Pay, Google Pay) with a styled card preview

**Loyalty & Coupons**
- Customer loyalty card showing collected "beans" points and a QR scan entry point
- List of available discount coupons with percentage badges

**Profile**
- User profile screen with avatar, account details, a list of account options (Edit Profile, My Address, My Orders, Wishlist, Notifications, Change Password), and a logout action

**Internationalization (scaffolded)**
- Flutter `gen-l10n` localization files generated for English and Arabic, ready to be wired into the app for full bilingual support

**Custom Design System**
- A single `AppColors` source of truth driving a consistent warm coffee-shop palette across every screen

---

## Tech Stack

| Category | Technology |
|---|---|
| Framework | Flutter (Dart) |
| State Management | Native `StatefulWidget` / `setState` |
| Navigation | Flutter's built-in named-route `Navigator` |
| Localization | `flutter_localizations`, `intl`, Flutter `gen-l10n` |
| Third-Party Packages | `country_picker` |
| UI | 100% custom widgets — no UI component libraries |

---

## Project Architecture

The project follows a **feature-based architecture**, where each business capability lives in its own self-contained module under `lib/features/`. Every feature is internally split into:

- **`data/`** — plain Dart model classes and static datasets (e.g. `CoffeeProduct`, `CartItemModel`)
- **`presentation/screens/`** — full-page widgets users navigate to
- **`presentation/widgets/`** — smaller, reusable UI pieces scoped to that feature

This keeps each feature independent and easy to extend without creating tangled cross-feature dependencies, and it mirrors patterns commonly used in production Flutter codebases — even though this project, at its current stage, doesn't yet introduce a separate domain layer or networking/repository layer.

Shared, app-wide concerns (routing and color tokens) are isolated in `lib/core/`, so they can be reused by every feature without duplication.

---

## Code Structure

```
lib/
├── main.dart                          # App entry point
├── app.dart                           # MaterialApp setup, routes, locale config
│
├── core/
│   ├── routing/
│   │   └── app_routes.dart            # Centralized named routes
│   └── color/
│       └── app_colors.dart            # App-wide color tokens
│
├── Localization/
│   └── l10n/                          # Generated EN/AR localization files
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
    │   ├── data/                      # coffee_data, beans_data, filters_data
    │   └── presentation/
    │       ├── screens/                # main_screen, coffee/beans details
    │       └── widgets/                # header, searchbox, filter, coffecard, beancard, promobanner, body
    │
    ├── cart/
    │   ├── data/                       # cart_data.dart (CartItemModel)
    │   └── presentation/
    │       ├── screens/cart_screen.dart
    │       └── widgets/cart_card.dart
    │
    ├── checkout/
    │   ├── data/checkout_data.dart     # Payment method options
    │   └── presentation/screens/checkout_screen.dart
    │
    ├── cobon/                          # Coupons & loyalty
    │   ├── data/coupon_data.dart
    │   └── presentation/
    │       ├── screens/coupon_screen.dart
    │       └── widgets/                # coupon_card, custom_card, header, section_label
    │
    └── profile/
        ├── data/profile_data.dart
        └── presentation/screens/profile_screen.dart
```

---

## How It Works

1. **App launch** — `main.dart` boots the app via `App` (`app.dart`), which configures `MaterialApp` with named routes and sets the initial route to the first splash slide.
2. **Onboarding** — the user is guided through three splash screens, each pushing a replacement route to the next, ending at the login screen.
3. **Authentication** — `LoginScreen` and `RegisterScreen` use a `Form` + `GlobalKey<FormState>` to validate input client-side. On successful validation, the user is routed to `MainScreen`.
4. **Main shell** — `MainScreen` holds a `BottomNavigationBar` and swaps between four pages (`HomeBody`, `CartScreen`, `ProfileScreen`, `CouponScreen`) by updating a local `currentIndex` state — no route stack changes, just instant tab switching.
5. **Browsing** — `HomeBody` composes the header, search bar, filter chips, promo banner, and two horizontally scrollable product lists (`BeansList`, `CoffeeList`), both rendered from static, strongly-typed data models.
6. **Product detail** — tapping a coffee or bean card pushes a named route (`coffeedetails` / `beansdetails`) carrying the selected product as route arguments, which the destination screen reads via `ModalRoute.of(context)!.settings.arguments`.
7. **Cart** — `CartScreen` reads from `CartData.items` (a static in-memory list) and renders each as a `CartCard`. Each card owns its own quantity state; incrementing or decrementing immediately recalculates that item's subtotal and the cart's grand total using `fold`.
8. **Checkout** — `CheckoutScreen` presents a styled card preview and a list of payment method options sourced from `checkout_data.dart`.
9. **Coupons & loyalty** — `CouponScreen` displays a customer loyalty card (points balance) followed by a list of coupon cards rendered from `CouponData.coupons`.
10. **Profile** — `ProfileScreen` renders static account information and a list of navigable account options.

---

## Installation & Setup

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

> **Note:** This repository contains the `lib/` source directory. To run the project locally, place it inside a standard Flutter project (with a valid `pubspec.yaml` declaring `country_picker`, `flutter_localizations`, and the project's image assets under `assets/images/`) generated via `flutter create`.

---

## Screenshots

> Screenshots coming soon.

| Onboarding | Home | Product Details |
|---|---|---|
| *placeholder* | *placeholder* | *placeholder* |

| Cart | Checkout | Coupons |
|---|---|---|
| *placeholder* | *placeholder* | *placeholder* |

---

## Current Limitations

In the interest of transparency, this is the current, honest state of a few screens:

- **Search bar and filter chips** are interactive in the UI but do not yet filter the displayed product lists.
- **Checkout total** is currently a static placeholder value rather than calculated from the live cart.
- **Authentication** is client-side form validation only — there is no backend or persistence layer yet.
- **Profile actions** (account options, logout) are present in the UI but not yet wired to functionality.

These are natural, well-scoped next steps rather than architectural gaps — the underlying structure already supports adding them cleanly.

---

## Future Improvements

- Wire the search bar and filter chips into actual list filtering logic
- Connect the cart total to the checkout screen for an accurate, dynamic payment summary
- Introduce a backend (e.g. Firebase) for real authentication, persistent cart state, and order history
- Activate the existing `gen-l10n` localization setup to ship full English/Arabic bilingual support
- Migrate state management from `setState` to a more scalable solution (e.g. `Provider`, `Riverpod`, or `BLoC`) as the app grows
- Implement the "My Orders," "Wishlist," and "Notifications" profile destinations

---

## Why This Project Matters

This project demonstrates the ability to take a multi-screen mobile application from onboarding through checkout using a deliberate, scalable folder structure — not a single-file prototype. Every screen reflects attention to detail: consistent theming through a centralized color system, properly disposed controllers, validated forms, and at least one genuinely interactive feature (cart quantity management) backed by correct, real-time calculation logic.

It reflects a developer who organizes code the way production teams expect, writes UI that doesn't cut corners on detail, and is honest about what's finished versus what's next — a combination that matters as much as raw feature count when evaluating engineering maturity.
