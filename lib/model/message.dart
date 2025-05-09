import 'dart:convert';

class Message {
  final String id;
  final String content;
  final bool mark_as_read;
  final String user_from;
  final String user_to;
  final DateTime created_at;
  final bool is_mine;

  Message({
    required this.id,
    required this.content,
    required this.mark_as_read,
    required this.user_from,
    required this.user_to,
    required this.created_at,
    required this.is_mine,
  });
  Message.create({
    required this.content,
    required this.user_from,
    required this.user_to,
  }) : id = '',
       mark_as_read = false,
       created_at = DateTime.now(),
       is_mine = true;

  // ignore: avoid_types_as_parameter_names
  factory Message.fromJson(Map<String, dynamic> json, String userId) {
    return Message(
      id: json['id']?.toString() ?? '',
      content: json['content']?.toString() ?? '',
      mark_as_read: json['mark_as_read'] ?? false,
      user_from: json['user_from']?.toString() ?? '',
      user_to: json['user_to']?.toString() ?? '',
      created_at: DateTime.parse(json['created_at']?.toString() ?? 
          DateTime.now().toIso8601String()),
      is_mine: json['user_from']?.toString() == userId,
    );
  }
  Map toMap() {
    return {
      'content': content,
      'user_from': user_from,
      'user_to': user_to,
      "mark_as_read": mark_as_read,
    };
  }
}
