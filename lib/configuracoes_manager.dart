import 'package:flutter/material.dart';

class ConfiguracoesManager {
  LinearGradient _backgroundGradient = const LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xFFFFFFFF), // Branco
      Color(0xFF3EB0F0), // Azul
    ],
  );

  LinearGradient get backgroundGradient => _backgroundGradient;

  void changeBackground(String choice) {
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
  }
}
