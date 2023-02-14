import 'dart:typed_data';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class ImageViewML extends StatefulWidget {
  const ImageViewML({Key? key}) : super(key: key);

  @override
  State<ImageViewML> createState() => _ImageViewMLState();
}

class _ImageViewMLState extends State<ImageViewML> {
  Uint8List? imageFile;
  String? nameImage;
  String? pathImage;
  int? sizeImage;
  



  //Méthode
  PickImage() async{
    FilePickerResult? pickerImage = await FilePicker.platform.pickFiles(
      withData: true,
      type: FileType.image,
    );
    if(pickerImage != null){
      setState((){
        sizeImage = pickerImage.files.first.size;
        pathImage = pickerImage.files.first.name;
        imageFile = pickerImage.files.first.bytes;
      });

    }
  }
  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Container(
          color: Colors.deepOrange.shade100,
          height: MediaQuery.of(context).size.width,
          width: MediaQuery.of(context).size.width,
          child: (imageFile == null)?Image.memory(imageFile!):const Icon(Icons.library_books,size: 200,),
        ),
        const Expanded(
            child: Text("coucou")
        ),

        ElevatedButton(
            onPressed: reconnaissanceObject,
            child: const Text("Reconnaissance")
        ),
      ],
    );
  }


  reconnaissanceObject(){

  }




}
