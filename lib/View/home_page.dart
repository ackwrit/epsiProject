import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //Variable

  TextEditingController mailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body : Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
            child: BodyPage()
        ),
      )
    );

  }


  Widget BodyPage(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children:[
        //Logo Circulaire
        const CircleAvatar(
          radius: 70,
          backgroundImage:AssetImage("assets/splatoon.jpg"),
        ),

        const SizedBox(height: 10,),


        // 2 TexField

        TextField(
          controller: mailController,
          decoration: InputDecoration(
            hintText: "Entrer votre mail",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10)
            )
          ),

        ),

        const SizedBox(height: 10,),
        TextField(
            obscureText: true,
          controller: passwordController,
          decoration: InputDecoration(
              hintText: "Entrer votre password",
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10)
              )
          ),
        ),
        const SizedBox(height: 10,),
        
        //2 Boutons
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: const StadiumBorder()
              ),
                onPressed: (){

                },
                child: const Text("Inscription")
            ),
            const SizedBox(width: 10,),


            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: const StadiumBorder()
                ),
                onPressed: (){


                },
                child: const Text("Connexion")
            ),

          ],
        ),
        

      ],
    );
  }
}
