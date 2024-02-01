class UserModel {
  String? userId; // doc.set => id'yi alır.
  String? name;
  String? surname;
  String? description;
  String? github;
  String? instagram;
  String? linkedin;
  String? email;
  String? username;
  String? profilePhoto;

  UserModel({
    this.name,
    this.surname,
    this.description,
    this.github,
    this.instagram,
    this.linkedin,
    this.profilePhoto,
    this.userId,
    this.email,
    this.username,
  });

  factory UserModel.fromMap(Map<String, dynamic> json) {
    return UserModel(
      userId: json['userId'] as String?,
      email: json['email'] as String,
      username: json['username'] as String,
      name: json['name'] as String?,
      surname: json['surname'] as String?,
      description: json['description'] as String?,
      github: json['github'] as String?,
      instagram: json['instagram'] as String?,
      linkedin: json['linkedin'] as String?,
      profilePhoto: json['profilePhoto'] as String?,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'email': email,
      'username': username,
      'name': name,
      'surname': surname,
      'description': description,
      'github': github,
      'instagram': instagram,
      'linkedin': linkedin,
      'profilePhoto': profilePhoto,
    };
  }
}
