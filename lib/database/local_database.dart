import 'package:hive_flutter/hive_flutter.dart';
import '../models/dog_model.dart';

class LocalDatabase {
  static const String _dogBoxName = 'dogBox';

  // Initialize Hive and register the DogModelAdapter
  static Future<void> initializeHive() async {
    await Hive.initFlutter();

    // Register the DogModelAdapter manually
    DogModel.registerAdapter();

    // Open the box asynchronously
    await Hive.openBox<DogModel>(_dogBoxName);
  }

  // Get the Dog box
  static Box<DogModel> getDogBox() {
    return Hive.box<DogModel>(_dogBoxName);
  }

  // Save a dog to the database
  static Future<void> saveDog(DogModel dog) async {
    var box = await Hive.openBox<DogModel>(_dogBoxName);

    // Save the dog without a key (you can use `box.put(dog.name, dog)` to add with a key)
    await box.add(dog);
  }

  // Get all dogs from the database
  static List<DogModel> getDogs() {
    var box = Hive.box<DogModel>(_dogBoxName);
    return box.values.toList();
  }

  // Delete all dogs in the database (if needed)
  static Future<void> clearDogs() async {
    var box = await Hive.openBox<DogModel>(_dogBoxName);
    await box.clear();
  }
}
