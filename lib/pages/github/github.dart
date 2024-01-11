import 'package:flutter/material.dart';
import 'dart:html' as html;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class GitHub extends StatelessWidget {
  const GitHub({super.key});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {
        html.window.open('https://github.com/QisthiAH/qisthi-fb', 'new tab');
      },
      child: const Padding(
        padding: EdgeInsets.all(8),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            FaIcon(FontAwesomeIcons.github),
            SizedBox(width: 10),
            Text('Go to GitHub'),
          ],
        ),
      ),
    );
  }
}
