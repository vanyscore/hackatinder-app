class UserModel {
  final String name;
  final String lastname;
  final int vkId;
  final String photoUrl;
  final List<String> skills;

  String get fullName => '$name $lastname';

  const UserModel({
    required this.name,
    required this.lastname,
    required this.vkId,
    required this.photoUrl,
    required this.skills,
  });

  factory UserModel.fromJson(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'] as String,
      lastname: map['lastname'] as String,
      vkId: map['vk_id'] as int,
      photoUrl: map['photo'],
      skills:
          (map['skills'] as List<dynamic>).map((e) => e.toString()).toList(),
    );
  }
}
