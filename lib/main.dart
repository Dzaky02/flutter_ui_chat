import 'package:flutter/material.dart';
import 'package:flutter_ui_chat/pages/home_page.dart';
import 'package:flutter_ui_chat/pages/welcome/welcome_screen.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Chat UI Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.red,
        accentColor: Color(0xFFFEF9EB),
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      home: WelcomeScreen(),
    );
  }
}
