import 'package:flutter/material.dart';
import 'package:flutter_ui_chat/models/message_model.dart';
import 'package:flutter_ui_chat/pages/chat_page.dart';
import 'package:google_fonts/google_fonts.dart';

class RecentChats extends StatelessWidget {
  const RecentChats({
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(30),
          ),
          color: Colors.white,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(30),
          ),
          child: ListView.builder(
            padding: EdgeInsets.symmetric(
              vertical: 12,
            ),
            itemCount: chats.length,
            itemBuilder: (context, index) {
              final Message chat = chats[index];
              return RecentChatItem(chat: chat, size: size);
            },
          ),
        ),
      ),
    );
  }
}

class RecentChatItem extends StatelessWidget {
  const RecentChatItem({
    required this.chat,
    required this.size,
  });

  final Message chat;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ChatPage(user: chat.sender),
        ),
      ),
      child: Container(
        margin: EdgeInsets.only(
          top: 4,
          bottom: 4,
          right: 20,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 8,
        ),
        decoration: BoxDecoration(
          color: chat.unread ? Color(0xFFFFEFEE) : Colors.transparent,
          borderRadius: BorderRadius.horizontal(
            right: Radius.circular(24),
          ),
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: size.width * 0.09,
              backgroundImage: AssetImage(chat.sender.imageUrl),
            ),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    chat.sender.name,
                    style: GoogleFonts.poppins(
                      color: chat.unread ? Colors.black54 : Colors.black45,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    chat.text,
                    style: GoogleFonts.poppins(
                      color: Colors.black.withOpacity(0.68),
                      fontSize: 13,
                      fontWeight:
                          chat.unread ? FontWeight.w500 : FontWeight.w400,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            SizedBox(width: 8),
            Column(
              children: [
                Text(
                  chat.time,
                  style: GoogleFonts.poppins(
                    color: chat.unread
                        ? Colors.black.withOpacity(0.68)
                        : Colors.black.withOpacity(0.6),
                    fontSize: 12,
                    fontWeight: chat.unread ? FontWeight.w500 : FontWeight.w400,
                  ),
                ),
                SizedBox(height: 6),
                chat.unread
                    ? Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 3,
                        ),
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Text(
                          'New'.toUpperCase(),
                          style: GoogleFonts.poppins(
                            color: Colors.white.withOpacity(0.8),
                            fontSize: 8,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      )
                    : Text(''),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
