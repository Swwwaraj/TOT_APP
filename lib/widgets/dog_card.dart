import 'package:flutter/material.dart';

class DogCard extends StatelessWidget {
  final String imageUrl;
  final String name;

  const DogCard({required this.imageUrl, required this.name, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Image.network(imageUrl),
          Text(name, style: TextStyle(fontSize: 18)),
        ],
      ),
    );
  }
}
