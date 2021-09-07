import 'package:flutter/material.dart';
import 'package:mvvm_app/core/extension/context_extension.dart';

class OnBoardCircleAvatar extends StatelessWidget {
  const OnBoardCircleAvatar({Key? key, required this.isSelected})
      : super(key: key);
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: context.paddingLow,
        child: CircleAvatar(
          backgroundColor:
              context.colors.onBackground.withOpacity(isSelected ? 1 : 0.2),
          radius: isSelected ? 8 : 5,
        ));
  }
}
