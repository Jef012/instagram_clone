import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double height;
  final double width;

  const CustomAppBar({Key? key, required this.height, required this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      scrolledUnderElevation: 0,
      actions: [
        SizedBox(width: width * 0.044),
        Row(
          children: [
            Image.asset(
              "assets/image/instagramLogoTitle.png",
              height: height * 0.25,
              width: width * 0.3,
            ),
            SizedBox(width: width * 0.01),
            Icon(
              Icons.keyboard_arrow_down,
              size: height * 0.035,
              color: Colors.white,
            ),
          ],
        ),
        Spacer(),
        SizedBox(width: width * 0.01),
        Icon(
          Icons.favorite_border,
          size: height * 0.035,
          color: Colors.white,
        ),
        SizedBox(width: width * 0.01),
        badges.Badge(
          badgeContent: Text(
            '3',
            style: TextStyle(color: Colors.white),
          ),
          position: badges.BadgePosition.topStart(top: 0, start: 30),
          child: Image.asset(
            "assets/image/messageIcon.png",
            height: height * 0.25,
            color: Colors.white,
          ),
        )
      ],
      automaticallyImplyLeading: false,
      backgroundColor: Colors.black,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
