import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TOT APP'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Navigate to dog details screen
          },
          child: const Text('View Dogs'),
        ),
      ),
    );
  }
}
