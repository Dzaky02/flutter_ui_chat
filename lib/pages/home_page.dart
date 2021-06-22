import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: buildAppBar(context, size),
    );
  }

  AppBar buildAppBar(BuildContext context, Size size) {
    return AppBar(
      elevation: 0,
      leading: IconButton(
        onPressed: () => buildSnackBar(context, "Menu Clicked", size),
        icon: Icon(Icons.menu),
        iconSize: 30.0,
        color: Colors.white,
      ),
      title: Text(
        "Chats",
        style: TextStyle(
          fontSize: 28.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () => buildSnackBar(context, "Search Clicked", size),
          icon: Icon(Icons.search),
          iconSize: 30.0,
          color: Colors.white,
        ),
      ],
    );
  }

  // Function
  void buildSnackBar(BuildContext context, String message, Size size) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(milliseconds: 1000),
        width: size.width * 0.7, // Width of the SnackBar.
        padding: const EdgeInsets.symmetric(
          horizontal: 20.0, // Inner padding for SnackBar content.
        ),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
