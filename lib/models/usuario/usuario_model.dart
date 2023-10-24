import 'package:freezed_annotation/freezed_annotation.dart';

part 'usuario_model.g.dart';
part 'usuario_model.freezed.dart';

@unfreezed
sealed class UsuarioModel with _$UsuarioModel {
  const UsuarioModel._();

  factory UsuarioModel({
    required String? email,
    required String? senha,
  }) = _UsuarioModel;

  factory UsuarioModel.fromJson(Map<String, Object?> json) =>
      _$UsuarioModelFromJson(json);

  static UsuarioModel copy(UsuarioModel usuario) {
    return UsuarioModel.fromJson(usuario.toJson());
  }

  factory UsuarioModel.empty() => UsuarioModel(
        email: '',
        senha: '',
      );
}
