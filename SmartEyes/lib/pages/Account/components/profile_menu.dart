import 'package:flutter/material.dart';
//import 'package:flutter_svg/flutter_svg.dart';
import '../../../constants.dart';

class AppColors {
  static Color emergencyBackground = Colors.red;
  static Color settingsBackground = Colors.black;
  static Color logoutBackground = Colors.black;
}

class ProfilePic extends StatelessWidget {
  const ProfilePic({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 115,
      width: 115,
      child: Stack(
        fit: StackFit.expand,
        clipBehavior: Clip.none,
        children: [
          CircleAvatar(
            backgroundImage: AssetImage("assets/images/Profile.png"),
          ),
        ],
      ),
    );
  }
}

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({
    Key? key,
    required this.text,
    required this.icon,
    this.press,
    required this.backgroundColor,
  }) : super(key: key);

  final String text, icon;
  final VoidCallback? press;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextButton(
        style: TextButton.styleFrom(
          foregroundColor: kPrimaryColor,
          padding: const EdgeInsets.all(20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          backgroundColor: backgroundColor,
        ),
        onPressed: press,
        child: Row(
          children: [
            Image.asset(
              icon,
              color: Colors.white,
              width: 22,
            ),
            const SizedBox(width: 20),
            Expanded(child: Text(text)),
            const Icon(Icons.arrow_forward_ios),
          ],
        ),
      ),
    );
  }
}
