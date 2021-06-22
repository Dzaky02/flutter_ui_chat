import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CategorySelector extends StatefulWidget {
  const CategorySelector({Key? key}) : super(key: key);

  @override
  _CategorySelectorState createState() => _CategorySelectorState();
}

class _CategorySelectorState extends State<CategorySelector> {
  int selectedIndex = 0;
  final List<String> categories = [
    'Messages',
    'Online',
    'Groups',
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.1,
      color: Theme.of(context).primaryColor,
      alignment: Alignment.center,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(vertical: size.height * 0.1 / 2 - 16),
        itemBuilder: (context, index) => Padding(
          padding: EdgeInsets.only(
            left: index != 0 ? size.width * 0.08 : 0,
          ),
          child: GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
            },
            child: Text(
              categories[index],
              style: GoogleFonts.poppins(
                color: selectedIndex == index ? Colors.white : Colors.white60,
                fontSize: 16,
                fontWeight: FontWeight.w600,
                letterSpacing: 1.2,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
