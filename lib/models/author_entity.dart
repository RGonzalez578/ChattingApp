class AuthorEntity {
  String username;
  AuthorEntity({required this.username});

  factory AuthorEntity.fromJson(Map<String, dynamic> json){
    return AuthorEntity(username: json['username']);
  }
}
