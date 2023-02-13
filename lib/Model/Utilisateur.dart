import 'package:projectepsi/Global/library.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Utilisateur {
  //attributs
  late String id;
  late String mail;
  late String nom;
  late String prenom;
  late DateTime birthday;
  String? avatar;
  Genre? sexe;


  int get age {
    DateTime now = DateTime.now();
    int durer = now.difference(birthday).inDays;
    var annee = durer/365;
    return annee.toInt();
}

 String get nomComplet {
    return prenom + " " +nom;
}




  //constructeur

  Utilisateur(DocumentSnapshot snapshot){
    id = snapshot.id;
    Map<String,dynamic> map = snapshot.data() as Map<String,dynamic>;
    mail = map["MAIL"];
    nom = map["NOM"];
    prenom = map["PRENOM"];
    Timestamp timestamp = map["BIRTHDAY"];
    birthday = timestamp.toDate();
    String? provisoire = map["AVATAR"];
    if(provisoire == null){
      avatar = defautImage;
    }
    else
      {
        avatar = provisoire;
      }

}

Utilisateur.empty(){
  id="";
  String mail="";
  nom="";
  prenom="";
  birthday= DateTime.now();
  avatar = defautImage;
  sexe = Genre.nonBinaire;
}


  //méthode

  Genre? getGenre(String genre){
    switch(genre){
      case "Femme" : return Genre.femme;
      case "Homme" : return Genre.homme;
      case "Non binaire" : return Genre.nonBinaire;
      default : break;

    }
  }
}