import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int pontuacao;
  final void Function() quandoReiniciarQuestionario;

  Resultado(this.pontuacao, this.quandoReiniciarQuestionario);

  String get fraseResultado {
    if (pontuacao < 8) {
      return 'Como assim ?';
    } else if (pontuacao < 12) {
      return 'Poderia ser pior...';
    } else if (pontuacao < 15) {
      return 'Poderia ser melhor...';
    } else if (pontuacao < 20) {
      return 'Quase no toperson...';
    } else {
      return 'Também te amo !';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(fraseResultado,
              style: TextStyle(
                fontSize: 18,
              )),
        ),
        FlatButton(
          child: Text('Reiniciar',
              style: TextStyle(
                fontSize: 18,
                backgroundColor: Colors.indigoAccent,
              )),
          textColor: Colors.white,
          onPressed: quandoReiniciarQuestionario,
        )
      ],
    );
  }
}
