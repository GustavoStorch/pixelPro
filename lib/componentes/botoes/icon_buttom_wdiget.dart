// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:pixelpro/componentes/cores/Cores.dart';

class IconButtomWidget extends StatefulWidget {
  const IconButtomWidget({
    required this.onPressed,
    this.readonly = false,
    Key? key,
  });

  final void Function()? onPressed;
  final bool readonly;

  @override
  State<IconButtomWidget> createState() => _IConButtonWidgetState();
}

class _IConButtonWidgetState extends State<IconButtomWidget> {
  bool hovered = false;
  bool valid = true;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ElevatedButton(
      onHover: (bool hover) => setState(() => hovered = hover),
      style: ElevatedButton.styleFrom(
        backgroundColor:
            hovered ? Cores.corBotaoLoginSelecionado : Cores.corBotaoLogin,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      onPressed: !valid || widget.readonly ? null : widget.onPressed,
      child: Container(
        constraints: const BoxConstraints(
          maxHeight: 50,
          maxWidth: 120,
        ),
        width: size.width * .6,
        height: size.height * .6,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/google.ico',
              width: 24,
              height: 24,
            )
          ],
        ),
      ),
    );
  }
}
