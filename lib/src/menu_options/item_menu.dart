import 'package:flutter/material.dart';
import 'package:gbc_components/src/menu_options/title_options.dart';
import 'package:gbc_components/src/utils/colors.dart';

class ItemMenuWidget extends StatelessWidget {
  final VoidCallback? onTap;
  final String label;
  final IconData icon;
  final Widget? itemWidget;
  const ItemMenuWidget({super.key, this.itemWidget, required this.icon, required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return MenuItemButton(
      style: ButtonStyle(
        shape: const WidgetStatePropertyAll<OutlinedBorder>( RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(5)),
        )),
        foregroundColor: WidgetStatePropertyAll<Color>(AppDefaultColor.scaffoldBackgroundColor),
        overlayColor: WidgetStatePropertyAll<Color>(AppDefaultColor.scaffoldBackgroundColor),
        padding: const WidgetStatePropertyAll<EdgeInsets>(
          EdgeInsets.all(10)
        )
      ),
      onPressed: onTap,
      child: itemWidget ?? TitleOptionsWidget(icon: icon, label: label)
    );
  }
}