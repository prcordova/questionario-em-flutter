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
      'texto': 'Qual a cor mais linda ?',
      'respostas': [
        {'texto': 'Branco', 'pontuacao': 2},
        {'texto': 'Preto', 'pontuacao': 3},
        {'texto': 'Azul', 'pontuacao': 10},
        {'texto': 'Vermelho', 'pontuacao': 5},
        {'texto': 'Amarelo', 'pontuacao': 5},
        {'texto': 'Verde', 'pontuacao': 5},
        {'texto': 'Laranja', 'pontuacao': 5},
      ],
    },
    {
      'texto': 'Qual a comida mais saborosa ?',
      'respostas': [
        {'texto': 'Lasanha', 'pontuacao': 1},
        {'texto': 'Pizza ', 'pontuacao': 1},
        {'texto': 'Iogurte', 'pontuacao': 1},
        {'texto': 'Bala fini', 'pontuacao': 5},
      ],
    },
    {
      'texto': 'Melhor feriado ?',
      'respostas': [
        {'texto': 'Natal', 'pontuacao': 5},
        {'texto': 'Dia das crianças', 'pontuacao': 5},
        {'texto': 'Dia dos pais', 'pontuacao': 15},
        {'texto': 'Dia dos mães', 'pontuacao': 15},
        {'texto': 'Páscoa', 'pontuacao': 5},
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
