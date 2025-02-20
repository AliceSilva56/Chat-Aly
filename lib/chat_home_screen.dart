import 'package:flutter/material.dart';
import 'chat_screen.dart';

class ChatHomeScreen extends StatelessWidget {
  final String? errorMessage; // Adicionando parâmetro para mensagem de erro

  const ChatHomeScreen({super.key, this.errorMessage}); // Modificando o construtor

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('Aly'),
      ),
      body: Column( // Alterando para exibir a mensagem de erro
        children: [
          if (errorMessage != null) // Verificando se há mensagem de erro
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                errorMessage!,
                style: TextStyle(color: Colors.red, fontSize: 16), // Estilo da mensagem de erro
              ),
            ),
          const ChatScreen(),
        ],
      ),
    );
  }
}
