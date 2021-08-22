import 'package:flutter/material.dart';
import '../constants.dart';

class IconContent extends StatelessWidget {
  IconContent({required this.icon, required this.textContent});

  final IconData icon;
  final String textContent;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Icon(FontAwesomeIcons.mars, size: 80.0),
        Icon(icon, size: 80.0),
        SizedBox(height: 14.0),
        Text(
          textContent,
          style: kLabelTextStyle,
        ),
      ],
    );
  }
}
