import 'package:chatapp_supabase/controller/app_service.dart';
import 'package:chatapp_supabase/model/message.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  final _controller = Get.find<AppService>();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('chat')),
      body: StreamBuilder<List<Message>>(
        stream: _controller.getMessages(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final messages = snapshot.data!;
            return Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: messages.length,
                      reverse: true,
                      itemBuilder: (context, index) {
                        final message = messages[index];
                        return Text(message.content);
                      },
                    ),
                  ),
                ],
              ),
            );
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
