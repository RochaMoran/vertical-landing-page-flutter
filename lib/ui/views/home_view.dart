import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      child: const Center(
        child: FittedBox(
          fit: BoxFit.contain,
          child: Text(
            'Home View',
          ),
        ),
      ),
    );
  }
}