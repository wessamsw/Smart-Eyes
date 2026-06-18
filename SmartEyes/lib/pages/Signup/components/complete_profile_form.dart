import 'package:flutter/material.dart';
import '../../../components/custom_surfix_icon.dart';
import '../../../constants.dart';
import 'otp_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CompleteProfileForm extends StatefulWidget {
  const CompleteProfileForm({Key? key});

  @override
  _CompleteProfileFormState createState() => _CompleteProfileFormState();
}

class _CompleteProfileFormState extends State<CompleteProfileForm> {
  final _formKey = GlobalKey<FormState>();
  String? firstName;
  String? lastName;
  String? phoneNumber;
  String? address;
  String? firstNameError;
  String? lastNameError;
  String? phoneNumberError;
  String? addressError;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            onSaved: (newValue) => firstName = newValue,
            onChanged: (value) {
              setState(() {
                firstNameError = null;
                if (value.isEmpty) {
                  firstNameError = kNamelNullError;
                }
              });
            },
            validator: (value) {
              if (value!.isEmpty) {
                return kNamelNullError;
              } else if (!RegExp(r'^[a-zA-Z]+$').hasMatch(value)) {
                return "Name should only contain alphabets";
              }
              return null;
            },
            decoration: const InputDecoration(
              labelText: "First Name",
              hintText: "Enter your first name",
              floatingLabelBehavior: FloatingLabelBehavior.always,
              suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User.svg"),
            ),
          ),
          if (firstNameError != null)
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Text(
                firstNameError!,
                style: const TextStyle(color: Colors.red, fontSize: 12),
              ),
            ),
          const SizedBox(height: 20),
          TextFormField(
            onSaved: (newValue) => lastName = newValue,
            onChanged: (value) {
              setState(() {
                lastNameError = null;
                if (value.isEmpty) {
                  lastNameError = kNamelNullError;
                }
              });
            },
            validator: (value) {
              if (value!.isEmpty) {
                return kNamelNullError;
              } else if (!RegExp(r'^[a-zA-Z]+$').hasMatch(value)) {
                return "Name should only contain alphabets";
              }
              return null;
            },
            decoration: const InputDecoration(
              labelText: "Last Name",
              hintText: "Enter your last name",
              floatingLabelBehavior: FloatingLabelBehavior.always,
              suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User.svg"),
            ),
          ),
          if (lastNameError != null)
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Text(
                lastNameError!,
                style: const TextStyle(color: Colors.red, fontSize: 12),
              ),
            ),
          const SizedBox(height: 20),
          TextFormField(
            keyboardType: TextInputType.phone,
            onSaved: (newValue) => phoneNumber = newValue,
            onChanged: (value) {
              setState(() {
                phoneNumberError = null;
                if (value.isEmpty) {
                  phoneNumberError = kPhoneNumberNullError;
                }
              });
            },
            validator: (value) {
              if (value!.isEmpty) {
                return null;
              } else if (!RegExp(r'^\d{11}$').hasMatch(value)) {
                return "Phone number must be 11 digits";
              }
              return null;
            },
            decoration: const InputDecoration(
              labelText: "Phone Number",
              hintText: "Enter your phone number",
              floatingLabelBehavior: FloatingLabelBehavior.always,
              suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Phone.svg"),
            ),
          ),
          if (phoneNumberError != null)
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Text(
                phoneNumberError!,
                style: const TextStyle(color: Colors.red, fontSize: 12),
              ),
            ),
          const SizedBox(height: 20),
          TextFormField(
            onSaved: (newValue) => address = newValue,
            onChanged: (value) {
              setState(() {
                addressError = null;
                if (value.isEmpty) {
                  addressError = kAddressNullError;
                }
              });
            },
            validator: (value) {
              if (value!.isEmpty) {
                return kAddressNullError;
              }
              return null;
            },
            decoration: const InputDecoration(
              labelText: "Address",
              hintText: "Enter your address",
              floatingLabelBehavior: FloatingLabelBehavior.always,
              suffixIcon:
              CustomSurffixIcon(svgIcon: "assets/icons/Location point.svg"),
            ),
          ),
          const SizedBox(height: defaultPadding),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                addUser(firstName!, lastName!, phoneNumber!, address!);
              }
            },
            child:
            const Text("Continue", style: TextStyle(color: Colors.black)),
          ),
        ],
      ),
    );
  }

  Future<void> addUser(String firstName, String lastName, String phone,
      String address) {
    final FirebaseAuth auth = FirebaseAuth.instance;
    if (auth.currentUser == null) {
      print("User is not signed In");
    }
    String uid = auth.currentUser!.uid;
    CollectionReference users = FirebaseFirestore.instance.collection("users");

    return users.doc(uid).set({
      'uid': uid,
      'firstName': firstName,
      'lastName': lastName,
      'phone': phone,
      'address': address,
    }).then((value) =>

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                OtpScreen(
                    phoneNumber:
                    phoneNumber!), // Pass the phone number to OtpScreen
          ),
        )

    )
        .onError((e, _) => print("Error writing document: $e"));
  }

}


