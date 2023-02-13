import 'package:projectepsi/Model/Utilisateur.dart';

enum Genre {homme,femme,nonBinaire;

  String toTitle(){
    switch (this){
      case Genre.femme : return "Femme";
      case Genre.homme  : return "Homme";
      case Genre.nonBinaire : return "Non binaire";
    }
  }

}

late Utilisateur myUtilisateur = Utilisateur.empty();

String defautImage = "https://firebasestorage.googleapis.com/v0/b/epsib3cda-5a7f1.appspot.com/o/profil_design.png";