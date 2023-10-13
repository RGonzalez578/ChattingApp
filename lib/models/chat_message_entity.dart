import 'author_entity.dart';

class ChatMessageEntity {
  String text;
  String? imageUrl;
  String id;
  int createdAt;
  bool delivered;
  bool viewed;
  AuthorEntity author;
  AuthorEntity receiver;

  ChatMessageEntity(
      {required this.text,
      this.imageUrl,
      required this.id,
      required this.createdAt,
      required this.delivered,
      required this.viewed,
      required this.author,
      required this.receiver});

  factory ChatMessageEntity.fromJson(Map<String, dynamic> json) {
    return ChatMessageEntity(
        text: json['text'],
        id: json['id'],
        imageUrl: json['imageUrl'],
        createdAt: json['createdAt'],
        delivered: json['delivered'],
        viewed: json['viewed'],
        author: AuthorEntity.fromJson(json['author']) ,
        receiver: AuthorEntity.fromJson(json['receiver']));
  }
}
