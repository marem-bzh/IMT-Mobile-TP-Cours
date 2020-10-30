import 'package:convertisseur_devises/models/devise.dart';
import 'package:convertisseur_devises/widgets/liste_devises.dart';
import 'package:convertisseur_devises/widgets/saisie_nombre.dart';
import 'package:flutter/material.dart';

import '../styles.dart';

class ConvertisseurDevisePage extends StatefulWidget {
  ConvertisseurDevisePage();

  @override
  State<StatefulWidget> createState() {
    return _ConvertisseurDevisePage();
  }
}

class _ConvertisseurDevisePage extends State<ConvertisseurDevisePage> {
  // les différents "états" de la page
  double _valeur; // valeur saisie
  Devise _deviseInitial; // devise initiale sélectionnée
  Devise _deviseFinale; // devise finale sélectionnée
  double _resultat; // le résultat de la conversion

  // définition des valeurs initiales
  @override
  void initState() {
    super.initState();
    _valeur = 0;
    _resultat = 0;
    _deviseInitial = Devise.EURO;
    _deviseFinale = Devise.DOLLAR;
  }

  void onValueChanged(String saisie) {
    var value = double.parse(saisie);
    setState(() {
      _valeur = value;
    });
  }

  void onDeviseInitialeChanged(Devise devise) {
    setState(() {
      _deviseInitial = devise;
    });
  }

  void onDeviseFinaleChanged(Devise devise) {
    setState(() {
      _deviseFinale = devise;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
        Spacer(),
        Text(
        'Valeur',
        style: AppStyle.labelStyle,
        ),
        Spacer(),
        ValueInput(onChanged: onValueChanged),
        Spacer(),
        Text(
        'De',
        style: AppStyle.labelStyle,
        ),
        Spacer(),
        DevisesList(onChanged: onDeviseInitialeChanged, value: _deviseInitial),
        Spacer(),
        Text('Vers', style: AppStyle.labelStyle),
        Spacer(),
        DevisesList(onChanged: onDeviseFinaleChanged, value: _deviseFinale),
        Spacer(
          flex: 2,
        ),
        ElevatedButton(
            onPressed: () => setState(() => _resultat = (_valeur / taux[_deviseInitial] * taux[_deviseFinale])),
            child: Text('Convertir'),
        ),
        Spacer(
          flex: 2,
        ),
        Text(_resultat.toString(), style: AppStyle.labelStyle),
        Spacer(),
        ],
      )
    );
  }
}
