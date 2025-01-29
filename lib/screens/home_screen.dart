import 'package:flutter/material.dart';
import '../widgets/drawer_menu.dart';
import '../widgets/placa_input.dart';
import '../widgets/message_input.dart';
import '../widgets/send_button.dart';
import '../services/api_service.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController placaController = TextEditingController();
  final TextEditingController messageController = TextEditingController();
  final ApiService apiService = ApiService();

  void _sendMessage() async {
    String placa = placaController.text;
    String message = messageController.text;

    if (placa.isEmpty || message.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Por favor, preencha a placa e a mensagem.')),
      );
      return;
    }

    try {
      await apiService.sendMessage(placa, message);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Mensagem enviada com sucesso!')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erro ao enviar mensagem: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat Carro'),
      ),
      drawer: DrawerMenu(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            PlacaInput(controller: placaController),
            SizedBox(height: 20),
            MessageInput(controller: messageController),
            SizedBox(height: 20),
            SendButton(onPressed: _sendMessage),
          ],
        ),
      ),
    );
  }
}
