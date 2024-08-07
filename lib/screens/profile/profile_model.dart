class ProfileModel {
  late String name;
  late String imagePath;


  ProfileModel({
    required this.name,
    required this.imagePath,
  });

  factory ProfileModel.fromMap(Map<String, dynamic> map) {
    return ProfileModel(
      name: map['username'] ?? '',
      imagePath: map['profileimage'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'username': name,
      'profileimage': imagePath,
    };
  }
}
