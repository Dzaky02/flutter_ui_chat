import 'package:flutter/material.dart';
import 'package:flutter_ui_chat/models/message_model.dart';
import 'package:flutter_ui_chat/models/user_model.dart';
import 'package:flutter_ui_chat/pages/voice_call_page.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatPage extends StatefulWidget {
  ChatPage({required this.user});

  final User user;

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  Widget contentGenerator(Message message, bool isMe) {
    switch (message.messageType) {
      case ChatMessageType.text:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              message.time,
              style: GoogleFonts.poppins(
                color: Colors.black.withOpacity(0.4),
                fontSize: 11,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 6),
            Text(
              message.text,
              style: GoogleFonts.poppins(),
            ),
          ],
        );
      case ChatMessageType.audio:
        return Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              Icon(
                Icons.play_arrow,
                color: Colors.black.withOpacity(0.7),
              ),
              Expanded(
                child: SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    trackHeight: 3.0,
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 7.0),
                    overlayColor: Colors.black.withAlpha(32),
                    overlayShape: RoundSliderOverlayShape(overlayRadius: 14.0),
                  ),
                  child: Slider(
                    value: 10,
                    min: 0,
                    max: 100,
                    onChanged: (double value) {},
                    activeColor: Colors.black54,
                    inactiveColor: Colors.black26,
                  ),
                ),
              ),
              Text(
                '0.45',
                style: GoogleFonts.poppins(
                  color: Colors.black.withOpacity(0.7),
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        );
      case ChatMessageType.video:
        return ClipRRect(
          borderRadius: isMe
              ? BorderRadius.only(
                  topRight: Radius.circular(30),
                  topLeft: Radius.circular(18),
                  bottomLeft: Radius.circular(18),
                )
              : BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(18),
                  bottomRight: Radius.circular(18),
                ),
          child: Stack(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset('assets/images/Video Place Here.png'),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black87,
                      ),
                      child: IconButton(
                        icon: Icon(Icons.play_arrow),
                        color: Colors.white,
                        onPressed: () {},
                      ),
                    ),
                  ),
                ],
              ),
              Align(
                alignment: isMe ? Alignment.topRight : Alignment.topLeft,
                child: Container(
                  padding: EdgeInsets.only(
                    top: 10,
                    bottom: 10,
                    left: 16,
                    right: 16,
                  ),
                  decoration: BoxDecoration(
                    color: isMe ? Colors.amber.shade100 : Colors.red.shade100,
                    borderRadius: isMe
                        ? BorderRadius.only(
                            bottomLeft: Radius.circular(30),
                          )
                        : BorderRadius.only(
                            bottomRight: Radius.circular(30),
                          ),
                  ),
                  child: Text(
                    message.time,
                    style: GoogleFonts.poppins(
                      color: Colors.black.withOpacity(0.5),
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      default:
        return Container();
    }
  }

  _buildMessage(Message message, bool isMe, Size size) {
    return Row(
      children: [
        Expanded(
          child: Container(
            margin: EdgeInsets.only(
              top: 8,
              bottom: 8,
              left: isMe ? size.width * 0.2 : 8,
              right: isMe ? 8 : 0,
            ),
            padding: (message.messageType == ChatMessageType.text)
                ? EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 14,
                  )
                : EdgeInsets.all(0),
            decoration: BoxDecoration(
              color: isMe
                  ? Colors.amber.withOpacity(0.17)
                  : Colors.red.withOpacity(0.14),
              borderRadius: isMe
                  ? BorderRadius.only(
                      topRight: Radius.circular(30),
                      topLeft: Radius.circular(18),
                      bottomLeft: Radius.circular(18),
                    )
                  : BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(18),
                      bottomRight: Radius.circular(18),
                    ),
            ),
            child: contentGenerator(message, isMe),
          ),
        ),
        Container(
          width: isMe ? 0 : size.width * 0.2,
          alignment: Alignment.centerLeft,
          child: IconButton(
            onPressed: () =>
                buildSnackBar(context, 'Liked Button Clicked', size),
            icon: Icon(
              message.isLiked ? Icons.favorite : Icons.favorite_border,
            ),
            color: message.isLiked
                ? Theme.of(context).primaryColor
                : Colors.black45,
          ),
        )
      ],
    );
  }

  _buildMessageComposer(Size size) {
    String inputMessage = '';
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: size.height * 0.08,
        margin: EdgeInsets.only(
          left: 20,
          right: 20,
          bottom: 8,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.yellow.shade100,
        ),
        child: Row(
          children: [
            IconButton(
              onPressed: () => buildSnackBar(context, 'Emoji Clicked', size),
              icon: Icon(Icons.emoji_emotions),
              iconSize: size.height * 0.05,
              color: Colors.black45,
            ),
            Expanded(
              child: TextField(
                textCapitalization: TextCapitalization.sentences,
                onChanged: (value) {
                  inputMessage = value;
                  setState(() {});
                },
                decoration: InputDecoration.collapsed(
                  hintText: 'Send a message...',
                ),
              ),
            ),
            IconButton(
              onPressed: () => buildSnackBar(
                  context,
                  (inputMessage.isNotEmpty && inputMessage.length > 0)
                      ? '$inputMessage'
                      : 'Type Something First',
                  size),
              icon: Icon(Icons.send),
              iconSize: size.height * 0.04,
              color: Colors.black45,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: buildAppBar(context, size),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(30),
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(30),
          ),
          child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Stack(
              children: [
                Container(
                  child: ListView.builder(
                    padding: EdgeInsets.only(
                        top: 15, bottom: size.height * 0.08 + 8),
                    reverse: true,
                    itemCount: messages.length,
                    itemBuilder: (context, index) {
                      final Message message = messages[index];
                      bool isMe = message.sender.id == currentUser.id;
                      return _buildMessage(message, isMe, size);
                    },
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: size.height * 0.05,
                    color: Colors.white,
                  ),
                ),
                _buildMessageComposer(size),
              ],
            ),
          ),
        ),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context, Size size) {
    return AppBar(
      toolbarHeight: size.height * 0.11,
      elevation: 0,
      title: Center(
        child: Column(
          children: [
            Text(
              widget.user.name,
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                letterSpacing: 1,
              ),
            ),
            Text(
              'Active 3min ago',
              style: GoogleFonts.poppins(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                letterSpacing: 1,
              ),
            ),
          ],
        ),
      ),
      actions: [
        IconButton(
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => VoiceCallPage(
                user: widget.user,
              ),
            ),
          ),
          icon: Icon(Icons.local_phone),
          iconSize: size.height * 0.04,
          color: Colors.white,
        ),
        IconButton(
          onPressed: () => buildSnackBar(context, "Video Call Clicked", size),
          icon: Icon(Icons.videocam),
          iconSize: size.height * 0.04,
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
