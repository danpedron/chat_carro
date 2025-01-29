import 'package:flutter/material.dart';

class MessageInput extends StatelessWidget {
  final TextEditingController controller;

  MessageInput({required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      maxLength: 120,
      maxLines: 3,
      decoration: InputDecoration(
        labelText: 'Mensagem',
        border: OutlineInputBorder(),
      ),
      style: TextStyle(fontSize: 18),
    );
  }
}
