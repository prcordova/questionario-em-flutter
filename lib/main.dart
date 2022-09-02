import 'package:flutter/material.dart';
import './resultado.dart';
import './questionario.dart';

void main() {
  runApp(const PerguntaApp());
}

class PerguntaApp extends StatefulWidget {
  const PerguntaApp({Key? key}) : super(key: key);

  @override
  State<PerguntaApp> createState() => _PerguntaAppState();
}

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;

  final _perguntas = const [
    {
      'texto': 'O que Dart ?',
      'respostas': [
        {'texto': 'Um carro da Marca Dodge', 'pontuacao': 0},
        {'texto': 'Linguagem de POO', 'pontuacao': 1},
        {'texto': 'Um jogo', 'pontuacao': 0},
      ],
    },
    {
      'texto': 'Para que serve um Widget ?',
      'respostas': [
        {'texto': 'Quebrar códigos em pedaços reutilizáveis', 'pontuacao': 1},
        {'texto': 'Aumentar o Código', 'pontuacao': 0},
        {'texto': 'Melhorar o desempenho do aplicativo', 'pontuacao': 0},
      ],
    },
    {
      'texto': 'O que é flutter ?',
      'respostas': [
        {'texto': 'Biblioteca para desenvolvimento web', 'pontuacao': 0},
        {'texto': 'Framework mobile', 'pontuacao': 1},
        {'texto': 'Arquivo de estilos', 'pontuacao': 0},
      ],
    }
  ];

  void _responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }
  }

  void _reiniciarQuestionario() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Perguntas'),
        ),
        body: temPerguntaSelecionada
            ? Questionario(
                perguntas: _perguntas,
                perguntaSelecionada: _perguntaSelecionada,
                quandoResponder: _responder)
            : Resultado(_pontuacaoTotal, _reiniciarQuestionario),
      ),
    );
  }
}
