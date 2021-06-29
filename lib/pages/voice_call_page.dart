import 'package:flutter/material.dart';
import 'package:flutter_ui_chat/constants.dart';
import 'package:flutter_ui_chat/models/user_model.dart';
import 'package:flutter_ui_chat/size_config.dart';
import 'package:flutter_ui_chat/widgets/dial_user_pic.dart';
import 'package:google_fonts/google_fonts.dart';

class VoiceCallPage extends StatelessWidget {
  const VoiceCallPage({Key? key, required this.user}) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: mBackgroundColor,
      body: SafeArea(
        bottom: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              user.name,
              style: GoogleFonts.poppins(
                color: Colors.white.withOpacity(0.9),
                fontSize: 28,
                fontWeight: FontWeight.w600,
                letterSpacing: 1.0,
              ),
            ),
            Text(
              'Calling...',
              style: GoogleFonts.poppins(color: Colors.white60),
            ),
            VerticalSpacing(),
            DialUserPic(
              imgUrl: user.imageUrl,
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
