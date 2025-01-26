import 'package:flutter/material.dart';
import '../models/dog.dart';

class DogDetailScreen extends StatelessWidget {
  final Dog dog;

  DogDetailScreen({required this.dog});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(dog.name)),
      body: Column(
        children: [
          Image.network(dog.imageUrl),
          SizedBox(height: 10),
          Text('Breed: ${dog.breed}'),
        ],
      ),
    );
  }
}