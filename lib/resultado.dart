import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int pontuacao;
  final void Function() quandoReiniciarQuestionario;

  Resultado(this.pontuacao, this.quandoReiniciarQuestionario);

  String get fraseResultado {
    if (pontuacao < 1) {
      return 'Estude mais.';
    } else if (pontuacao <= 2) {
      return 'Na média.';
    } else {
      return 'Nota máxima.';
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
