// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'usuario_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UsuarioModel _$UsuarioModelFromJson(Map<String, dynamic> json) {
  return _UsuarioModel.fromJson(json);
}

/// @nodoc
mixin _$UsuarioModel {
  String? get email => throw _privateConstructorUsedError;
  set email(String? value) => throw _privateConstructorUsedError;
  String? get senha => throw _privateConstructorUsedError;
  set senha(String? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UsuarioModelCopyWith<UsuarioModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UsuarioModelCopyWith<$Res> {
  factory $UsuarioModelCopyWith(
          UsuarioModel value, $Res Function(UsuarioModel) then) =
      _$UsuarioModelCopyWithImpl<$Res, UsuarioModel>;
  @useResult
  $Res call({String? email, String? senha});
}

/// @nodoc
class _$UsuarioModelCopyWithImpl<$Res, $Val extends UsuarioModel>
    implements $UsuarioModelCopyWith<$Res> {
  _$UsuarioModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = freezed,
    Object? senha = freezed,
  }) {
    return _then(_value.copyWith(
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      senha: freezed == senha
          ? _value.senha
          : senha // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UsuarioModelImplCopyWith<$Res>
    implements $UsuarioModelCopyWith<$Res> {
  factory _$$UsuarioModelImplCopyWith(
          _$UsuarioModelImpl value, $Res Function(_$UsuarioModelImpl) then) =
      __$$UsuarioModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? email, String? senha});
}

/// @nodoc
class __$$UsuarioModelImplCopyWithImpl<$Res>
    extends _$UsuarioModelCopyWithImpl<$Res, _$UsuarioModelImpl>
    implements _$$UsuarioModelImplCopyWith<$Res> {
  __$$UsuarioModelImplCopyWithImpl(
      _$UsuarioModelImpl _value, $Res Function(_$UsuarioModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = freezed,
    Object? senha = freezed,
  }) {
    return _then(_$UsuarioModelImpl(
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      senha: freezed == senha
          ? _value.senha
          : senha // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UsuarioModelImpl extends _UsuarioModel {
  _$UsuarioModelImpl({required this.email, required this.senha}) : super._();

  factory _$UsuarioModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UsuarioModelImplFromJson(json);

  @override
  String? email;
  @override
  String? senha;

  @override
  String toString() {
    return 'UsuarioModel(email: $email, senha: $senha)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UsuarioModelImplCopyWith<_$UsuarioModelImpl> get copyWith =>
      __$$UsuarioModelImplCopyWithImpl<_$UsuarioModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UsuarioModelImplToJson(
      this,
    );
  }
}

abstract class _UsuarioModel extends UsuarioModel {
  factory _UsuarioModel({required String? email, required String? senha}) =
      _$UsuarioModelImpl;
  _UsuarioModel._() : super._();

  factory _UsuarioModel.fromJson(Map<String, dynamic> json) =
      _$UsuarioModelImpl.fromJson;

  @override
  String? get email;
  set email(String? value);
  @override
  String? get senha;
  set senha(String? value);
  @override
  @JsonKey(ignore: true)
  _$$UsuarioModelImplCopyWith<_$UsuarioModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
