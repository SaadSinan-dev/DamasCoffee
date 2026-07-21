import 'package:flutter/material.dart';
import 'package:tamkeen_mini_project/core/theme/color/app_colors.dart';
import 'package:tamkeen_mini_project/features/profile/data/profile_data.dart';
import 'package:tamkeen_mini_project/features/profile/presentation/widgets/profile_card.dart';

class ProfileOptionsList extends StatelessWidget {
  const ProfileOptionsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: List.generate(options.length, (index) {
          final option = options[index];
          return Padding(
            padding: EdgeInsets.only(
              bottom: index == options.length - 1 ? 0 : 12,
            ),
            child: ProfileOptionItem(option: option),
          );
        }),
      ),
    );
  }
}

class ProfileOptionItem extends StatelessWidget {
  final Map<String, dynamic> option;

  const ProfileOptionItem({super.key, required this.option});

  @override
  Widget build(BuildContext context) {
    final String label = option['label'] ?? '';
    final String? subtitle = option['subtitle'] as String?;
    final IconData icon = option['icon'] ?? Icons.chevron_right;

    return Pressable(
      onTap: () {},
      borderRadius: 22,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(22),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(22),
            color: Colors.white.withOpacity(0.05),
            border: Border.all(color: Colors.white.withOpacity(0.08)),
          ),
          child: Row(
            children: [
              OptionIconBadge(icon: icon),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      label,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14.5,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Inter',
                      ),
                    ),
                    if (subtitle != null) ...[
                      const SizedBox(height: 3),
                      Text(
                        subtitle,
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.42),
                          fontSize: 12,
                          fontFamily: 'Inter',
                        ),
                      ),
                    ],
                  ],
                ),
              ),
              Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withOpacity(0.05),
                ),
                child: const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white38,
                  size: 12,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OptionIconBadge extends StatelessWidget {
  final IconData icon;
  const OptionIconBadge({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 42,
      height: 42,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.textPrimary.withOpacity(0.9),
            AppColors.textPrimary.withOpacity(0.4),
          ],
        ),
      ),
      child: Icon(icon, color: Colors.white, size: 20),
    );
  }
}

class LogoutButton extends StatelessWidget {
  const LogoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Pressable(
        onTap: () {},
        borderRadius: 22,
        child: Container(
          width: double.infinity,
          height: 54,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(22),
            color: Colors.red.withOpacity(0.08),
            border: Border.all(color: Colors.redAccent.withOpacity(0.35)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.logout_rounded,
                  color: Colors.redAccent.shade100, size: 18),
              const SizedBox(width: 10),
              Text(
                'Logout',
                style: TextStyle(
                  color: Colors.redAccent.shade100,
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Inter',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
