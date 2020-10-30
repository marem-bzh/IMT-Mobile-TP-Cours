

import 'package:convertisseur_devises/models/devise.dart';
import 'package:flutter/material.dart';

import '../styles.dart';

class DevisesList extends StatelessWidget {
  const DevisesList({this.onChanged, this.value});

  final InputCallback onChanged;
  final Devise value;

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
        value: value,
        isExpanded: true,
        onChanged: onChanged,
        items: [
          DropdownMenuItem<Devise>(
            value: Devise.EURO,
            child: Text(Devise.EURO.libelle),
          ),
          DropdownMenuItem<Devise>(
            value: Devise.DOLLAR,
            child: Text(Devise.DOLLAR.libelle),
          ),
          DropdownMenuItem<Devise>(
            value: Devise.LIVRE_STERLING,
            child: Text(Devise.LIVRE_STERLING.libelle),
          ),
        ]
    );
  }
}

typedef InputCallback = void Function(Devise input);
