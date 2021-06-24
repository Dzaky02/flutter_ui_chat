import 'package:flutter/material.dart';
import 'package:flutter_ui_chat/models/message_model.dart';
import 'package:google_fonts/google_fonts.dart';

class FavoriteContactsHeader extends StatelessWidget {
  const FavoriteContactsHeader({
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20,
        right: 16,
        top: 10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Favorite Contacts',
            style: GoogleFonts.poppins(
              color: Colors.black.withOpacity(0.7),
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
          ),
          IconButton(
            onPressed: () {
              buildSnackBar(context, 'More Contact Clicked', size);
            },
            icon: Icon(
              Icons.more_horiz,
              color: Colors.black.withOpacity(0.7),
            ),
          ),
        ],
      ),
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

class FavoriteContactList extends StatelessWidget {
  const FavoriteContactList({
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.15,
      alignment: Alignment.centerLeft,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.only(bottom: 10),
        itemCount: favorites.length,
        itemBuilder: (context, index) => FavContactItem(
          size: size,
          index: index,
        ),
      ),
    );
  }
}

class FavContactItem extends StatelessWidget {
  const FavContactItem({
    required this.size,
    required this.index,
  });

  final Size size;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: index == 0 ? 20 : 6,
        right: index == favorites.length - 1 ? 20 : 6,
      ),
      child: InkWell(
        onTap: () {
          buildSnackBar(
              context, '${favorites[index].name}\'s Contact Clicked', size);
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: size.width / 7,
              width: size.width / 7,
              margin: const EdgeInsets.only(bottom: 6),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage(favorites[index].imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Text(
              favorites[index].name,
              style: GoogleFonts.poppins(
                  color: Colors.black.withOpacity(0.65),
                  fontSize: 13,
                  fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ),
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
