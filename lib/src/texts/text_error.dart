import 'package:flutter/material.dart';
import 'package:gbc_components/src/utils/colors.dart';
import 'package:gbc_components/src/utils/enums.dart';
import 'package:gbc_components/src/inputs/theme/input_utils.dart';

class TextErrorMessageWidget extends StatelessWidget {
  final StatusTextField statusTextField;
  const TextErrorMessageWidget({super.key, required this.statusTextField});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, top: 5),
      child: SizedBox(
        width: double.infinity,
        child: Text(InputUtils.getTextMessageError(statusTextField),
          textAlign: TextAlign.start,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: AppDefaultColor.erroColor
          )
        ),
      )
    );
  }
}