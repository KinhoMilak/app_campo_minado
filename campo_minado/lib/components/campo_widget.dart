import 'package:flutter/material.dart';

import '../models/campo.dart';

class CampoWidget extends StatelessWidget {
  final Campo campo;
  final void Function(Campo) onAbrir;
  final void Function(Campo) onAlterarmarcacao;

  CampoWidget({
    super.key,
    required this.campo,
    required this.onAlterarmarcacao,
    required this.onAbrir,
  });

  Widget getImage() {
    int qtMinas = campo.qtdeMinasNaVizinhanca;
    if (campo.aberto && campo.minado && campo.explodido) {
      return Image.asset('assets/images/bomba_0.jpeg');
    } else if (campo.aberto && !campo.marcado && !campo.minado) {
      return Image.asset('assets/images/aberto_$qtMinas.jpeg');
    } else if (campo.aberto && campo.minado) {
      return Image.asset('assets/images/bomba_1.jpeg');
    } else if (campo.marcado) {
      return Image.asset('assets/images/bandeira.jpeg');
    } else {
      return Image.asset('assets/images/fechado.jpeg');
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onAbrir(campo),
      onLongPress: () => onAlterarmarcacao(campo),
      child: getImage(),
    );
  }
}
