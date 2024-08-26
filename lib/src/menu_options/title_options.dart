import 'package:flutter/material.dart';
import 'package:gbc_components/src/utils/colors.dart';


class TitleOptionsWidget extends StatelessWidget {
  final String label;
  final IconData icon;
  const TitleOptionsWidget({super.key, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Icon(icon, color: AppDefaultColor.ti02Color, size: 20),
          const SizedBox(width: 10),
          Text(
            label,
            maxLines: 1,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              fontWeight: FontWeight.w500,
              color: AppDefaultColor.ti01Color,
              fontSize: AppDefaultFontSize.bodyMedium
            )
          )
        ]
      ),
    );
  }
}