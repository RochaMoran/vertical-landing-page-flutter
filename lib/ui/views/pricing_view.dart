import 'package:flutter/material.dart';

class PricingView extends StatelessWidget {
  const PricingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.redAccent,
      child: const Center(
        child: FittedBox(
          fit: BoxFit.contain,
          child: Text(
            'Pricing View',
          ),
        ),
      ),
    );
  }
}