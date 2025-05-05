import 'package:chatapp_supabase/model/message.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AppService extends GetxController {
  final supabase = Supabase.instance.client;
  final _password = "123qwer123";

  Future<void> createUser(int i) async {
    final response = await supabase.auth.signUp(
      email: "test${i}@gmail.com",
      password: _password,
    );
    // user come from auth
    await supabase.from("contant").insert({
      'id': response.user!.id,
      "username": i,
    }).execute();
  }
    Future<void> createUsers() async {
      await createUser(1);
      await createUser(2);
    }

    Future<void> signIn(int i) async {
      await supabase.auth.signInWithPassword(
        email: "test${i}@gmail.com",
        password: _password,
      );
    }
    Future<void> signOut() async {
        await supabase.auth.signOut();
    }
    Future <String> getUserId()async {
       final response = await supabase.from('contact').select('id').not('id', 'eq', supabase.auth.currentUser!.id);
        return response.data[0] ;

    }
      Stream<List<Message>> getMessages() {
    return supabase
        .from('message')
        .stream(primaryKey: ['id'])
        .order('created_at')
        .execute()
        .map((maps) => maps
            .map((item) => Message.fromJson(item, getCurrentUserId() ))
            .toList());
  }

  
  bool isAuthentificated() => supabase.auth.currentUser != null;

  String getCurrentUserId() =>
      isAuthentificated() ? supabase.auth.currentUser!.id : '';

  String getCurrentUserEmail() =>
      isAuthentificated() ? supabase.auth.currentUser!.email ?? '' : '';

}


