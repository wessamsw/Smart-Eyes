import 'package:flutter/material.dart';
import 'package:smarteyes/pages/Homescreen/components/functionalities.dart';
import 'package:smarteyes/pages/Account/account_screen.dart'; // Import the account screen
import 'package:smarteyes/pages/Emergency/emergency_screen.dart'; // Import the emergency screen

class HomePage extends StatefulWidget {
  const HomePage({Key? key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // padding constants
  final double horizontalPadding = 30;
  final double verticalPadding = 20;

  // list of functionalities
  List mySmartDevices = [
    // [ functionality, iconPath , powerStatus ]
    ["Object Detection", "assets/icons/recognition.png", true],
    ["Text Recognition", "assets/icons/text.png", false],
    ["Face Recognition", "assets/icons/face-scanner.png", false],
  ];

  // power button switched
  void powerSwitchChanged(bool value, int index) {
    setState(() {
      mySmartDevices[index][2] = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // app bar
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: horizontalPadding,
                vertical: verticalPadding,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end, // Align to the right
                children: [
                  // Wrap the icon with GestureDetector for navigation
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AccountScreen(),
                        ),
                      );
                    },
                    child: Icon(
                      Icons.person,
                      size: 45,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 5),

            // welcome home
            Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Welcome,",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        color: Colors.black),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 5),

            // Divider
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Divider(
                thickness: 1,
                color: Colors.grey[300],
              ),
            ),

            const SizedBox(height: 5),

            // functions grid
            Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: const Text(
                "Functionalities",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 5),

            // grid
            Expanded(
              child: GridView.builder(
                itemCount: 3,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 25),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1 / 1.3,
                ),
                itemBuilder: (context, index) {
                  return functionalities(
                    smarteyesfunc: mySmartDevices[index][0],
                    iconPath: mySmartDevices[index][1],
                    powerOn: mySmartDevices[index][2],
                    onChanged: (value) => powerSwitchChanged(value, index),
                  );
                },
              ),
            ),

            // Red bar for emergency button
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EmergencyScreen(),
                  ),
                );
              },
              child: Container(
                width: double.infinity,
                color: Colors.red,
                padding: EdgeInsets.symmetric(vertical: 16),
                child: const Center(
                  child: Text(
                    "Emergency",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
