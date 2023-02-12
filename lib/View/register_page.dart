import 'package:flutter/material.dart';
import 'package:projectepsi/Controller/Background_controller.dart';
import 'package:projectepsi/Controller/FirestoreHelper.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  //variable

  TextEditingController mail = TextEditingController();
  TextEditingController prenom = TextEditingController();
  TextEditingController nom = TextEditingController();
  TextEditingController password = TextEditingController();
  DateTime anniversaire = DateTime.now();



  //Méthode
  popHeure() async {
    DateTime? picker = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1950,1,1),
        lastDate: DateTime.now()
    );
    if(picker!=null){
      setState((){
        anniversaire = picker!;
      });

    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Colors.amber,
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          const BackgroundController(),
          Padding(
            padding: const EdgeInsets.only(top: 40,left: 10,right: 10),
            child: Center(
                child: BodyPage()
            ),
          )
        ],
      ),
    );
  }


  Widget BodyPage(){
    return  Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextField(
          controller: nom,
          decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
            hintText: 'Entrer votre nom',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            )
          ),
        ),
        const SizedBox(height: 5,),




        TextField(
          controller: prenom,
          decoration: InputDecoration(
              hintText: 'Entrer votre prénom',
              fillColor: Colors.white,
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              )
          ),
        ),
        const SizedBox(height: 5,),


        TextField(
          controller: mail,
          decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
              hintText: 'Entrer votre mail',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              )
          ),


        ),
        const SizedBox(height: 5,),



        TextField(
          controller: password,
          decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
              hintText: 'Entrer votre password',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              )
          ),





        ),
        const SizedBox(height: 5,),

        ElevatedButton.icon(
            onPressed: (){
              popHeure();
            },
            icon: const Icon(Icons.watch_later_sharp),
            label: const Text('Heure')
        ),
        
        Text("${anniversaire.day}/${anniversaire.month}/${anniversaire.year}"),


        const SizedBox(height: 5,),

        ElevatedButton(
            onPressed: (){

            },
            child: const Text("Validation")
        ),
      ],
    );
  }
}
