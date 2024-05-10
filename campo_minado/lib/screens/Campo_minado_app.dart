import 'package:campo_minado/components/tabuleiro_widget.dart';
import 'package:campo_minado/components/widgets.dart';
import 'package:campo_minado/models/explos%C3%A3o_exception.dart';
import 'package:campo_minado/models/tabuleiro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../models/campo.dart';

class CampoMinadoApp extends StatefulWidget {
  const CampoMinadoApp({super.key});

  @override
  State<CampoMinadoApp> createState() => _CampoMinadoAppState();
}

class _CampoMinadoAppState extends State<CampoMinadoApp> {
  bool? _venceu;
  Tabuleiro? _tabuleiro;
  _reiniciar() {
    setState(() {
      _venceu = null;
      _tabuleiro!.reiniciar();
    });
  }

  _abrir(Campo c) {
    if (_venceu != null) {
      return;
    }
    setState(() {
      try {
        c.abrir();
        if (_tabuleiro!.resolvido) {
          _venceu = true;
        }
      } on ExplosaoException {
        _venceu = false;
        _tabuleiro!.revelarBombas();
      }
    });
  }

  _alternarMarcacao(Campo c) {
    setState(() {
      c.alternarMarcca();
    });
  }

  Tabuleiro _getTabuleiro(double largura, double altura) {
    if (_tabuleiro == null) {
      int qtColunas = 15;
      double tamanhoCampo = largura / qtColunas;
      int qtLinhas = (altura / tamanhoCampo).floor();
      _tabuleiro = Tabuleiro(
        linhas: qtLinhas,
        colunas: qtColunas,
        qtBombas: 3,
      );
    }
    return _tabuleiro!;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: ResultadoWidgets(
          venceu: _venceu,
          onReiniciar: _reiniciar,
        ),
        body: Container(child: LayoutBuilder(
          builder: (ctx, constraints) {
            return TabuleiroWidget(
              tabuleiro: _getTabuleiro(
                constraints.maxWidth,
                constraints.maxHeight,
              ),
              onAbrir: _abrir,
              onAlterarmarcacao: _alternarMarcacao,
            );
          },
        )),
      ),
    );
  }
}
