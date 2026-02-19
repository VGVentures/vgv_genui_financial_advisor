import 'package:finance_app/simple_chat/chat_screen.dart';
import 'package:flutter/material.dart';

class SimpleChatApp extends StatelessWidget {
  const SimpleChatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Chat Controller',
      theme: ThemeData(),
      darkTheme: ThemeData.dark(),
      home: const ChatScreen(),
    );
  }
}
