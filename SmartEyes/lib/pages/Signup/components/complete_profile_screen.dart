import 'package:flutter/material.dart';
import 'package:smarteyes/constants.dart';
import 'package:smarteyes/pages/Signup/components/complete_profile_form.dart';

class CompleteProfileScreen extends StatelessWidget {
  static String routeName = "/complete_profile";

  const CompleteProfileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
      ),
      body: const SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 16),
                  Text("Complete Profile", style: headingStyle),
                  SizedBox(height: 16),
                  CompleteProfileForm(),
                  SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }



}
