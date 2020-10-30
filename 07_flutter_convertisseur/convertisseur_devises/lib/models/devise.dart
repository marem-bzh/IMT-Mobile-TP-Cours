enum Devise {
  EURO,
  DOLLAR,
  LIVRE_STERLING
}

// Taux de change
// Les poids notés sont fonctions de l'euro. €1 = $1.16729  = £0.902684
Map<Devise, double> taux = {
  Devise.EURO: 1,
  Devise.DOLLAR: 1.16729,
  Devise.LIVRE_STERLING: 0.902684
};

// Libellés utilisés lors de l'affichage
Map<Devise, String> libelles = {
  Devise.EURO: "Euro",
  Devise.DOLLAR: "Dollar",
  Devise.LIVRE_STERLING: "Livre Sterling"
};

// Permet de disposer d'une propriété "libelle pour l'énum Devise
// ex: Devise.EURO.libelle
extension DeviseExtension on Devise {
  String get libelle {
    return libelles[this];
  }
}

