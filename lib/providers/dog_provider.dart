import 'package:flutter/material.dart';
import '../models/dog.dart';
import '../services/dog_service.dart';

class DogProvider with ChangeNotifier {
  List<Dog> _dogs = [];
  bool _isLoading = false;

  List<Dog> get dogs => _dogs;
  bool get isLoading => _isLoading;

  Future<void> fetchDogs() async {
    _isLoading = true;
    notifyListeners();
    try {
      DogService dogService = DogService();
      _dogs = await dogService.fetchDogs();
    } catch (error) {
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}