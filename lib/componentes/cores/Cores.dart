// ignore_for_file: file_names

import 'package:flutter/material.dart';

abstract class Cores {
  static const LinearGradient corDeFundoDegrade = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xFFC7A6F0),
      Color(0xFF9EB9F0),
    ],
  );

  static const Color corBotaoLogin = Color(0xffffffff);

  static const Color corBotaoLoginSelecionado = Color.fromARGB(255, 92, 89, 89);

  static const Color corTextoBranco = Color(0xffffffff);

  static const Color corTextPreto = Color(0xFF000000);

  static const Color corFundoBranco = Color(0xffffffff);

  static const Color corFundoTextField = Color(0xffF2F2F2);

  static const Color corPlaceholderTextField = Color(0xff707070);

  static const Color corBotaoClose = Color(0xff727272);

  static const Color corBotaoCloseHover = Color.fromARGB(255, 88, 88, 88);

  static const Color corBotaoSingUp = Color(0xFF9EB9F0);

  static const Color corAppBar = Color(0xFFB78BEC);
}
