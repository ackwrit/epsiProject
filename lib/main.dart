import 'package:flutter/material.dart';
import 'package:projectepsi/View/home_page.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'dart:io';
void main() async {
  await WidgetsFlutterBinding.ensureInitialized();
  if(Platform.isIOS || Platform.isAndroid){
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }
  else
    {
      await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: 'AIzaSyA554zf20T_MoRWeJUhF44YualDjFHR0z4',
            appId: '1:46425100916:web:dda7b4e39a234ebfb53721',
            messagingSenderId: '46425100916',
            projectId: 'epsib3cda-5a7f1',
          authDomain: 'epsib3cda-5a7f1.firebaseapp.com',
          storageBucket: 'epsib3cda-5a7f1.appspot.com',
          measurementId: 'G-F536FXR6XB',

        )
      );
    }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(

          primarySwatch: Colors.blue,


      ),
      darkTheme: ThemeData(
          primarySwatch: Colors.deepPurple ,



      ),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}


