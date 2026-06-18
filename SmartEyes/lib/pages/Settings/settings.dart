import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smarteyes/pages/Settings/components/edit_profile.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key});

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _isNewForYouActive = true;
  bool _isAccountActivityActive = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 1,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 16, top: 25, right: 16),
        child: ListView(
          children: [
            const Text(
              "Settings",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            const Row(
              children: [
                Icon(
                  Icons.person,
                  color: Colors.black,
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  "Account",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            const Divider(
              height: 15,
              thickness: 2,
            ),
            const SizedBox(
              height: 10,
            ),
            buildAccountOptionRow(context, "Edit Profile"),
            buildAccountOptionRow(context, "Language"),
            buildAccountOptionRow(context, "Privacy and Security"),
            const SizedBox(
              height: 40,
            ),
            const Row(
              children: [
                Icon(
                  Icons.volume_up_outlined,
                  color: Colors.black,
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  "Notifications",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            const Divider(
              height: 15,
              thickness: 2,
            ),
            const SizedBox(
              height: 10,
            ),
            buildNotificationOptionRow("New for you", _isNewForYouActive,
                (value) {
              setState(() {
                _isNewForYouActive = value;
              });
            }),
            buildNotificationOptionRow(
                "Account activity", _isAccountActivityActive, (value) {
              setState(() {
                _isAccountActivityActive = value;
              });
            }),
          ],
        ),
      ),
    );
  }

  Row buildNotificationOptionRow(
      String title, bool isActive, Function(bool) onChanged) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
        Transform.scale(
          scale: 0.7,
          child: CupertinoSwitch(
            value: isActive,
            onChanged: (bool val) {
              onChanged(val);
            },
            activeColor: Colors.green,
          ),
        )
      ],
    );
  }

  GestureDetector buildAccountOptionRow(BuildContext context, String title) {
    return GestureDetector(
      onTap: () {
        if (title == "Edit Profile") {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => EditProfilePage()),
          );
        } else if (title == "Privacy and Security") {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text(
                  title,
                  style: const TextStyle(color: Colors.black),
                ),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    buildPrivacyOption(context, "Change Password"),
                    buildPrivacyOption(context, "End-to-End Encryption"),
                    buildPrivacyOption(context, "Help"),
                  ],
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text(
                      "Close",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ],
              );
            },
          );
        } else if (title == "Language") {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text(
                  title,
                  style: const TextStyle(color: Colors.black),
                ),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    buildPrivacyOption(context, "German"),
                    buildPrivacyOption(context, "French"),
                    buildPrivacyOption(context, "Spanich"),
                  ],
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text(
                      "Close",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ],
              );
            },
          );
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios,
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }

  GestureDetector buildPrivacyOption(BuildContext context, String title) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pop(); // Close the dialog
        if (title == "Change Password") {
          // Navigate to ChangePasswordPage
          return null;
        } else if (title == "End-to-End Encryption") {
          // Navigate to EncryptionPage
          return null;
        } else if (title == "Help") {
          // Navigate to HelpPage
          return null;
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black,
              ),
            ),
            const Spacer(),
            const Icon(
              Icons.arrow_forward_ios,
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }

  GestureDetector buildLanguageOption(BuildContext context, String title) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pop(); // Close the dialog
        if (title == "German") {
          return null;
        } else if (title == "French") {
          return null;
        } else if (title == "Spanich") {
          return null;
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black,
              ),
            ),
            const Spacer(),
            const Icon(
              Icons.arrow_forward_ios,
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
