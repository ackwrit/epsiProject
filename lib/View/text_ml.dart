import 'package:flutter/material.dart';
import 'package:google_ml_kit/google_ml_kit.dart';




class TextViewML extends StatefulWidget {
  const TextViewML({Key? key}) : super(key: key);

  @override
  State<TextViewML> createState() => _TextViewMLState();
}

class _TextViewMLState extends State<TextViewML> {
  late TextEditingController controller;


  @override
  void initState() {
    controller = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: controller,
          decoration: const InputDecoration.collapsed(
              hintText: "Texte à identifié"
          ),
        ),
      ],
    );
  }
}
