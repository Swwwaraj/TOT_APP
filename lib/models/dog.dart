class Dog {
  final String name;
  final String breed;
  final String imageUrl;

  Dog({required this.name, required this.breed, required this.imageUrl});

  factory Dog.fromJson(Map<String, dynamic> json) {
    return Dog(
      name: json['name'],
      breed: json['breed'],
      imageUrl: json['image'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'breed': breed,
      'imageUrl': imageUrl,
    };
  }
}