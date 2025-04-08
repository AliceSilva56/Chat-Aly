import 'package:flutter/material.dart';
import 'chat_screen.dart';

class MessageScreen extends StatelessWidget {
  const MessageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFFFFFFF), // Branco
              Color(0xFF3EB0F0), // Azul
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 50.0), // Adicionando Padding para que o card fique abaixo da barra de status
          child: Align(
            alignment: Alignment.topCenter,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ChatScreen()), // Navegando de volta para o chat
                );
              },
              child: Card( // Adicionando um Card retangular
                elevation: 4, // Sombra do card
                shape: RoundedRectangleBorder( // Adicionando borda ao card
                  side: const BorderSide(color: Colors.black, width: 1), // Definindo a cor e a largura da borda
                  borderRadius: BorderRadius.circular(8), // Arredondando os cantos
                ),
                color: Colors.white, // Cor do card
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column( // Alterando para Column para alinhar verticalmente
                    mainAxisSize: MainAxisSize.min, // Ocupa apenas o espaço necessário
                    children: [
                      Row( // Alinhando a imagem e o texto
                        children: [
                          CircleAvatar(
                            radius: 30, // Tamanho do círculo
                            backgroundImage: AssetImage('img/aly.png'), // Usando o caminho correto da imagem
                          ),
                          const SizedBox(width: 10), // Espaçamento entre a imagem e o texto
                          Column( // Coluna para o texto
                            crossAxisAlignment: CrossAxisAlignment.start, // Alinhamento à esquerda
                            children: const [
                              Text(
                                'Aly',
                                style: TextStyle(
                                  fontFamily: 'sacramento',
                                  fontSize: 24,
                                  color: Colors.black, // Cor do texto
                                ),
                              ),
                              SizedBox(height: 4), // Espaçamento entre o nome e a mensagem
                              Text(
                                'Você tem uma nova mensagem',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black, // Cor do texto
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}