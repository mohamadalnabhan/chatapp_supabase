// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:chatapp_supabase/model/message.dart';

class ChatBubble extends StatelessWidget {
  Message message;
  ChatBubble({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var chatContent = [
      const SizedBox(width: 12),
      Flexible(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: message.is_mine ? Colors.blueGrey : Colors.indigo,
          ),
          child: Text(message.content, style: TextStyle(color: Colors.white)),
        ),
      ),
      const SizedBox(width: 12),
      Text(
        message.created_at.toString(),
        style: TextStyle(color: Colors.grey, fontSize: 8),
      ),
         const SizedBox(width: 60),
    ];
    if(message.is_mine){
      chatContent = chatContent.reversed.toList();
    }

    return Padding(padding: EdgeInsets.symmetric(vertical: 8 ,horizontal: 12),
    child: Row(
      mainAxisAlignment: message.is_mine ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: chatContent,
    ),
    );
  }
}
