import 'package:flutter/material.dart';

class EmergencyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Emergency Button'),
      ),
      body: Center(
        child: GestureDetector(
          onLongPress: () {
            // Navigate to emergency contacts screen
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => EmergencyContactsScreen()),
            );
          },
          child: Container(
            width: 150.0,
            height: 150.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.red,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  spreadRadius: 2,
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.warning,
                    color: Colors.white,
                    size: 40.0,
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    'Emergency',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                    ),
                  ),
                  const Text(
                    'Hold',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class EmergencyContactsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Emergency Contacts'),
      ),
      body: ListView(
        children: const <Widget>[
          ListTile(
            title: Text('Emergency Contact 1'),
            subtitle: Text('Phone: 123-456-7890'),
          ),
          ListTile(
            title: Text('Emergency Contact 2'),
            subtitle: Text('Phone: 987-654-3210'),
          ),
          // Add more emergency contacts as needed
        ],
      ),
    );
  }
}
