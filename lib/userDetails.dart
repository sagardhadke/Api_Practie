import 'package:flutter/material.dart';

class MyUserDetails extends StatefulWidget {
  const MyUserDetails({super.key});

  @override
  State<MyUserDetails> createState() => _MyUserDetailsState();
}

class _MyUserDetailsState extends State<MyUserDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("API User Details"),
        backgroundColor: Colors.amber,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

        ],
      ),
    );
  }
}