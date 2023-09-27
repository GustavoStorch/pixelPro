// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:pixelpro/componentes/cores/Cores.dart';

class TextButtomWidget extends StatelessWidget {
  final VoidCallback onTap;
  final String text;

  const TextButtomWidget({required this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        text,
        style: const TextStyle(
          color: Cores.corTextoBranco,
          decoration: TextDecoration.underline,
          fontSize: 14,
        ),
      ),
    );
  }
}
