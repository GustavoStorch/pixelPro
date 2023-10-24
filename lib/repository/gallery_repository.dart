// ignore_for_file: unused_field, deprecated_member_use, avoid_print

import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:pixelpro/models/gallery/gallery_model.dart';

class GalleryRepository {
  final DatabaseReference databaseReference =
      FirebaseDatabase.instance.reference();
  final Reference storageReference = FirebaseStorage.instance.ref();

  Future<void> addGalleryItem(GalleryModel gallery, String image) async {
    try {
      // Faça o upload da imagem para o Firebase Storage
      final UploadTask uploadTask =
          storageReference.child('images/$image').putFile(File(image));

      // Aguarde o término do upload
      final TaskSnapshot taskSnapshot = await uploadTask;
      if (taskSnapshot.state == TaskState.success) {
        // Obtenha a URL da imagem após o upload
        final imageUrl =
            await storageReference.child('images/$image').getDownloadURL();

        final currentDate = DateTime.now();

        // Atualize o objeto GalleryModel com a URL da imagem
        final updatedItem = gallery.copyWith(
            imagem: imageUrl.toString(), dataRegistro: currentDate);

        // Adicione o objeto atualizado ao Firebase Realtime Database
        final String? id = databaseReference.child('gallery').push().key;
        await databaseReference
            .child('gallery')
            .child(id!)
            .set(updatedItem.toJson());
      }
    } catch (e) {
      print('Erro ao adicionar imagem: $e');
      rethrow;
    }
  }

  Future<void> updateGalleryItem(GalleryModel item) async {}

  Future<void> removeGalleryItem(String id) async {}

  Future<List<GalleryModel>> getGalleryItems() async {
    return [];
  }
}
