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
  Message.fromJson(Map<String, dynamic> json, String userId)
    : id = json['id'],
      content = json['content'],
      mark_as_read = json['mark_as_read'],
      user_from = json["user_from"],
      user_to = json["user_to"],
      created_at = DateTime.parse(json['createc_at']),
    is_mine = json['user_from'] == userId;


  Map toMap() {
    return {
      'content': content,
      'user_from': user_from,
      'user_to': user_to,
      "mark_as_read": mark_as_read,
    };
  }
}
