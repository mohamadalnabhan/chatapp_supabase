import 'package:chatapp_supabase/controller/app_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _controller = Get.find<AppService>();

  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
        title: Text(
          _controller.isAuthentificated()
              ? _controller.getCurrentUserEmail()
              : "chat",
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(onPressed: (){
            _controller.createUsers();
            print('done');
          }, child:Text( "created users")
          ),
          const SizedBox(height: 10,),
          ElevatedButton(onPressed: (){
            _controller.signIn(1);
            print("done");
          }, child:Text( "Login user 1")
          ),
          const SizedBox(height: 10,),
          ElevatedButton(onPressed: (){
            _controller.signIn(2);
            print("login 2" );
          }, child:Text( "Login user 2")
          ),
          const SizedBox(height: 10,)
          ,ElevatedButton(onPressed: (){
            _controller.signOut();
          }, child:Text( "Signout")
          ),
          const SizedBox(height: 10,)
           ,ElevatedButton(onPressed: (){
            Get.toNamed('/chatpage');
          }, child:Text( " move to the chat ")
          )
        ],
      ),
    );
  }
}
