import 'package:flutter/material.dart';
import 'package:projectepsi/Controller/Background_controller.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
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
            padding: const EdgeInsets.all(8.0),
            child: Center(
                child: BodyPage()
            ),
          )
        ],
      ),
    );
  }


  Widget BodyPage(){
    return  Text("Page Inscription");
  }
}
