import 'package:flutter/material.dart';
import 'package:flutter_ui_chat/constants.dart';
import 'package:flutter_ui_chat/pages/sign_in_page.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mPrimaryColor,
      body: SafeArea(
        child: Column(
          children: [
            Spacer(flex: 2),
            Image.asset('assets/images/welcome_image.png'),
            Spacer(flex: 3),
            Text(
              'Welcome to our red chat \nmessaging app',
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                color: Colors.white.withOpacity(0.8),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Spacer(),
            Text(
              'Fast, Fresh, Instant message for people\nwith an instant lifestyle.',
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                color: Colors.white54,
                fontSize: 12,
                fontWeight: FontWeight.w500,
                letterSpacing: 0.1,
                height: 2,
              ),
            ),
            Spacer(flex: 2),
            FittedBox(
              child: TextButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignInPage(),),
                ),
                child: Row(
                  children: [
                    Text(
                      'Skip',
                      style: GoogleFonts.poppins(
                        color: Colors.white.withOpacity(0.75),
                      ),
                    ),
                    SizedBox(width: mDefaultPadding / 4),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 16,
                      color: Colors.white.withOpacity(0.75),
                    ),
                  ],
                ),
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
