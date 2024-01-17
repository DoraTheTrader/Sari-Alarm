import 'package:alarm/auth/auth.dart';
import 'package:alarm/firebase_options.dart';
import 'package:alarm/pages/HomePage.dart';
import 'package:alarm/pages/ProfilePage.dart';
import 'package:alarm/pages/UsersPage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:alarm/auth/login_or_register.dart';
import 'package:flutter/material.dart';
import 'theme/DarkMode.dart';
import 'theme/LightMode.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const AuthPage(),
        theme: darkMode,
        darkTheme: darkMode,
        routes: {
          '/login_register_page': (context) => const LoginOrRegister(),
          '/home_page': (context) => HomePage(),
          '/profile_page': (context) => ProfilePage(),
          '/users_page': (context) => const UsersPage(),
        },
      );
  }
}