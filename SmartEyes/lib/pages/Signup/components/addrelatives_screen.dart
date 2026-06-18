import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:smarteyes/pages/Homescreen/home_screen.dart';

class AddRelativesScreen extends StatefulWidget {
  @override
  _AddRelativesScreenState createState() => _AddRelativesScreenState();
}

class _AddRelativesScreenState extends State<AddRelativesScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final ImagePicker _picker = ImagePicker();
  File? _imageFile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Relatives'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Upload photo of relative',
                style: TextStyle(fontSize: 20.0),
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: _pickImage,
                child: const Text('Upload Photo',
                    style: TextStyle(color: Colors.black)),
              ),
              const SizedBox(height: 20.0),
              _imageFile != null
                  ? Image.file(_imageFile!, height: 200.0)
                  : Placeholder(fallbackHeight: 200.0),
              const SizedBox(height: 20.0),
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Relative Name',
                  hintText: 'Enter relative name',
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  suffixIcon: const Icon(Icons.person),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter relative name.';
                  } else if (value.contains(RegExp(r'[0-9]'))) {
                    return 'Name should not contain numbers.';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20.0),
              TextFormField(
                controller: _phoneNumberController,
                decoration: InputDecoration(
                  labelText: 'Contact Number',
                  hintText: 'Enter contact number',
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  suffixIcon: const Icon(Icons.phone),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter contact number.';
                  } else if (value.length != 11 ||
                      !RegExp(r'^\d+$').hasMatch(value)) {
                    return 'Contact number must be 11 digits.';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: _addRelative,
                child: const Text('Add Relative',
                    style: TextStyle(color: Colors.black)),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomePage(),
                    ),
                  );
                },
                child: const Text("Continue",
                    style: TextStyle(color: Colors.black)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  void _addRelative() {
    if (_formKey.currentState!.validate()) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content:
                Text('Relative added successfully: ${_nameController.text}'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();

                  // Reset image selection
                  setState(() {
                    _imageFile = null;
                  });

                  // Clear text fields for next entry
                  _nameController.clear();
                  _phoneNumberController.clear();
                },
                child: const Text('OK', style: TextStyle(color: Colors.black)),
              ),
            ],
          );
        },
      );
    }
  }
}
