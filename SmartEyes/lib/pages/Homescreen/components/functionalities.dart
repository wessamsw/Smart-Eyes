import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types, must_be_immutable
class functionalities extends StatelessWidget {
  final String smarteyesfunc;
  final String iconPath;
  final bool powerOn;
  void Function(bool)? onChanged;

  functionalities({
    super.key,
    required this.smarteyesfunc,
    required this.iconPath,
    required this.powerOn,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: Colors.black,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // icon
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 14.0, vertical: 10.0),
              child: Image.asset(
                iconPath,
                height: 50,
                color: Colors.white,
              ),
            ),

            // functionality name
            Padding(
              padding: const EdgeInsets.only(left: 12.0, top: 4.0, right: 12.0),
              child: Text(
                smarteyesfunc,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                  color: Colors.white,
                ),
              ),
            ),

            // switch
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Transform.rotate(
                    angle:
                        0, // Adjust rotation angle to make the switch horizontal
                    child: CupertinoSwitch(
                      value: powerOn,
                      onChanged: onChanged,
                      activeColor: Colors.green,
                      trackColor: powerOn ? Colors.green : Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
