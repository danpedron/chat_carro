import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sobre'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text('Desenvolvido por [Seu Nome]', style: TextStyle(fontSize: 24)),
            SizedBox(height: 20),
            Text('Contato: [seu email]', style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
