import 'package:flutter/material.dart';
import 'package:projectepsi/Controller/pathClipper.dart';
class BackgroundController extends StatefulWidget {
  const BackgroundController({Key? key}) : super(key: key);

  @override
  State<BackgroundController> createState() => _BackgroundControllerState();
}

class _BackgroundControllerState extends State<BackgroundController> {
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: PathClipper(),
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        decoration: const BoxDecoration(

          image: DecorationImage(
            image: AssetImage("assets/tomb.jpg"),
            fit: BoxFit.fill
          )
        ),
      ),
    );
  }
}
