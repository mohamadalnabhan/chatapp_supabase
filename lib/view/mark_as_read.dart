// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:chatapp_supabase/controller/app_service.dart';
import 'package:flutter/material.dart';

import 'package:chatapp_supabase/model/message.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class MarkAsRead extends StatelessWidget {
  final _controller = Get.find<AppService>();
  Message message ;
  MarkAsRead({
    Key? key,
    required this.message,
  }) : super(key: key);
  final _markRead = Icon(Icons.mark_chat_read , color: Colors.indigo,);
  final _markNotRead = Icon(Icons.mark_as_unread , color: Colors.grey,);





  Future<Widget> _getMarked(BuildContext context) async {
  if (message.is_mine ==  false){
    if(message.mark_as_read ==  false){
      await _controller.MarkAsRead(message.id);
    }
    return SizedBox.shrink();
  }
  if(message.is_mine == true){
    if(message.mark_as_read == true){
      return _markRead ;
    }else {
      return _markNotRead ;
    }
  }

return  SizedBox.shrink();
  }


  Widget build(BuildContext context) {
    return FutureBuilder(future: _getMarked(context), builder: (context ,snapshot){
      if(snapshot.hasData){
        return snapshot.data as Widget ;
      }
     return  SizedBox.shrink();
    });
  }
}
