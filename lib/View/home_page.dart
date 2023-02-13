import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projectepsi/Controller/Background_controller.dart';
import 'package:projectepsi/Controller/FirestoreHelper.dart';
import 'package:projectepsi/Controller/MyAnimationController.dart';
import 'package:projectepsi/Global/library.dart';
import 'package:projectepsi/View/dashboard_page.dart';
import 'package:projectepsi/View/register_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //Variable

  TextEditingController mailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();




  PopError(String message){
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context){
          if(Platform.isIOS){
            return CupertinoAlertDialog(
              title: const Text("Erreur"),
              content: Text(message),
              actions: [
                TextButton(
                    onPressed: (){
                      Navigator.pop(context);
                    },
                    child: const Text("OK")
                )
              ],
            );
          }
          else
          {
            return AlertDialog(
              title: const Text("Erreur"),
              content: Text(message),
              actions: [
                TextButton(
                    onPressed: (){
                      Navigator.pop(context);
                    },
                    child: const Text("OK")
                )
              ],
            );
          }
        }
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.amber,

      body : Stack(
          children: [
            const BackgroundController(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                  child: BodyPage()
              ),
            ),
          ],
        ),

    );

  }


  Widget BodyPage(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children:[
        //Logo Circulaire
        MyAnimation(
          duration: 1000,
          child: const CircleAvatar(
            radius: 70,
            backgroundImage:AssetImage("assets/splatoon.jpg"),
          ),
        ),

        const SizedBox(height: 10,),


        // 2 TexField

        MyAnimation(
          duration: 2000,
          child: TextField(
            controller: mailController,

            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              hintText: "Entrer votre mail",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10)
              )
            ),

          ),
        ),

        const SizedBox(height: 10,),
        MyAnimation(
          duration: 3000,
          child: TextField(
              obscureText: true,
            controller: passwordController,
            decoration: InputDecoration(
                hintText: "Entrer votre password",
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10)
                )
            ),
          ),
        ),
        const SizedBox(height: 10,),
        
        //2 Boutons
        MyAnimation(
          duration: 4000,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: const StadiumBorder()
                ),
                  onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> const RegisterPage()));

                  },
                  child: const Text("Inscription")
              ),
              const SizedBox(width: 10,),


              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: const StadiumBorder()
                  ),
                  onPressed: (){
                    FirestoreHelper().connexion(mailController.text, passwordController.text).then((value){
                      setState(() {
                        myUtilisateur = value;
                      });
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const DashBoard()));
                    }).catchError((onError){
                       PopError("Erreur de saisie pour le mail/ou le mot de passe");
                    });



                  },
                  child: const Text("Connexion")
              ),

            ],
          ),
        ),
        

      ],
    );
  }
}
