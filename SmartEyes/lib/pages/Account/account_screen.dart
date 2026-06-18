import 'package:flutter/material.dart';
import 'package:smarteyes/pages/Emergency/emergency_screen.dart';
import 'package:smarteyes/pages/Settings/settings.dart';
import 'package:smarteyes/pages/Welcome/welcome_screen.dart';
import 'components/profile_menu.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            const ProfilePic(),
            const SizedBox(
                height: 10), // Add some space between profile picture and name
            const Text("John Doe", // Replace with the user's name
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                )),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Divider(
                thickness: 2,
                color: Colors.grey[300],
              ),
            ),
            const SizedBox(height: 20),
            ProfileMenu(
              text: "Emergency",
              icon: "assets/icons/Bell.png",
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          EmergencyScreen()), // Navigate to EmergencyScreen
                );
              },
              backgroundColor: AppColors.emergencyBackground,
            ),
            ProfileMenu(
              text: "Settings",
              icon: "assets/icons/Settings.png",
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          SettingsPage()), // Navigate to Settings
                );
              },
              backgroundColor: AppColors.settingsBackground,
            ),
            ProfileMenu(
              text: "Log Out",
              icon: "assets/icons/Log out.png",
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          const WelcomeScreen()), // Navigate to WelcomeScreen
                );
              },
              backgroundColor: AppColors.logoutBackground,
            ),
          ],
        ),
      ),
    );
  }
}
