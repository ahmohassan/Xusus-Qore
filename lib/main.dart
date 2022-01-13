import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:somapp/screens/exportScreens.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const XasusQoreApp());
}

class XasusQoreApp extends StatelessWidget {
  const XasusQoreApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const Myhome(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xffe9e9f3),
      ),
    );
  }
}
