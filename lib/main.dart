import 'package:flutter/material.dart';
import 'package:post_get_api_example/home_screen/Album_screen.dart';
import 'package:post_get_api_example/home_screen/comment_screen.dart';
import 'package:post_get_api_example/home_screen/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: CommentScreen()
    );
  }
}
