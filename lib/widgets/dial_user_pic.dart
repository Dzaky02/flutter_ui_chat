import 'package:flutter/material.dart';
import 'package:flutter_ui_chat/size_config.dart';

class DialUserPic extends StatelessWidget {
  const DialUserPic({
    this.size = 192,
    required this.imgUrl,
  });

  final double size;
  final String imgUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getProportionateScreenWidth(size),
      width: getProportionateScreenWidth(size),
      padding: EdgeInsets.all(30 / 192 * size),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: RadialGradient(
          colors: [
            Colors.white.withOpacity(0.05),
            Colors.white.withOpacity(0.15),
          ],
          stops: [0.5, 1],
        ),
      ),
      child: CircleAvatar(
        backgroundImage: AssetImage(imgUrl),
      ),
      // Image.asset(
      //   imgUrl,
      //   fit: BoxFit.cover,
      // ),
    );
  }
}
