// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:pixelpro/componentes/cores/Cores.dart';

class TransparentButtomWidget extends StatefulWidget {
  const TransparentButtomWidget({
    required this.onPressed,
    this.readonly = false,
    Key? key,
  });

  final void Function()? onPressed;
  final bool readonly;

  @override
  State<TransparentButtomWidget> createState() =>
      _TrasparentButtonWidgetState();
}

class _TrasparentButtonWidgetState extends State<TransparentButtomWidget> {
  bool hovered = false;
  bool valid = true;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ElevatedButton(
      onHover: (bool hover) => setState(() => hovered = hover),
      style: ElevatedButton.styleFrom(
        backgroundColor: hovered ? Cores.corBotaoLogin : Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      onPressed: !valid || widget.readonly ? null : widget.onPressed,
      child: Container(
        constraints: const BoxConstraints(
          maxHeight: 50,
          maxWidth: 280,
        ),
        width: size.width * .95,
        height: size.height * .95,
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Sing Up',
              style: TextStyle(color: Cores.corTextoBranco),
            ),
          ],
        ),
      ),
    );
  }
}
