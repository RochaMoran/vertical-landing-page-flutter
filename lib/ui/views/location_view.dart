import 'package:flutter/material.dart';

class LocationView extends StatelessWidget {
  const LocationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.lightBlue,
      child: const Center(
        child: FittedBox(
          fit: BoxFit.contain,
          child: Text(
            'Location View',
          ),
        ),
      ),
    );
  }
}