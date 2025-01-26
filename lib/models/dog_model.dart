import 'package:hive/hive.dart';

class DogModel extends HiveObject {
  final String name;
  final String breed;
  final String imageUrl;

  DogModel({required this.name, required this.breed, required this.imageUrl});

  // Manually defining the adapter
  static final TypeAdapter<DogModel> adapter = _DogModelAdapter();

  static void registerAdapter() {
    Hive.registerAdapter(adapter);
  }
}

// Manually creating the adapter
class _DogModelAdapter extends TypeAdapter<DogModel> {
  @override
  final int typeId = 0;

  @override
  DogModel read(BinaryReader reader) {
    final name = reader.readString();
    final breed = reader.readString();
    final imageUrl = reader.readString();
    return DogModel(name: name, breed: breed, imageUrl: imageUrl);
  }

  @override
  void write(BinaryWriter writer, DogModel obj) {
    writer.writeString(obj.name);
    writer.writeString(obj.breed);
    writer.writeString(obj.imageUrl);
  }
}
