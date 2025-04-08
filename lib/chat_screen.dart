import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Importando a biblioteca intl para formatação de data
import 'message_screen.dart';
import 'story_manager_vermelho.dart';
import 'qr_code_screen.dart';
import 'call_screen.dart';
import 'configuracoes_manager.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<Map<String, dynamic>> messages = []; // Lista de mensagens com texto, timestamp e remetente
  final StoryManagerVermelho _storyManager = StoryManagerVermelho();
  final ConfiguracoesManager _configuracoesManager = ConfiguracoesManager();
  bool _isInStoryMode = false;
  bool _showColorOptions = false; // Novo estado para controlar a visibilidade das opções de cores
  bool _showMessageColorOptions = false; // Estado para controlar a visibilidade das opções de cores das mensagens
  Color _botMessageColor = const Color(0xFF129ded); // Cor padrão da mensagem do bot
  Color _userMessageColor = const Color(0xFF3eb0f0); // Cor padrão da mensagem do usuário

  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();

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

      setState(() {
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

    if (userMessage.toLowerCase().contains('tudo bem?')) {
      botResponse = 'Estou bem, obrigado por perguntar! E você?\n\nEscolha uma opção:\nEstou bem\nNão estou bem';
    } else if (userMessage.toLowerCase().contains('estou bem')) {
      botResponse = 'Que bom que você está bem!\n\nEscolha uma opção:\nVer uma história interativa';
    } else if (userMessage.toLowerCase().contains('não estou bem')) {
      botResponse = 'Sinto muito, espero que melhore!\n\nEscolha uma opção:\nQuero um tempo sozinho\nQuero ver uma história interativa';
    } else if (userMessage.toLowerCase().contains('ver uma história interativa')) {
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
    } else {
      botResponse = 'Desculpe, não entendi sua mensagem. Aqui estão as opções disponíveis:\nOi, Tudo bem?\nQuero ver uma história interativa';
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
              title: const Text('Mudar cor de fundo'),
              onTap: () {
                setState(() {
                  _showColorOptions = !_showColorOptions;
                });
              },
            ),
            ListTile(
              title: const Text('Mudar cor da conversa'),
              onTap: () {
                setState(() {
                  _showMessageColorOptions = !_showMessageColorOptions;
                });
              },
            ),
            if (_showMessageColorOptions) ...[
              ListTile(
                title: const Text('ORIGINAL'),
                onTap: () {
                  _botMessageColor = const Color(0xFF129ded);
                  _userMessageColor = const Color(0xFF3eb0f0);
                  setState(() {});
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                title: const Text('ROSA'),
                onTap: () {
                  _botMessageColor = const Color(0xFFFF4DA6);
                  _userMessageColor = const Color(0xFFFF80BF);
                  setState(() {});
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                title: const Text('VERDE'),
                onTap: () {
                  _botMessageColor = const Color(0xFF00FF55);
                  _userMessageColor = const Color(0xFF4DFF88);
                  setState(() {});
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                title: const Text('AZUL ESCURO'),
                onTap: () {
                  _botMessageColor = const Color(0xFF0066CC);
                  _userMessageColor = const Color(0xFF0080FF);
                  setState(() {});
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                title: const Text('ROSA CHOQUE'),
                onTap: () {
                  _botMessageColor = const Color(0xFFCC0088);
                  _userMessageColor = const Color(0xFFFF00AA);
                  setState(() {});
                  Navigator.of(context).pop();
                },
              ),
            ],
          ],
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: _configuracoesManager.backgroundGradient,
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
                          color: messages[index]['isSentByMe'] ? _userMessageColor : _botMessageColor, // Cor das mensagens
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
                backgroundImage: AssetImage('img/aly.png'), // Usando o caminho correto da imagem
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