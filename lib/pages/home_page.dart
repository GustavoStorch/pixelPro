// ignore_for_file: depend_on_referenced_packages, use_key_in_widget_constructors, avoid_print, avoid_function_literals_in_foreach_calls

import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pixelpro/componentes/Cores/Cores.dart';
import 'package:pixelpro/pages/login_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> imageUrls = [];
  Future<void> _getImageFromGallery(BuildContext context) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      await uploadImageToFirebase(pickedFile.path, DateTime.now());
    }
  }

  Future<void> _takePhoto(BuildContext context) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      await uploadImageToFirebase(pickedFile.path, DateTime.now());
    }
  }

  Future<void> loadFirebaseImages() async {
    final firestore = FirebaseFirestore.instance;
    final snapshot = await firestore.collection('imagens').get();

    if (snapshot.docs.isEmpty) {
      setState(() {
        imageUrls = [];
      });
      return;
    }

    setState(() {
      imageUrls =
          snapshot.docs.map((doc) => doc.data()['url'].toString()).toList();
    });
  }

  @override
  void initState() {
    super.initState();
    loadFirebaseImages();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PixelPro Digital'),
        centerTitle: true,
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
                FutureBuilder(
                  future: getFirebaseImages(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return const Center(
                          child: Text('Nenhuma imagem encontrada.'));
                    }

                    final imageUrls = snapshot.data;

                    return Expanded(
                        child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                      ),
                      itemCount: imageUrls!.length,
                      itemBuilder: (context, index) {
                        return Stack(
                          children: [
                            GestureDetector(
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: const Text("Excluir imagem?"),
                                      content: const Text(
                                          "Tem certeza de que deseja excluir esta imagem?"),
                                      actions: <Widget>[
                                        TextButton(
                                          child: const Text("Cancelar"),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                        TextButton(
                                          child: const Text("Excluir"),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                            deleteImageFromFirestore(
                                                imageUrls[index]);
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                              child: Image.network(
                                imageUrls[index],
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned(
                              top: 0,
                              right: 0,
                              child: IconButton(
                                icon: const Icon(Icons.edit),
                                onPressed: () {
                                  updateImage(imageUrls[index]);
                                },
                              ),
                            ),
                          ],
                        );
                      },
                    ));
                  },
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
                              },
                            ),
                            ListTile(
                              leading: const Icon(Icons.camera),
                              title: const Text('Tirar foto'),
                              onTap: () {
                                Navigator.of(context).pop();
                                _takePhoto(context);
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

  Future<void> uploadImageToFirebase(String imagePath, DateTime data) async {
    final storage = FirebaseStorage.instance;
    final storageRef = storage.ref().child(
        'images/${DateTime.now().millisecondsSinceEpoch.toString()}.jpg');
    final uploadTask = storageRef.putFile(File(imagePath));
    await uploadTask.whenComplete(() async {
      final url = await storageRef.getDownloadURL();
      print('URL da imagem: $url');

      final firestore = FirebaseFirestore.instance;
      await firestore.collection('imagens').add({
        'url': url,
        'data': data,
      });
      loadFirebaseImages();
    });
  }

  Future<void> deleteImageFromFirestore(String imageUrl) async {
    final firestore = FirebaseFirestore.instance;
    final imageReference =
        firestore.collection('imagens').where('url', isEqualTo: imageUrl);

    try {
      final querySnapshot = await imageReference.get();
      querySnapshot.docs.forEach((doc) {
        doc.reference.delete();
      });
      print('Informações da imagem excluídas com sucesso do Firestore.');
      loadFirebaseImages();
    } catch (e) {
      print('Erro ao excluir informações da imagem no Firestore: $e');
    }
  }

  void updateImage(String imageUrl) async {
    await deleteImageFromFirestore(imageUrl);

    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      await uploadImageToFirebase(pickedFile.path, DateTime.now());
    }
  }

  Future<List<String>> getFirebaseImages() async {
    final firestore = FirebaseFirestore.instance;
    final snapshot = await firestore.collection('imagens').get();

    if (snapshot.docs.isEmpty) {
      return [];
    }

    final imageUrls =
        snapshot.docs.map((doc) => doc.data()['url'].toString()).toList();

    return imageUrls;
  }
}
