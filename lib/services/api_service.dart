import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = 'https://geekserver.dynu.net/dan/chat_carro/api';

  Future<void> cadastrarUsuario(String nome, String email, String senha) async {
    final response = await http.post(
      Uri.parse('$baseUrl/cadastrar.php'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'nome': nome, 'email': email, 'senha': senha}),
    );

    if (response.statusCode != 200) {
      throw Exception('Erro ao cadastrar usuário');
    }
  }

  Future<void> login(String email, String senha) async {
    final response = await http.post(
      Uri.parse('$baseUrl/login.php'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email, 'senha': senha}),
    );

    if (response.statusCode != 200) {
      throw Exception('Erro ao fazer login');
    }
  }

  Future<void> sendMessage(String placa, String message) async {
    final response = await http.post(
      Uri.parse('$baseUrl/enviar_mensagem.php'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'placa': placa, 'mensagem': message}),
    );

    if (response.statusCode != 200) {
      throw Exception('Erro ao enviar mensagem');
    }
  }
}
