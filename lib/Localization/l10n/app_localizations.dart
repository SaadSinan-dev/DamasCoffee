import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en')
  ];

  /// No description provided for @profile.
  ///
  /// In en, this message translates to:
  /// **'Best Coffee For You'**
  String get profile;

  /// No description provided for @search.
  ///
  /// In en, this message translates to:
  /// **'Find Your Coffee...'**
  String get search;

  /// No description provided for @all.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get all;

  /// No description provided for @cappuccino.
  ///
  /// In en, this message translates to:
  /// **'Cappuccino'**
  String get cappuccino;

  /// No description provided for @espresso.
  ///
  /// In en, this message translates to:
  /// **'Espresso'**
  String get espresso;

  /// No description provided for @americano.
  ///
  /// In en, this message translates to:
  /// **'Americano'**
  String get americano;

  /// No description provided for @macchiato.
  ///
  /// In en, this message translates to:
  /// **'Macchiato'**
  String get macchiato;

  /// No description provided for @latte.
  ///
  /// In en, this message translates to:
  /// **'Latte'**
  String get latte;

  /// No description provided for @buy2Get1Free.
  ///
  /// In en, this message translates to:
  /// **'Buy 2\nGet 1\nFree'**
  String get buy2Get1Free;

  /// No description provided for @coffeeBeans.
  ///
  /// In en, this message translates to:
  /// **'Coffee Beans'**
  String get coffeeBeans;

  /// No description provided for @robustaBeans.
  ///
  /// In en, this message translates to:
  /// **'Robusta Beans'**
  String get robustaBeans;

  /// No description provided for @arabicaBeans.
  ///
  /// In en, this message translates to:
  /// **'Arabica Beans'**
  String get arabicaBeans;

  /// No description provided for @libericaBeans.
  ///
  /// In en, this message translates to:
  /// **'Liberica Beans'**
  String get libericaBeans;

  /// No description provided for @mediumRoasted.
  ///
  /// In en, this message translates to:
  /// **'Medium Roasted'**
  String get mediumRoasted;

  /// No description provided for @lightRoasted.
  ///
  /// In en, this message translates to:
  /// **'Light Roasted'**
  String get lightRoasted;

  /// No description provided for @darkRoasted.
  ///
  /// In en, this message translates to:
  /// **'Dark Roasted'**
  String get darkRoasted;

  /// No description provided for @italy.
  ///
  /// In en, this message translates to:
  /// **'Italy'**
  String get italy;

  /// No description provided for @france.
  ///
  /// In en, this message translates to:
  /// **'France'**
  String get france;

  /// No description provided for @fromAsia.
  ///
  /// In en, this message translates to:
  /// **'From Asia'**
  String get fromAsia;

  /// No description provided for @fromAfrica.
  ///
  /// In en, this message translates to:
  /// **'From Africa'**
  String get fromAfrica;

  /// No description provided for @fromMiddleEast.
  ///
  /// In en, this message translates to:
  /// **'From Middle East'**
  String get fromMiddleEast;

  /// No description provided for @cappuccinoDescription.
  ///
  /// In en, this message translates to:
  /// **'A classic Italian coffee drink made with equal parts espresso, steamed milk, and milk foam. Rich and creamy with a bold espresso base, perfect for a morning boost.'**
  String get cappuccinoDescription;

  /// No description provided for @latteDescription.
  ///
  /// In en, this message translates to:
  /// **'A smooth and mild coffee drink made with espresso and a generous amount of steamed milk. Its creamy texture and subtle flavor make it a favorite for coffee lovers worldwide.'**
  String get latteDescription;

  /// No description provided for @espressoDescription.
  ///
  /// In en, this message translates to:
  /// **'A concentrated form of coffee brewed by forcing hot water through finely ground coffee beans. Bold, intense, and full-bodied with a rich crema on top.'**
  String get espressoDescription;

  /// No description provided for @americanoDescription.
  ///
  /// In en, this message translates to:
  /// **'A rich espresso diluted with hot water, giving it a similar strength to drip coffee but with a different, more complex flavor. Smooth and less intense than straight espresso.'**
  String get americanoDescription;

  /// No description provided for @macchiatoDescription.
  ///
  /// In en, this message translates to:
  /// **'An espresso shot marked with a small amount of foamed milk. Strong and bold with just a touch of creaminess, offering a balanced coffee experience.'**
  String get macchiatoDescription;

  /// No description provided for @robustaDescription.
  ///
  /// In en, this message translates to:
  /// **'Robusta beans are known for their strong, bold flavor with a slightly bitter taste. Grown at lower altitudes, they contain more caffeine than Arabica and produce a rich crema, making them ideal for espresso blends.'**
  String get robustaDescription;

  /// No description provided for @arabicaDescription.
  ///
  /// In en, this message translates to:
  /// **'Arabica beans are the most popular coffee beans in the world. They offer a smooth, mild flavor with subtle sweetness and fruity notes. Grown at high altitudes, they are prized for their complex aroma and low bitterness.'**
  String get arabicaDescription;

  /// No description provided for @libericaDescription.
  ///
  /// In en, this message translates to:
  /// **'Liberica beans are rare and unique, offering a full-bodied flavor with a distinctive smoky and woody aroma. Their irregular shape and bold taste make them a favorite among coffee enthusiasts looking for something different.'**
  String get libericaDescription;

  /// No description provided for @weight250.
  ///
  /// In en, this message translates to:
  /// **'250 g'**
  String get weight250;

  /// No description provided for @weight500.
  ///
  /// In en, this message translates to:
  /// **'500 g'**
  String get weight500;

  /// No description provided for @weight1000.
  ///
  /// In en, this message translates to:
  /// **'1000 g'**
  String get weight1000;

  /// No description provided for @description.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get description;

  /// No description provided for @size.
  ///
  /// In en, this message translates to:
  /// **'Size'**
  String get size;

  /// No description provided for @price.
  ///
  /// In en, this message translates to:
  /// **'Price'**
  String get price;

  /// No description provided for @addToCart.
  ///
  /// In en, this message translates to:
  /// **'Add to Cart'**
  String get addToCart;

  /// No description provided for @addedToCart.
  ///
  /// In en, this message translates to:
  /// **'Added to Cart!'**
  String get addedToCart;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar': return AppLocalizationsAr();
    case 'en': return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
