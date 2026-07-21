import 'package:flutter/material.dart';
import 'package:tamkeen_mini_project/features/profile/presentation/widgets/profile_card.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 12, 20, 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Profile',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.w700,
                  letterSpacing: -0.5,
                  fontFamily: 'Inter',
                ),
              ),
              const SizedBox(height: 2),
              Text(
                'Manage your account',
                style: TextStyle(
                  color: Colors.white.withOpacity(0.45),
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Inter',
                ),
              ),
            ],
          ),
          ProfileHeaderIconButton(
            icon: Icons.settings_outlined,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
