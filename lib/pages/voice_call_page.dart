import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
            Spacer(flex: 1),
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
            Spacer(flex: 2),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: () => buildSnackBar(
                      context, 'Audio Record Clicked', SizeConfig.screenWidth!),
                  child: Column(
                    children: [
                      SvgPicture.asset(
                        'assets/icons/Icon Mic.svg',
                        color: Colors.white.withOpacity(0.8),
                        height: 36,
                      ),
                      VerticalSpacing(of: 5),
                      Text(
                        'Audio',
                        style: GoogleFonts.poppins(
                          color: Colors.white.withOpacity(0.8),
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),
                TextButton(
                  onPressed: () => buildSnackBar(
                      context, 'Mute Clicked', SizeConfig.screenWidth!),
                  child: Column(
                    children: [
                      SvgPicture.asset(
                        'assets/icons/Icon Volume.svg',
                        color: Colors.white.withOpacity(0.8),
                        height: 36,
                      ),
                      VerticalSpacing(of: 5),
                      Text(
                        'Microphone',
                        style: GoogleFonts.poppins(
                          color: Colors.white.withOpacity(0.8),
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),
                TextButton(
                  onPressed: () => buildSnackBar(
                      context, 'Video Call Clicked', SizeConfig.screenWidth!),
                  child: Column(
                    children: [
                      SvgPicture.asset(
                        'assets/icons/Icon Video.svg',
                        color: Colors.white.withOpacity(0.8),
                        height: 36,
                      ),
                      VerticalSpacing(of: 5),
                      Text(
                        'Video',
                        style: GoogleFonts.poppins(
                          color: Colors.white.withOpacity(0.8),
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            VerticalSpacing(),
            Ink(
              height: getProportionateScreenWidth(64),
              width: getProportionateScreenWidth(64),
              decoration: ShapeDecoration(
                color: Color(0xFFFF1E46),
                shape: CircleBorder(),
              ),
              child: IconButton(
                icon: Icon(Icons.call_end),
                color: Colors.white.withOpacity(0.8),
                onPressed: () => Navigator.pop(context),
              ),
            ),
            Spacer(flex: 1),
          ],
        ),
      ),
    );
  }

  // Function
  void buildSnackBar(BuildContext context, String message, double size) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(milliseconds: 1000),
        width: size * 0.7, // Width of the SnackBar.
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
