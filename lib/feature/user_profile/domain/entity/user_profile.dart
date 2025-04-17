
class UserProfileEntity {
  final String name;
  final String email;
  final String address;
  final String password;

  const UserProfileEntity({
    required this.name,
    required this.email,
    required this.address,
    required this.password,
  });

  static const empty = UserProfileEntity(
    name: '',
    email: '',
    address: '',
    password: '',
  );

  UserProfileEntity copyWith({
    String? name,
    String? email,
    String? address,
    String? password,
  }) {
    return UserProfileEntity(
      name: name ?? this.name,
      email: email ?? this.email,
      address: address ?? this.address,
      password: password ?? this.password,
    );
  }
}
