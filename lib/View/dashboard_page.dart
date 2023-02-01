import 'package:flutter/material.dart';
import 'package:projectepsi/Controller/Background_controller.dart';
class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.amber,
      body: Stack(
        children: [
          const BackgroundController(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
                child: bodyPage()
            ),
          )
        ],
      ),
    );
  }

  Widget bodyPage(){
    return const Text("coucou");
  }
}
