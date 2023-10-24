import 'package:freezed_annotation/freezed_annotation.dart';

part 'gallery_model.g.dart';
part 'gallery_model.freezed.dart';

@unfreezed
sealed class GalleryModel with _$GalleryModel {
  const GalleryModel._();

  factory GalleryModel({
    required int? cod,
    required String? imagem,
    required DateTime? dataRegistro,
  }) = _GalleryModel;

  factory GalleryModel.fromJson(Map<String, Object?> json) =>
      _$GalleryModelFromJson(json);

  static GalleryModel copy(GalleryModel gallery) {
    return GalleryModel.fromJson(gallery.toJson());
  }

  factory GalleryModel.empty() => GalleryModel(
        cod: 0,
        imagem: '',
        dataRegistro: null,
      );
}
