import 'package:flutter/material.dart';

class ContactView extends StatelessWidget {
  const ContactView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow,
      child: const Center(
        child: FittedBox(
          fit: BoxFit.contain,
          child: Text(
            'Contact View',
          ),
        ),
      ),
    );
  }
}