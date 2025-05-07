import 'package:chatapp_supabase/controller/app_service.dart';
import 'package:chatapp_supabase/view/chat_page.dart';
import 'package:chatapp_supabase/view/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://oizmbpiqkscgluwbhffy.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im9pem1icGlxa3NjZ2x1d2JoZmZ5Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDYxODYwODQsImV4cCI6MjA2MTc2MjA4NH0.zwvep1o2pKeClHPyKiXJft7I4pRtnv_rxDz2TuvXF3E',
  );
  Get.put(AppService());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.indigo ),

       home : Home(),
       getPages: [
      
          GetPage(name: '/chatpage', page:()=> ChatPage())
       ],
    );
  }
}
