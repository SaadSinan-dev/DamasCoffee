import 'package:flutter/widgets.dart';
import 'package:tamkeen_mini_project/Localization/l10n/app_localizations.dart';

List<String> getFilters(BuildContext context) {
  final l10n = AppLocalizations.of(context)!;

  return [
    l10n.all,
    l10n.cappuccino,
    l10n.espresso,
    l10n.americano,
    l10n.macchiato,
  ];
}
