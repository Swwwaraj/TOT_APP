import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/dog_provider.dart';
import 'dog_detail_screen.dart';

class DogListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final dogProvider = Provider.of<DogProvider>(context);
    
    return Scaffold(
      appBar: AppBar(title: Text('Dog List')),
      body: dogProvider.isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: dogProvider.dogs.length,
              itemBuilder: (context, index) {
                final dog = dogProvider.dogs[index];
                return ListTile(
                  title: Text(dog.name),
                  subtitle: Text(dog.breed),
                  leading: Image.network(dog.imageUrl),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DogDetailScreen(dog: dog),
                      ),
                    );
                  },
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          dogProvider.fetchDogs();
        },
        child: Icon(Icons.refresh),
      ),
    );
  }
}