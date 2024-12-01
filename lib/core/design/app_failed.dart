import 'package:flutter/material.dart';

class AppFailed extends StatelessWidget {
  final String msg;
  const AppFailed({super.key, required this.msg});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(msg,style: TextStyle(color: Colors.red,fontSize: 30,fontWeight: FontWeight.bold),));
  }
}
