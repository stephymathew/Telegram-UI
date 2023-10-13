 import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:telegram_project/screens/splash.dart';
 late SharedPreferences sharedPreferences;

  Future<void>main()async{
    WidgetsFlutterBinding.ensureInitialized();
   sharedPreferences = await SharedPreferences.getInstance();
  runApp(MyApp());
 }

 class MyApp extends StatelessWidget {
   MyApp({super.key});

  @override
   Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login Sample',
      theme: ThemeData(
        primaryColor: const Color.fromARGB(255, 30, 23, 61),
      ),
      home:  const Splash(),
    );
  }
}
