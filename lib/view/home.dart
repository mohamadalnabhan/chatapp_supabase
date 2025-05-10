import 'package:chatapp_supabase/controller/app_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _controller = Get.find<AppService>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo, // AppBar color
        title: Text(
          _controller.isAuthentificated()
              ? _controller.getCurrentUserEmail()
              : "chat",style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.indigo, // Button color
              ),
              onPressed: () {
                _controller.createUsers();
                print('done');
              },
              child: Text("Create users", style: TextStyle(color: Colors.white),),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.indigo,
              ),
              onPressed: () {
                _controller.signIn(1);
                print("done");
              },
              child: Text("Login user 1"  ,style: TextStyle(color: Colors.white),),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.indigo,
              ),
              onPressed: () {
                _controller.signIn(2);
                print("login 2");
              },
              child: Text("Login user 2",style: TextStyle(color: Colors.white),),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.indigo,
              ),
              onPressed: () {
                _controller.signOut();
              },
              child: Text("Sign out",style: TextStyle(color: Colors.white),),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.indigo,
              ),
              onPressed: () {
                Get.toNamed('/chatpage');
              },
              child: Text("Move to the chat",style: TextStyle(color: Colors.white),),
            ),
          ],
        ),
      ),
    );
  }
}
