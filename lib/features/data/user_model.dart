class UserModel {
  String uid;
  String name;
  String email;
  bool isAdmin;

//<editor-fold desc="Data Methods">
  UserModel({
    required this.uid,
    required this.name,
    required this.email,
    required this.isAdmin,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserModel &&
          runtimeType == other.runtimeType &&
          uid == other.uid &&
          name == other.name &&
          email == other.email &&
          isAdmin == other.isAdmin);

  @override
  int get hashCode =>
      uid.hashCode ^ name.hashCode ^ email.hashCode ^ isAdmin.hashCode;

  @override
  String toString() {
    return 'UserModel{' +
        ' uid: $uid,' +
        ' name: $name,' +
        ' email: $email,' +
        ' isAdmin: $isAdmin,' +
        '}';
  }

  UserModel copyWith({
    String? uid,
    String? name,
    String? email,
    bool? isAdmin,
  }) {
    return UserModel(
      uid: uid ?? this.uid,
      name: name ?? this.name,
      email: email ?? this.email,
      isAdmin: isAdmin ?? this.isAdmin,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': this.uid,
      'name': this.name,
      'email': this.email,
      'isAdmin': this.isAdmin,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'] as String? ?? '', // Corrected
      name: map['name'] as String? ?? 'Unknown', // Corrected
      email: map['email'] as String? ?? '', // Corrected
      isAdmin: map['isAdmin'] as bool? ?? false, // Corrected
    );
  }

//</editor-fold>
}
