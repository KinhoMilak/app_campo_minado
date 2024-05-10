import 'package:flutter/material.dart';

class ResultadoWidgets extends StatelessWidget implements PreferredSizeWidget {
  final bool? venceu;
  final Function() onReiniciar;

  ResultadoWidgets({
    this.venceu,
    required this.onReiniciar,
  });

  Color _getCor() {
    if (venceu == null) {
      return Colors.yellow;
    }
    if (venceu == false) {
      return Colors.red;
    }

    if (venceu == true) {
      return Colors.green;
    }
    return Colors.blue;
  }

  IconData getIcon() {
    if (venceu == null) {
      return Icons.sentiment_satisfied;
    }
    if (venceu == false) {
      return Icons.sentiment_very_dissatisfied;
    }

    if (venceu == true) {
      return Icons.sentiment_very_satisfied;
    }
    return Icons.face;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      child: SafeArea(
          child: Container(
        padding: EdgeInsets.all(10),
        child: CircleAvatar(
          backgroundColor: _getCor(),
          child: IconButton(
            padding: EdgeInsets.zero,
            icon: Icon(
              getIcon(),
              color: Colors.black,
              size: 40,
            ),
            onPressed: onReiniciar,
          ),
        ),
      )),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(120);
}
