class User {
  final int id;
  final String name;
  final String imageUrl;
  final bool isActive;

  User({
    required this.id,
    required this.name,
    required this.imageUrl,
    this.isActive = false,
  });
}
