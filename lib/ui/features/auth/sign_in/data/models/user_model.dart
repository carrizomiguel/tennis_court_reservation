import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  const UserModel({
    required this.email,
    required this.name,
    required this.avatarUrl,
  });

  const UserModel.empty()
      : this(
          email: '',
          name: '',
          avatarUrl: '',
        );

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      email: json['email'] as String,
      name: json['name'] as String,
      avatarUrl: json['avatar_url'] as String,
    );
  }

  final String email;
  final String name;
  final String avatarUrl;

  @override
  List<Object> get props => [
        email,
        name,
        avatarUrl,
      ];
}
