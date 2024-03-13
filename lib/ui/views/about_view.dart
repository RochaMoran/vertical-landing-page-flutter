import 'package:flutter/material.dart';

class AboutView extends StatelessWidget {
  const AboutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.purple,
      child: const Center(
        child: FittedBox(
          fit: BoxFit.contain,
          child: Text(
            'About View',
          ),
        ),
      ),
    );
  }
}