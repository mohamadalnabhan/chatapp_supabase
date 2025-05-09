import 'package:chatapp_supabase/controller/app_service.dart';
import 'package:chatapp_supabase/model/message.dart';
import 'package:chatapp_supabase/view/chat_bubble.dart';
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
  final _formKey = GlobalKey<FormState>();
  final _messageController = TextEditingController();

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  Future<void> submit() async {
    print('Submit triggered!'); // Debug 1
    if (_formKey.currentState == null) {
      print('Form state is null!'); // Debug 2
      return;
    }
    if (!_formKey.currentState!.validate()) {
      print('Form validation failed!'); // Debug 3
      return;
    }
    print('Form validated, proceeding...'); // Debug 4

    try {
      await _controller.saveMessage(_messageController.text);
      print('Message submitted successfully!'); // Debug 5
      _messageController.clear();
    } catch (e) {
      print('Submission error: $e'); // Debug 6
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('chat'), centerTitle: true),
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
                        return  ChatBubble(message: message);
                      },
                    ),
                  ),
                  Form(
                    key: _formKey,
                    child: SafeArea(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: _messageController,
                          decoration: InputDecoration(
                            labelText: "message",
                            suffixIcon: IconButton(
                              onPressed: () {
                                submit();
                              },
                              icon: Icon(Icons.send),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 25),
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
