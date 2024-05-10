import 'package:campo_minado/components/campo_widget.dart';
import 'package:flutter/widgets.dart';

import '../models/campo.dart';
import '../models/tabuleiro.dart';

class TabuleiroWidget extends StatelessWidget {
  final Tabuleiro tabuleiro;
  final void Function(Campo) onAbrir;
  final void Function(Campo) onAlterarmarcacao;
  const TabuleiroWidget({
    super.key,
    required this.onAbrir,
    required this.onAlterarmarcacao,
    required this.tabuleiro,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.count(
        crossAxisCount: tabuleiro.colunas,
        children: tabuleiro.campos.map((c) {
          return CampoWidget(
            campo: c,
            onAbrir: onAbrir,
            onAlterarmarcacao: onAlterarmarcacao,
          );
        }).toList(),
      ),
    );
  }
}
