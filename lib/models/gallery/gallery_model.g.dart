// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gallery_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GalleryModelImpl _$$GalleryModelImplFromJson(Map<String, dynamic> json) =>
    _$GalleryModelImpl(
      cod: json['cod'] as int?,
      imagem: json['imagem'] as String?,
      dataRegistro: json['dataRegistro'] == null
          ? null
          : DateTime.parse(json['dataRegistro'] as String),
    );

Map<String, dynamic> _$$GalleryModelImplToJson(_$GalleryModelImpl instance) =>
    <String, dynamic>{
      'cod': instance.cod,
      'imagem': instance.imagem,
      'dataRegistro': instance.dataRegistro?.toIso8601String(),
    };
