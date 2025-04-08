class StoryManagerVermelho {

  int _currentStep = 0;
  final Map<int, StoryStep> _steps = {};

  StoryManagerVermelho() {

    _initializeStory();
  }

  void _initializeStory() {
    // Initial story setup
    _steps[0] = StoryStep(
      text:
          'Chapeuzinho vermelho era uma menina que morava em uma bela casa com sua mãe.\n'
          'A menina sempre usava uma capa e um pequeno chapéu na cor vermelha.\n'
          'Um belo dia, sua mãe pediu para que a Chapeuzinho vermelho fosse levar uma cesta para sua vovó que estava doente.\n\n'

          '(Decisão 1)\n'
          'Levar a cesta?\n\n'
          '1. Sim\n'
          '2. Não',
      choices: {
        '1': 1,
        '2': 2,
      },
    );

    _steps[1] = StoryStep(
      text:
          'A mãe continua: Mas evite o caminho da floresta, pois ele é muito perigoso e não fale com estranhos.\n'
          'A Chapeuzinho vermelho amava sua vó e saiu rapidamente de casa, no caminho pensou em fazer uma surpresa para sua vó?\n\n'

          '(Decisão 2)\n'
          'Fazer a surpresa?\n\n'
          '1. Sim\n'
          '2. Não',
      choices: {
        '1': 3,
        '2': 4,
      },
    );

    _steps[2] = StoryStep(
      text: 'Cesta negada, vida ceifada.\n\n'
          'Fim do jogo.\n'
          'Se quiser começar de novo, digite "história interativa"',
      choices: {},
    );

    _steps[3] = StoryStep(
      text:
          'Ela começou a colher flores para levar para a vovó, enquanto estava distraída com as flores, deu de cara com o lobo, que logo a cumprimentou:\n'
          '- Bom dia, Chapeuzinho Vermelho\n'
          '- Bom dia, Lobo\n'
          'O lobo pergunta para onde ela está indo tão cedo?\n'
          'Responder ao lobo?\n\n'

          '(Decisão 3)\n'
          '1. Responder\n'
          '2. Ignorar',
      choices: {
        '1': 5,
        '2': 6,
      },
    );

    _steps[4] = StoryStep(
      text:
          'Ela continuou seu caminho cantarolando, enquanto estava distraída, deu de cara com o lobo, que logo a cumprimentou:\n'
          '- Bom dia, Chapeuzinho Vermelho\n'
          '- Bom dia, Lobo\n'
          'O lobo pergunta: para onde ela está indo tão cedo?\n'
          'Responder ao lobo?\n'

          '(Decisão 3)\n'
          '1. Responder\n'
          '2. Ignorar',
      choices: {
        '1': 5,
        '2': 6,
      },
    );

    _steps[5] = StoryStep(
      text: 'Ela responde:\n'
          '-Vou visitar a minha vovozinha, que está muito doente.\n'
          'O lobo esperto disse:\n'
          '- Por que você não vai pela floresta? É o caminho mais rápido para qualquer lugar\n'
          'Ela fica em dúvida, pois não gosta de desobedecer a sua mãe, então escolhe:\n\n'

          '(Decisão 4)\n'
          '1. Ir pela floresta\n'
          '2. Continuar pelo caminho seguro',
      choices: {
        '1': 7,
        '2': 8,
      },
    );

    _steps[6] = StoryStep(
      text: 'O lobo ignora essa resposta e diz:\n'
          '- Por que você não vai pela floresta? É o caminho mais rápido para qualquer lugar\n'
          'Ela fica em dúvida, pois não gosta de desobedecer a sua mãe, então escolhe:\n\n'

          '(Decisão 4)\n'
          '1. Ir pela floresta\n'
          '2. Continuar pelo caminho seguro',
      choices: {
        '1': 7,
        '2': 8,
      },
    );

    _steps[7] = StoryStep(
      text:
          'Enquanto Chapeuzinho seguia pelo caminho da floresta, o lobo rapidamente seguiu pelo caminho do bosque, cantando e correndo.\n'
          ' O lobo chegou na casa da vovozinha e bateu na porta:\n'
          '- Quem está aí? – perguntou a velhinha.\n'
          'O lobo respondeu, disfarçando a voz:\n'
          '- Sou eu, Chapeuzinho Vermelho.\n\n'

          '(Decisão 5)\n'
          '1. A velhinha acredita\n'
          '2. A velhinha não acredita',
      choices: {
        '1': 9,
        '2': 10,
      },
    );

    _steps[8] = StoryStep(
      text:
          'O lobo começa a ficar furioso, mas a deixa seguir o caminho e sai rapidamente pela floresta e logo chega na casa da vovozinha e bateu na porta:\n'
          '- Quem está aí? – perguntou a velhinha.\n'
          'O lobo respondeu, disfarçando a voz:\n'
          '- Sou eu, Chapeuzinho Vermelho.\n\n'

          '(Decisão 5)\n'
          '1. A velhinha acredita\n'
          '2. A velhinha não acredita',
      choices: {
        '1': 9,
        '2': 10,
      },
    );

    _steps[9] = StoryStep(
      text: 'E a vovozinha disse:\n'
          '- Entre minha querida, a porta está aberta.\n'
          'O lobo, que era muito rápido, foi entrando e engoliu a vovozinha de uma só vez.\n'
          'Depois vestiu as roupas dela e ficou à espera da Chapeuzinho Vermelho.\n'
          'Chegando na casa da vovó, a menina encontrou o lobo, mas não o reconheceu e perguntou:\n'
          '- Vovó! Por que suas orelhas são tão grandes?\n'
          '- É para te ouvir melhor minha neta\n'
          '- Vovó! Para que esses olhos tão grandes?\n'
          '- É para te ver melhor minha neta\n'
          '- Credo, vovó, por que a senhora está com essa boca tão grande?\n'
          'O lobo já inpaciente respondeu:\n'
          '- É para te comer! – respondeu o lobo\n'
          'Dizendo isso, o lobo começou a correr atrás da Chapeuzinho, mas se desequilibrou tropeçou e caiu no chão ficando inconciente por um momento..\n'
          'Enquanto isso a menina se escondeu no armário. O lobo procurou e não a achou e resolveu tirar um cochilo.\n\n'

          '(Decisão 6)\n'
          '1. Continuar escondida\n'
          '2. Sair correndo do armário',
      choices: {
        '1': 11,
        '2': 12,
      },
    );

    _steps[10] = StoryStep(
      text:
          'A vovó não acreditou e fechou a porta\nMas a vovó acabou esquecendo uma janela ao lado da porta, e o lobo muito ligeiro entra pela janela e engoliu a vovozinha de uma só vez.'
          'Depois vestiu as roupas dela e ficou à espera da Chapeuzinho Vermelho.\n\n'
          'Chegando na casa da vovó, a menina encontrou o lobo, mas não o reconheceu e perguntou:\n'
          '- Vovó! Por que suas orelhas são tão grandes?\n'
          '- É para te ouvir melhor minha neta\n'
          '- Vovó! Para que esses olhos tão grandes?\n'
          '- É para te ver melhor minha neta\n'
          '- Credo, vovó, por que a senhora está com essa boca tão grande?\n'
          'O lobo já inpaciente respondeu:\n'
          '- É para te comer! – respondeu o lobo\n'
          'Dizendo isso, o lobo começou a correr atrás da Chapeuzinho, mas se desequilibrou tropeçou e caiu no chão ficando inconciente por um momento..\n'
          'Enquanto isso a menina se escondeu no armário. O lobo procurou e não a achou e resolveu tirar um cochilo.\n\n'

          '(Decisão 6)\n'
          'O que Chapeuzinho Vermelho deve fazer?\n'
          '1-Sim = Continuar escondida.\n'
          '2-Não = Sair correndo do armário.',
      choices: {
        '1': 11,
        '2': 12,
      },
    );

    _steps[11] = StoryStep(
      text: 'O lobo adormeceu profundamente que começou a roncar\n'
          'O caçador que passava, escutou e pensou que barulho é esse?!\n\n'

          '(Decisão 7)\n'
          '1. Ele entrou na casa e achou o lobo dormindo\n'
          '2. o caçador estava cansado, e passou direto',
      choices: {
        '1': 13,
        '2': 14,
      },
    );
    _steps[12] = StoryStep(
      text:
          'Chapéuzinho sai correndo do armário mas tropeça e cai acordando o lobo, quando está perto da porta o lobo pega ela e a amarra no armário\n'
          'A Chapeuzinho vê o caçador passando e fica na esperança dele entrar e ajuda-la\n\n'

          '(Decisão 7)\n'
          '1-Sim = Ele entrou na casa e achou o lobo\n'
          '2-Não = o caçador estava cansado, e passou direto',
      choices: {
        '1': 13,
        '2': 14,
      },
    );

    _steps[13] = StoryStep(
      text: 'Ah, você está aqui!\n\n'
          'Escutando isso, Chapeuzinho escolhe\n\n'

          '(Decisão 8)\n'
          '1-Sim = aparecer e contar o que aconteceu ao caçador\n'
          '2-Não = Continuar escondida no armário',
      choices: {
        '1': 15,
        '2': 16,
      },
    );

    _steps[14] = StoryStep(
      text:
          'O caçador passou direto, mas logo atrás vem um homem vestido como caçador e entra na casa\n'
          'Escutando isso, Chapeuzinho escolhe\n\n'

          '(Decisão 8)\n'
          '1-Sim = aparecer e contar o que aconteceu ao caçador\n'
          '2-Não = Continuar escondida no armário',
      choices: {
        '1': 15,
        '2': 16,
      },
    );

    //o SIM DA 8, Se aparecer e contar o que aconteceu ao caçador
    _steps[15] = StoryStep(
      text:
          'Por sua vez, o caçador estava trabalhando junto com o lobo e gritou:\n'
          '- Acorde lobo!\n'
          '- A menina já ai fugir!\n'
          'O lobo acordou e levantou cambaleando, pois ainda estava cheio.\n'
          'O caçador começou a brigar com o lobo:\n'
          '- Não era pra ter comido a velha\n'
          '- Você não faz nada direito\n'
          'Enquanto o caçador brigava com o lobo, a Chapeuzinho vermelho pensa...\n\n'

          '(Decisão 9)\n'
          '1.Sim Vou tentar fugir agora enquanto eles brigam\n'
          '2.Não Vou ficar em silêncio na esperança de sair viva',
      choices: {
        '1': 17,
        '2': 18,
      },
    );

    //O NÃO DA 8 Se continuar escondida no armário
    _steps[16] = StoryStep(
      text:
          'Por sua vez, o caçador estava trabalhando junto com o lobo e gritou'
          '- Acorde lobo!'
          'O lobo acordou e levantou cambaleando, pois ainda estava cheio'
          'O caçador começou a brigar com o lobo '
          '- Não era pra ter comido a velha '
          '- você não faz nada direto '
          'Enquanto o caçador brigava com o lobo a Chapeuzinho vermelho pensa...\n\n'

          '(Decisão 9)\n'
          '1.Sim Vou tentar fugir agora enquanto eles brigam\n'
          '2.Não Vou ficar em silêncio na esperança de sair viva',
      choices: {
        '1': 17,
        '2': 18,
      },
    );

    //o SIM DA 9, Se tentar fugir agora enquanto eles brigam
    _steps[17] = StoryStep(
      text: 'Chapeuzinho consegue se soltar e sai correndo muito rápido.\n'
          'O caçador e o lobo saem correndo atrás dela, o e o caçador começa a ficar cada vez mais perto dela\n'
          'A Chapeuzinho vermelho avista uma vila, e ver que ali tem mais caçadores\n\n'

          '(Decisão 10) \n'
          '1-Sim = Ela decide ir correndo pedir ajuda na vila\n'
          '2-Não = Ela decidiu não ir, por medo de serem cúmplices do caçador mal e do lobo.',
      choices: {
        '1': 19,
        '2': 20,
      },
    );

    //O NÃO DA 9, Se ficar em silêncio na esperança de sair viva
    _steps[18] = StoryStep(
      text: 'Chapeuzinho escolhe se manter em silêncio\n'
          'O caçador mal e o lobo pegam a chapeuzinho e escolhe levá-la para outro esconderijo\n'
          'No caminho ela avista uma vila: \n\n'

          '(Decisão 10) \n'
          '1-Sim = Ela decide ir correndo pedir ajuda na vila\n'
          '2-Não = Ela decidiu não ir, por medo',
      choices: {
        '1': 19,
        '2': 20,
      },
    );
    //o SIM DA 10, Se ela decide ir correndo pedir ajuda na vila
    _steps[19] = StoryStep(
      text: 'Ela vai correndo para vila e grita: \n'
          '-Socorro!! \n'
          '- O lobo comeu a minha vovozinha, e está vindo atrás de mim junto com um caçador mal, por favor me ajude!!\n'
          'Todos da vila olham preocupados para Chapeuzinho Vermelho enquanto ela grita por socorro\n'
          'Um caçado gritar no meio da vila\n'
          '- Escondam as mulheres e crianças, para que não se machuquem.\n'
          'E pensa:\n\n'

          '(Decisão 11)\n'
          '1-Sim Vou ir ajudar a Chapeuzinho Vermelho logo.\n'
          '2-Não Vou ajudar a esconder as pessoas primeiro.',
      choices: {
        '1': 21,
        '2': 22,
      },
    );

    //o NÃO DA 10, Se ela decide não ir pedir ajuda na VILA
    _steps[20] = StoryStep(
      text:
          'Ela decide não ir até a vila e continua sendo levada pelo lobo e o caçador mal\n'
          ',Porém um caçador da vila ver Chapeuzinho sendo levada e gritar:\n'
          '- Escondam as mulheres e crianças, para que não se machuquem.\n'
          'E pensa:\n\n'

          '(Decisão 11)\n'
          '1-Sim Vou ir ajudar a Chapeuzinho Vermelho logo.\n'
          '2-Não Vou ajudar a esconder as pessoas primeiro.',
      choices: {
        '1': 21,
        '2': 22,
      },
    );

    //o SIM DA 11, Se ela decide ir ajudar a Chapeuzinho Vermelho logo
    _steps[21] = StoryStep(
      text:
          'O caçador com suas mãos calejadas, pega seu machado e se prepara para enfrentar o lobo que já vem chegando muito rápido na vila\n'
          'O lobo chega com fúria e olha para o caçador com desdém, e o caçador mal logo atrás\n'
          'O caçador da vila fala para eles: \n'
          '- Vão embora daqui, deixe nossa vila e a chapeuzinho vermelho em paz.\n'
          '-Não ousem desafiar a minha coragem e força.\n\n'

          '(Decisão 12)\n'
          '1-Sim O caçador mal e o lobo dão risada e pergunta ao caçador da vila o que ele sozinho vai fazer contra dois\n'
          '2-Não O lobo olha para o caçador mal que logo dar a ordem\n'
          '-Vamos embora daqui',
      choices: {
        '1': 23,
        '2': 24,
      },
    );

    //o NÃO DA 11, Se ela decide ajudar a esconder as pessoas primeiro
    _steps[22] = StoryStep(
      text: 'O caçador da vila ajuda as pessoas a se esconderem\n'
          'Mas o “caçador” mal e o lobo entram na vila\n'
          'O caçador da vila com suas mãos calejadas, pega seu machado e se prepara para enfrentar o lobo que já vem chegando muito rápido\n'
          'O lobo chega com fúria e olha para o caçador com desdém, e o caçador mal logo atrás, puxando a Chapeuzinho vermelho\n'
          'O caçador da vila fala para eles:\n'
          '- Vão embora daqui, deixe nossa vila e a chapeuzinho vermelho em paz.\n'
          '-Não ousem desafiar a minha coragem e força.\n\n'

          '(Decisão 12)\n'
          '1-Sim O caçador mal e o lobo dão risada e pergunta ao caçador da vila o que ele sozinho vai fazer contra dois\n'
          '2-Não O lobo olha para o caçador mal que logo dar a ordem\n'
          '-Vamos embora daqui',
      choices: {
        '1': 23,
        '2': 24,
      },
    );
    //o SIM DA 12, Se o caçador mal e o lobo dão risada e pergunta ao caçador da vila o que ele sozinho vai fazer contra dois
    _steps[23] = StoryStep(
      text:
          'As mãos do caçador da vila tremiam levemente de raiva contra o lobo e o caçador\n'
          'Enquanto isso a sombra do lobo, gigantesca e ameaçadora, se projetava sobre o caçador da vila\n'
          'O caçador da vila se esquiva rapidamente das grandes garras do lobo e do caçador mal que vem logo depois para cima dele, \n'
          'Ele desfere um golpe com o machado no lobo que lhe atravessa e começa a regurgitar a vovozinha, que incrivelmente ainda não tinha sido completamente dirigida e ainda estava viva\n'
          'O caçador da vila fica impressionado e preocupado com a vovozinha\n'
          'Mas nesse pequeno espaço de tempo, o caçador mal vai para cima do caçador da vila e desfere um golpe de faca no ombro que mobiliza e derruba o caçador da vila.\n'
          'Enquanto o caçador da vila se rasteja no chão, com a mão no ombro sangrando muito\n'
          'A chapeuzinho vermelho estava esse tempo todo escondida e observando, que logo pensa:\n'
          '-A minha vovozinha que eu tento amo está viva, eu preciso fazer algo\n\n'

          '(Decisão 13)\n'
          '1-Sim = Chapeuzinho sai do esconderijo, pega o machado e desfere um golpe na cabeça do caçador mal\n'
          '2-Não = Chapeuzinho continua escondida morrendo de medo',
      choices: {
        '1': 25,
        '2': 26,
      },
    );

    //o NÃO DA 12, Se o lobo olha para o caçador mal que logo dar a ordem, Vamos embora daqui
    _steps[24] = StoryStep(
      text:
          'O caçador mal decidi ir embora e sai levando a chapeuzinho vermelho\n'
          'As mãos do caçador da vila tremiam levemente de raiva contra o lobo e o caçador\n'
          'Enquanto isso a sombra do lobo, gigantesca e ameaçadora, se projetava na vila\n'
          'Pois o lobo não obedece a ordem do “caçador” e vai para cima do caçador da vila\n'
          'O “caçador mal” vendo o lobo indo pra cima, levemente solta a chapeuzinho vermelho que sai correndo e se esconde\n'
          'O caçador da vila se esquiva rapidamente das grandes garras do lobo e do caçador mal que vem logo depois para cima dele,\n desfere um golpe com o machado no lobo que lhe atravessa e começa a regurgitar a vovozinha, que incrivelmente ainda não tinha sido completamente dirigida e ainda estava viva\n'
          'O caçador da vila fica impressionado e preocupado com a vovozinha'
          'Mas nesse pequeno espaço de tempo, o caçador mal vai para cima do caçador da vila e desfere um golpe de faca no ombro que mobiliza e derruba o caçador da vila.\n'
          'Enquanto o caçador da vila se rasteja no chão, com a mão no ombro sangrando muito\n'
          'A chapeuzinho vermelho estava esse tempo todo escondida e observando, que logo pensa:\n'
          '-A minha vovozinha que eu tento amo está viva, eu preciso fazer algo\n\n'
          
          '(Decisão 13)\n'
          '1-Sim = Chapeuzinho sai do esconderijo, pega o machado e desfere um golpe na cabeça do caçador mal\n'
          '2-Não = Chapeuzinho continua escondida morrendo de medo',
      choices: {
        '1': 25,
        '2': 26,
      },
    );

    //o SIM DA 13, Se Chapeuzinho sai do esconderijo, pega o machado e desfere um golpe na cabeça do caçador mal
    _steps[25] = StoryStep(
      text:
          'Chapeuzinho vermelho consegue salvar o caçador, e a sua amada vovozinha.\n'
          'Mesmo com o trauma de toda situação, Chapeuzinho vermelho se torna uma menina forte e uma grande líder.\n\n'
          'Fim da história.',
      choices: {},
    );

    //o NÃO DA 13, Se Chapeuzinho continua escondida morrendo de medo
    _steps[26] = StoryStep(
      text:
          'A Chapeuzinho vermelho fica escondida, chorando, pois sentiu que estava tudo perdido.\n'
          'Mas do nada ela ouve um barulho muito grande e quando vira para ver o que houve, a sua mãe estava lá, e com as mãos e machado ensanguentado, tinha acabado de acertar o caçador mal.\n'
          'Chapeuzinho sai correndo em direção a sua mãe, chorando muito, mas muito feliz de ter sido salva.\n'
          'Levaram então, o caçador da vila e a vovozinha ao médico e tudo deu certo no final.\n\n'
          'Fim da história.',
      choices: {},
    );
  }

  String getCurrentStepText() {
    return _steps[_currentStep]?.text ?? 'História não encontrada';
  }

  Map<String, int> getCurrentChoices() {
    return _steps[_currentStep]?.choices ?? {};
  }

  void processChoice(String choice) {
    final nextStep = _steps[_currentStep]?.choices[choice];
    if (nextStep != null) {
      _currentStep = nextStep;
    }
  }

  void resetStory() {
    _currentStep = 0;
  }
}

class StoryStep {
  final String text;
  final Map<String, int> choices;

  StoryStep({required this.text, required this.choices});
}
