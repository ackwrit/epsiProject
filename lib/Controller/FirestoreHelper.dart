import 'dart:html';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:projectepsi/Model/Utilisateur.dart';


class FirestoreHelper {
  //Déclaration des atttributs
  final auth =  FirebaseAuth.instance;
  final cloudFirestoreUser = FirebaseFirestore.instance.collection("UTILISATEURS");
  final storageBase = FirebaseStorage.instance;



  //méthode
// création d'un utlisateur

    Future <Utilisateur> inscription({required String mail , required String password , required String nom , required String prenom, required DateTime birthday}) async {
      UserCredential credential = await auth.createUserWithEmailAndPassword(email: mail, password: password);
      String? uid = credential.user?.uid;
      if( uid == null){
        return Future.error((error){
          //Création d'un POP UP
          Text(error.toString());
        });
      }
      Map<String,dynamic> map = {
        "MAIL" : mail,
        "NOM" : nom,
        "PRENOM" : prenom,
        "BIRTHDAY" : birthday,
      };
      addUser(uid!,map);
      return getUtilisateur(uid!);



    }



//Connexion d'un utilisateur
  Future <Utilisateur> connexion(String mail, String password) async {
      UserCredential credential = await auth.signInWithEmailAndPassword(email: mail, password: password);
      String? uid = credential.user?.uid;
      if(uid == null) {
        return Future.error((error){
          Text(error.toString());
        });
      }
      return getUtilisateur(uid!);
  }




//ajout des informations d'un utlisateur

addUser (String uid, Map<String,dynamic> map) {
      cloudFirestoreUser.doc(uid).set(map);
}




//mise à jour des infos d'un utilisateur
  updateUser(String uid , Map<String,dynamic> map){
      cloudFirestoreUser.doc(uid).update(map);
  }



//récupération de l'identifiant d'un utlisateur
 Future <String> getId() async {
      String? uid = await auth.currentUser!.uid;
      if(uid == null){
        return Future.error((error)=> Text(error.toString()));
      }
      return uid!;

 }

  Future<Utilisateur> getUtilisateur(String uid) async {
      DocumentSnapshot snapshot = await cloudFirestoreUser.doc(uid).get();
      return Utilisateur(snapshot);
 }








}