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
}
