import 'package:flutter/material.dart';

class TitleInput extends StatelessWidget {
  final String label;
  final bool isRed;
  const TitleInput({super.key, required this.label, this.isRed=false});

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      maxLines: 1,
      style: Theme.of(context).textTheme.bodySmall?.copyWith(
        fontWeight: FontWeight.w600,
      )
    );
  }
}