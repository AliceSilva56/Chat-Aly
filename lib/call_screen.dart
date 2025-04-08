import 'dart:async';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class CallScreen extends StatefulWidget {
  const CallScreen({super.key});

  @override
  CallScreenState createState() => CallScreenState();
}

class CallScreenState extends State<CallScreen> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  bool _isSpeakerOn = false;
  int _callDuration = 0;
  late Timer _callTimer;
  bool _isCalling = true;

  String durationText() {
    return 'Duração: ${_callDuration ~/ 60}:${(_callDuration % 60).toString().padLeft(2, '0')}';
  }

  Future<void> _playAudio() async {
    try {
      debugPrint('Tentando reproduzir o áudio...');
      if (!mounted) return;
      await _audioPlayer.play(DeviceFileSource('assets/som/Aly.mp3'));
      debugPrint('Áudio reproduzido com sucesso.');
      await _audioPlayer.setVolume(_isSpeakerOn ? 0.8 : 0.4);
      await _audioPlayer.setReleaseMode(ReleaseMode.stop);
      
      // Listen for audio completion
      _audioPlayer.onPlayerComplete.listen((_) async {
        if (!mounted) return;
        await _stopAudio();
        if (mounted) {
          Navigator.pop(context);
        }
      }, onError: (error) {
        debugPrint('Erro ao completar o áudio: $error');
        if (mounted) {
          Navigator.pop(context);
        }
      });
    } catch (e) {
      debugPrint('Erro ao reproduzir o áudio: $e');
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Erro ao completar a ligação, tente novamente mais tarde'),
          duration: Duration(seconds: 2),
        ),
      );
      await _stopAudio();
      if (mounted) {
        Navigator.pop(context);
      }
    }
  }

  Future<void> _stopAudio() async {
    await _audioPlayer.stop();
    await _audioPlayer.setReleaseMode(ReleaseMode.release);
  }

  @override
  void initState() {
    super.initState();
    
    // Start call timer but don't count until audio starts
    _callTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (mounted && !_isCalling) {
        setState(() {
          _callDuration++;
        });
      }
    });

    // Adiciona delay de 3 segundos antes de iniciar o áudio
    Future.delayed(const Duration(seconds: 3), () async {
      if (!mounted) return;
      try {
        await _playAudio();
        if (!mounted) return;
        setState(() {
          _isCalling = false;
        });
      } catch (e) {
        debugPrint('Error in delayed audio play: $e');
        if (!mounted) return;
        Navigator.pop(context);
      }
    });
  }

  @override
  void dispose() {
    _audioPlayer.stop();
    _audioPlayer.dispose();
    _callTimer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage('img/aly.png'),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Aly',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                      ),
                    ),
                    SizedBox(height: 10),
                    if (_isCalling)
                      Text(
                        'Chamando...',
                        style: TextStyle(
                          color: Colors.white54,
                          fontSize: 16,
                        ),
                      ),
                    Text(
                      durationText(),
                      style: TextStyle(
                        color: Colors.white54,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    icon: Icon(
                      _isSpeakerOn ? Icons.volume_up : Icons.volume_off,
                      color: Colors.white,
                      size: 30,
                    ),
                    onPressed: () async {
                      setState(() {
                        _isSpeakerOn = !_isSpeakerOn;
                      });
                       // Alterna entre volume normal (0.5) e alto (1.0)
                      await _audioPlayer.setVolume(_isSpeakerOn ? 0.8 : 0.4);
                    },
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.videocam,
                      color: Colors.grey,
                      size: 30,
                    ),
                    onPressed: null,
                  ),
                  FloatingActionButton(
                    backgroundColor: Colors.red,
                    child: const Icon(Icons.call_end),
                    onPressed: () {
                      _stopAudio();
                      Navigator.pop(context);
                    },
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
