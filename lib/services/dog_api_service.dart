import 'dart:convert';
import 'package:http/http.dart' as http;

class DogApiService {
  Future<List<Map<String, dynamic>>> fetchDogs() async {
    final url = Uri.parse('https://dog.ceo/api/breeds/image/random/10');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return (data['message'] as List)
          .map((dogImage) => {'imageUrl': dogImage, 'breed': 'Unknown'})
          .toList();
    } else {
      throw Exception('Failed to fetch dogs');
    }
  }
}
