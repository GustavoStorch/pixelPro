// ignore_for_file: unused_local_variable, depend_on_referenced_packages, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pixelpro/componentes/Cores/Cores.dart';
import 'package:pixelpro/componentes/fontes/fontes.dart';
import 'package:pixelpro/pages/edit_page.dart';
import 'package:pixelpro/pages/login_page.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<void> _getImageFromGallery(BuildContext context) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
  }

  Future<void> _takePhoto(BuildContext context) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PixelPro Digital'),
        backgroundColor: const Color(0xFF9A6BD4),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => LoginPage(),
                ),
              );
            },
          ),
        ],
      ),
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: Cores.corDeFundoDegrade,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  'assets/pixelpro.png',
                  width: 150.0,
                  height: 150.0,
                ),
                const SizedBox(height: 20.0),
                Text(
                  'PixelPro Digital',
                  style: Fontes.getRoboto(
                      fontSize: 24.0, cor: Cores.corTextoBranco),
                ),
                const SizedBox(height: 20.0),
                Text(
                  'Sejam Bem-Vindos!',
                  style: Fontes.getRoboto(
                      fontSize: 24.0, cor: Cores.corTextoBranco),
                ),
                const SizedBox(height: 24),
                Text(
                  'Clique na câmera e comece a editar!',
                  style: Fontes.getRoboto(
                      fontSize: 14.0, cor: Cores.corTextoBranco),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 60.0,
              color: const Color(0xFF9A6BD4),
              child: Center(
                child: GestureDetector(
                  onTap: () {
                    showModalBottomSheet<void>(
                      context: context,
                      builder: (BuildContext context) {
                        return Wrap(
                          children: <Widget>[
                            ListTile(
                              leading: const Icon(Icons.photo_library),
                              title: const Text('Selecionar da galeria'),
                              onTap: () {
                                Navigator.of(context).pop();
                                _getImageFromGallery(context);
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => EditPage(),
                                  ),
                                );
                              },
                            ),
                            ListTile(
                              leading: const Icon(Icons.camera),
                              title: const Text('Tirar foto'),
                              onTap: () {
                                Navigator.of(context).pop();
                                _takePhoto(context);
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => EditPage(),
                                  ),
                                );
                              },
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: Container(
                    width: 60.0,
                    height: 60.0,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.camera_alt,
                      color: Color(0xFF9A6BD4),
                      size: 32.0,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
