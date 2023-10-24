// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:pixelpro/componentes/Cores/Cores.dart';
import 'package:pixelpro/componentes/botoes/icon_buttom_wdiget.dart';
import 'package:pixelpro/componentes/botoes/icon_facebook_buttom_widget.dart';
import 'package:pixelpro/componentes/botoes/login_buttom_widget.dart';
import 'package:pixelpro/componentes/botoes/text_buttom_widget.dart';
import 'package:pixelpro/componentes/campos/text_field_login_string.dart';
import 'package:pixelpro/componentes/fontes/fontes.dart';
import 'package:pixelpro/pages/home_page.dart';
import 'package:pixelpro/pages/login_page.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({Key? key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double fullWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.transparent,
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: Cores.corDeFundoDegrade,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Padding(padding: EdgeInsets.only(top: 100.0)),
            Text(
              'Create Account',
              style:
                  Fontes.getRoboto(fontSize: 24.0, cor: Cores.corTextoBranco),
            ),
            Text(
              'to get started now!',
              style:
                  Fontes.getRoboto(fontSize: 24.0, cor: Cores.corTextoBranco),
            ),
            const Padding(padding: EdgeInsets.only(top: 24)),
            SizedBox(
              width: fullWidth * 0.8,
              child: TextFieldLoginStringWidget(
                textInputAction: TextInputAction.next,
                placeholder: 'Email Address',
                validator: (str) =>
                    str == null || str.isEmpty ? 'Usuário é obrigatório' : '',
              ),
            ),
            const Padding(padding: EdgeInsets.only(top: 10)),
            SizedBox(
              width: fullWidth * 0.8,
              child: TextFieldLoginStringWidget(
                textInputAction: TextInputAction.next,
                placeholder: 'Password',
                password: true,
                validator: (str) =>
                    str == null || str.isEmpty ? 'Senha é obrigatória' : '',
              ),
            ),
            const Padding(padding: EdgeInsets.only(top: 10)),
            SizedBox(
              width: fullWidth * 0.8,
              child: TextFieldLoginStringWidget(
                textInputAction: TextInputAction.next,
                placeholder: 'Confirm Password',
                password: true,
                validator: (str) => str == null || str.isEmpty
                    ? 'Confirmação da senha é obrigatória'
                    : '',
              ),
            ),
            const SizedBox(height: 30.0),
            LoginButtomWidget(
              text: 'Sign Up',
              onPressed: () => {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => HomePage(),
                  ),
                ),
              },
            ),
            const SizedBox(height: 50),
            SizedBox(
              width: fullWidth * 0.8,
              child: const Row(
                children: [
                  Expanded(
                    child: Divider(
                      color: Colors.white,
                      height: 1,
                      thickness: 1,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      'Or Sign Up With',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      color: Colors.white,
                      height: 1,
                      thickness: 1,
                    ),
                  ),
                ],
              ),
            ),
            const Padding(padding: EdgeInsets.only(top: 24)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButtomWidget(
                  onPressed: () {},
                ),
                const SizedBox(width: 10),
                IconFacebookButtomWidget(
                  onPressed: () {},
                ),
              ],
            ),
            const Spacer(),
            TextButtomWidget(
              onTap: () => {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => LoginPage(),
                )),
              },
              text: 'Dont have an account? Sing Up Now',
            ),
            const Padding(padding: EdgeInsets.only(bottom: 50))
          ],
        ),
      ),
    );
  }
}
