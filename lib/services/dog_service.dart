import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/dog.dart';

class DogService {
  final String apiUrl = 'https://freetestapi.com/api/v1/dogs';

  Future<List<Dog>> fetchDogs() async {
    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((dog) => Dog.fromJson(dog)).toList();
    } else {
      throw Exception('Failed to load dogs');
    }
  }
}