

import 'package:flutter/material.dart';

import '../styles.dart';

class ValueInput extends StatelessWidget {
  const ValueInput({this.onChanged});
  final InputCallback onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
        style: AppStyle.inputStyle,
        onChanged: onChanged,
    );
  }
}

typedef InputCallback = void Function(String input);
