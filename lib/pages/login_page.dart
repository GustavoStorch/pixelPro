// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables, depend_on_referenced_packages, use_build_context_synchronously, avoid_print

import 'package:flutter/material.dart';
import 'package:pixelpro/componentes/Cores/Cores.dart';
import 'package:pixelpro/componentes/botoes/icon_buttom_wdiget.dart';
import 'package:pixelpro/componentes/botoes/icon_facebook_buttom_widget.dart';
import 'package:pixelpro/componentes/botoes/login_buttom_widget.dart';
import 'package:pixelpro/componentes/botoes/text_buttom_widget.dart';
import 'package:pixelpro/componentes/campos/text_field_login_string.dart';
import 'package:pixelpro/componentes/fontes/fontes.dart';
import 'package:pixelpro/models/usuario/usuario_model.dart';
import 'package:pixelpro/pages/home_page.dart';
import 'package:pixelpro/pages/register_page.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late UsuarioModel usuario;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> _signInWithEmailAndPassword() async {
    try {
      final UserCredential userCredential =
          await _auth.signInWithEmailAndPassword(
        email: usuario.email!,
        password: usuario.senha!,
      );
      final User? user = userCredential.user;

      if (user != null) {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => HomePage(),
          ),
        );
      }
    } catch (e) {
      print("Erro de autenticação: $e");
    }
  }

  @override
  void initState() {
    super.initState();
    usuario = UsuarioModel.empty();
  }

  @override
  Widget build(BuildContext context) {
    double fullWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: Cores.corDeFundoDegrade,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Padding(padding: EdgeInsets.only(top: 100.0)),
              Text(
                'Welcome.',
                style:
                    Fontes.getRoboto(fontSize: 24.0, cor: Cores.corTextoBranco),
              ),
              Text(
                'Glad to see you!.',
                style:
                    Fontes.getRoboto(fontSize: 24.0, cor: Cores.corTextoBranco),
              ),
              const Padding(padding: EdgeInsets.only(top: 24)),
              SizedBox(
                width: fullWidth * 0.8,
                child: TextFieldLoginStringWidget(
                  textInputAction: TextInputAction.next,
                  placeholder: 'Email Address',
                  onChanged: (value) => usuario.email = value,
                  // validator: (str) =>
                  //     str == null || str.isEmpty ? 'Usuário é obrigatório' : '',
                ),
              ),
              const Padding(padding: EdgeInsets.only(top: 14)),
              SizedBox(
                width: fullWidth * 0.8,
                child: TextFieldLoginStringWidget(
                  textInputAction: TextInputAction.next,
                  placeholder: 'Password',
                  password: true,
                  onChanged: (value) => usuario.senha = value,
                  // validator: (str) =>
                  //     str == null || str.isEmpty ? 'Senha é obrigatória' : '',
                ),
              ),
              const Padding(padding: EdgeInsets.only(top: 10.0)),
              SizedBox(
                width: fullWidth * 0.8,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: TextButtomWidget(
                    onTap: () => {},
                    text: 'Forgot Password?',
                  ),
                ),
              ),
              const SizedBox(height: 30.0),
              LoginButtomWidget(
                text: 'Login',
                onPressed: () => {
                  _signInWithEmailAndPassword(),
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
                        'Or Login With',
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
              //const Spacer(),
              const Padding(padding: EdgeInsets.only(top: 150)),
              TextButtomWidget(
                onTap: () => {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => RegisterPage(),
                  )),
                },
                text: 'Dont have an account? Sign Up Now',
              ),
              const Padding(padding: EdgeInsets.only(bottom: 50))
            ],
          ),
        ),
      ),
    );
  }
}
