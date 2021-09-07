import 'package:flutter/material.dart';

import '../../extension/string_extension.dart';

class AutoLocaleText extends StatelessWidget {
  final String value;
  final TextAlign? textAlign;
  final TextStyle? style;

  const AutoLocaleText(
      {Key? key, required this.value, this.textAlign, this.style})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(
      value.locale,
      textAlign: textAlign,
      style: style,
    );
  }
}
