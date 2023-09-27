// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:pixelpro/componentes/Cores/Cores.dart';
import 'package:pixelpro/componentes/botoes/login_buttom_widget.dart';
import 'package:pixelpro/componentes/botoes/text_buttom_widget.dart';
import 'package:pixelpro/componentes/botoes/transparent_buttom_widget.dart';
import 'package:pixelpro/componentes/fontes/fontes.dart';
import 'package:pixelpro/pages/home_page.dart';
import 'package:pixelpro/pages/login_page.dart';
import 'package:pixelpro/pages/register_page.dart';

class InitialPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: Cores.corDeFundoDegrade,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Spacer(),
            Image.asset(
              'assets/pixelpro.png',
              width: 150.0,
              height: 150.0,
            ),
            const SizedBox(height: 20.0),
            Text(
              'PixelPro Digital',
              style:
                  Fontes.getRoboto(fontSize: 24.0, cor: Cores.corTextoBranco),
            ),
            const SizedBox(height: 40.0),
            LoginButtomWidget(
              text: 'Login',
              onPressed: () => {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => LoginPage(),
                )),
              },
            ),
            const SizedBox(height: 10.0),
            TransparentButtomWidget(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => RegisterPage(),
                ));
              },
            ),
            const Spacer(),
            TextButtomWidget(
              onTap: () => {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => HomePage(),
                  ),
                ),
              },
              text: 'Continue as a guest',
            ),
            const Padding(padding: EdgeInsets.only(bottom: 10))
          ],
        ),
      ),
    );
  }
}
