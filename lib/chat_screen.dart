
//class chat_screen.dart
import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Importando a biblioteca intl para formatação de data
import 'message_screen.dart';
import 'story_manager.dart';
import 'qr_code_screen.dart';
import 'call_screen.dart';


class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<Map<String, dynamic>> messages = []; // Lista de mensagens com texto, timestamp e remetente
  final StoryManager _storyManager = StoryManager();
  bool _isInStoryMode = false;

  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();


  LinearGradient _backgroundGradient = const LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xFFFFFFFF), // Branco
      Color(0xFF3EB0F0), // Azul
    ],
  );

  @override
  void initState() {
    super.initState();
    // Adicionando a mensagem inicial "Olá, eu sou a Aly" ao carregar a tela
    messages.add({
      'text': 'Olá, eu sou a Aly', // Mensagem inicial
      'timestamp': DateTime.now(),
      'isSentByMe': false, // Mensagem enviada pelo sistema
    });
    messages.add({
      'text': 'Escolha uma opção:\nOi, Tudo bem?\nQuero ver uma história interativa\n',
      'timestamp': DateTime.now(),
      'isSentByMe': false,
    });

  }

  void _sendMessage() {
    if (_controller.text.isNotEmpty) {
      final message = {
        'text': _controller.text,
        'timestamp': DateTime.now(),
        'isSentByMe': true, // Adicionando informação sobre quem enviou
      };

      setState(() { // Atualizando o estado com a nova mensagem
        messages.add(message); // Adicionando a mensagem corretamente
        _controller.clear();
      });

      // Scroll para a última mensagem após atualização do layout
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      });

      // Gerar resposta do bot
      _getBotResponse(message['text'] as String);
    }
  }

  void _getBotResponse(String userMessage) {
    String botResponse;

    if (userMessage.toLowerCase().contains('Tudo bem?') || userMessage.toLowerCase().contains('Oi, Tudo bem?') || userMessage.toLowerCase().contains('tudo bem?')) {

      botResponse = 'Estou bem, obrigado por perguntar! E você?\n\nEscolha uma opção:\nEstou bem\nNão estou bem';

    } else if (userMessage.toLowerCase().contains('Estou bem') || userMessage.toLowerCase().contains('estou bem') || userMessage.toLowerCase().contains('Estou bem também') || userMessage.toLowerCase().contains('estou bem também')) {
      botResponse = 'Que bom que você está bem!\n\nEscolha uma opção:\nVer uma história interativa';

    } else if (userMessage.toLowerCase().contains('Estou mal') || userMessage.toLowerCase().contains('estou mal') || userMessage.toLowerCase().contains('Não estou bem') || userMessage.toLowerCase().contains('não estou bem')) {
      botResponse = 'Sinto muito, espero que melhore!\n\nEscolha uma opção:\nQuero um tempo sozinho\nQuero ver uma história interativa';

    } else if (userMessage.toLowerCase().contains('quero um tempo sozinho') || userMessage.toLowerCase().contains('Quero um tempo sozinho') || userMessage.toLowerCase().contains('Um tempo sozinho') || userMessage.toLowerCase().contains('um tempo sozinho')) {
      botResponse = 'Ok, você pode ficar sozinho por um tempo. Se precisar de algo, estarei aqui!'; 

    } else if (userMessage.toLowerCase().contains('ver uma história interativa') || userMessage.toLowerCase().contains('Ver uma história interativa') || userMessage.toLowerCase().contains('Quero ver uma história interativa') || userMessage.toLowerCase().contains('quero ver uma história interativa') || userMessage.toLowerCase().contains('quero a história interativa')  || userMessage.toLowerCase().contains('história interativa')) {

      _isInStoryMode = true;
      _storyManager.resetStory();
      botResponse = 'Ok, vamos lá!\n(Responda todas as questões com 1 ou 2)\n\n${_storyManager.getCurrentStepText()}';
    } else if (_isInStoryMode) {
      final choices = _storyManager.getCurrentChoices();
      if (choices.containsKey(userMessage)) {
        _storyManager.processChoice(userMessage);
        botResponse = _storyManager.getCurrentStepText();
        if (_storyManager.getCurrentChoices().isEmpty) {
          _isInStoryMode = false;
        }
      } else {
        botResponse = 'Escolha inválida. Por favor, selecione uma das opções disponíveis.';
      }


    } else if (userMessage == '3') {
      botResponse = 'Claro! Como posso ajudar?\n1. Problemas técnicos\n2. Dúvidas sobre o app\n3. Outros assuntos';
    } else {
      botResponse = 'Desculpe, não entendi sua mensagem. Aqui estão as opções disponíveis:\n1. Oi, Tudo bem?\n2. Quero ver uma história interativa';

    }


    final botMessage = {
      'text': botResponse,
      'timestamp': DateTime.now(),
      'isSentByMe': false, // Mensagem enviada pelo bot
    };

    setState(() {
      messages.add(botMessage); // Adicionando a resposta do bot
    });

    // Scroll para a última mensagem
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  void _showDescription() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const DescriptionScreen()),
    );
  }

  void _changeBackground(String choice) {
    setState(() {
      switch (choice) {
        case 'ORIGINAL':
          _backgroundGradient = const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFFFFFFF), // Branco
              Color(0xFF3EB0F0), // Azul
            ],
          );
          break;
        case 'BRANCO E ROSA':
          _backgroundGradient = const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFFFFFFF), // Branco
              Color(0xFFFF99CC), // Rosa
            ],
          );
          break;
        case 'BRANCO E VERDE':
          _backgroundGradient = const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFFFFFFF), // Branco
              Color(0xFF66FF99), // Verde
            ],
          );
          break;
        case 'BRANCO E AZUL ESCURO':
          _backgroundGradient = const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFFFFFFF), // Branco
              Color(0xFF003366), // Azul Escuro
            ],
          );
          break;
        case 'BRANCO E ROSA CHOQUE':
          _backgroundGradient = const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFFFFFFF), // Branco
              Color(0xFFFF66CC), // Rosa Choque
            ],
          );
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: GestureDetector(
          onTap: _showDescription,
          child: const AlyText('Aly', fontSize: 24), // Usando o widget personalizado AlyText
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const MessageScreen()),
            ); // Navegando para a tela de mensagens
          },
        ),
        actions: [
          Builder(
            builder: (context) => IconButton(
              icon: const Icon(Icons.more_vert),
              onPressed: () {
                Scaffold.of(context).openEndDrawer(); // Abrindo o Drawer lateral
              },
            ),
          ),
        ],
      ),
      endDrawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Configurações', style: TextStyle(color: Colors.white, fontSize: 24)),
                  SizedBox(height: 8),
                  Text('Mudar cor de fundo', style: TextStyle(color: Colors.white, fontSize: 16)),
                ],
              ),
            ),
            ListTile(
              title: const Text('ORIGINAL'),
              onTap: () {
                _changeBackground('ORIGINAL');
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              title: const Text('BRANCO E ROSA'),
              onTap: () {
                _changeBackground('BRANCO E ROSA');
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              title: const Text('BRANCO E VERDE'),
              onTap: () {
                _changeBackground('BRANCO E VERDE');
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              title: const Text('BRANCO E AZUL ESCURO'),
              onTap: () {
                _changeBackground('BRANCO E AZUL ESCURO');
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              title: const Text('BRANCO E ROSA CHOQUE'),
              onTap: () {
                _changeBackground('BRANCO E ROSA CHOQUE');
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: _backgroundGradient,
        ),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                controller: _scrollController,
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 10.0), // Adicionando padding no topo
                    child: Align(
                      alignment: messages[index]['isSentByMe'] ? Alignment.centerRight : Alignment.centerLeft,
                      child: Container(
                        margin: const EdgeInsets.all(8.0),
                        padding: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          color: messages[index]['isSentByMe'] ? const Color(0xFF5900b3) : const Color(0xFF400080), // Cor das mensagens
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Column(
                          crossAxisAlignment: messages[index]['isSentByMe'] ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                          children: [
                            Text(
                              messages[index]['text'],
                              style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
                            ),
                            Text(
                              DateFormat('HH:mm').format(messages[index]['timestamp']), // Exibindo o timestamp
                              style: const TextStyle(color: Colors.grey, fontSize: 10),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      decoration: const InputDecoration(
                        hintText: 'Digite sua mensagem...',
                        filled: true,
                        fillColor: Colors.white, // Cor da caixa de entrada de texto
                      ),
                      onSubmitted: (value) => _sendMessage(),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.send),
                    onPressed: _sendMessage,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DescriptionScreen extends StatelessWidget {
  const DescriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Descrição'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Alinhando o conteúdo à esquerda
          children: [
            const AlyText('Aly', fontSize: 40), // Usando o widget personalizado AlyText
            const SizedBox(height: 10),
            Center(
              child: CircleAvatar(
                radius: 90, // Tamanho maior do círculo
                backgroundImage: AssetImage('img/1.png'), // Usando o caminho correto da imagem
              ),
            ),
            const SizedBox(height: 20),
            RichText(
              textAlign: TextAlign.center, // Centralizando o texto
              text: TextSpan(
                style: TextStyle(fontSize: 16, color: Colors.black),
                children: [
                  TextSpan(text: 'Oi! Eu sou '),
                  TextSpan(
                    text: 'Aly',
                    style: TextStyle(
                      fontFamily: 'Sacramento',
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                  TextSpan(
                    text: ', seu assistente virtual!\n Sou um chatbot programado com diálogos e respostas inteligentes para ajudar você da melhor forma possível.',
                  ),

                ],
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.phone),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const CallScreen()),
                    );
                  },


                ),

                const SizedBox(width: 20),
                IconButton(
                  icon: const Icon(Icons.qr_code),
                  tooltip: 'Pagar com Pix',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const QrCodeScreen()),
                    );
                  },
                ),

              ],
            ),

          ],
        ),
      ),
    );
  }
}

class AlyText extends StatelessWidget {
  final String text;
  final double fontSize;

  const AlyText(this.text, {super.key, this.fontSize = 24});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: 'Sacramento',
        fontSize: fontSize,
        color: Colors.black,
      ),
    );
  }
}


