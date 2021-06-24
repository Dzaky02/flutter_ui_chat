import 'package:flutter/material.dart';
import 'package:flutter_ui_chat/models/user_model.dart';

class ChatPage extends StatefulWidget {
  ChatPage({required this.user});

  final User user;

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
