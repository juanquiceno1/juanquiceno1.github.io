import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../global_locator.dart';
import '../../models/auth/auth_model.dart';
import '../../repository/auth/login_repository.dart';
import '../../repository/auth/recover/recover_repository.dart';
import '../../utils/preferences/preferences_user.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginInitialEvent>((event, emit) => emit(LoginInitialState()));
    on<LoginClientEvent>(_loginClientState);
    on<LoginRecoverEvent>(_loginRecoverState);
  }

  void _loginClientState(
      LoginClientEvent event, Emitter<LoginState> emit) async {
    final api = global<LoginRepository>();
    try {
      emit(Loading());
      Map<String, dynamic> resultApi =
          await api.login(nit: event.model.nit, password: event.model.password);
      if (resultApi['statusCode'] == 200 || resultApi['statusCode'] == 201) {
        _InformationClientModel dataClient =
            _InformationClientModel.fromJson(resultApi);
        if (dataClient.respuesta.isNotEmpty) {
          PreferencesUser().setDocument = event.model.nit;
          PreferencesUser().setIdClient = dataClient.respuesta.elementAt(2);
          emit(LoginSuccesState());
        } else {
          emit(LoginErrorState(
            title: 'Error de inicio de sesión',
            message:
                'Tenemos problemas para iniciar sesión, intenta nuevamente',
          ));
        }
      } else {
        emit(LoginErrorState(
          title: 'Error de inicio de sesión',
          message: 'Tenemos problemas para iniciar sesión, intenta nuevamente',
        ));
      }
    } catch (e) {
      emit(LoginErrorState(
        title: 'Error de inicio de sesión',
        message: 'Tenemos problemas para iniciar sesión, intenta nuevamente',
      ));
    }
  }

  void _loginRecoverState(
      LoginRecoverEvent event, Emitter<LoginState> emit) async {
    final api = global<RecoverRepository>();
    try {
      emit(Loading());
      Map<String, dynamic> resultApi =
          await api.recover(document: event.document);
      if (resultApi['statusCode'] == 200 || resultApi['statusCode'] == 201) {
        emit(LoginRecoverSuccessState());
      } else {
        emit(LoginErrorState(
          title: 'Upsss',
          message:
              'Tenemos problemas para recuperar la contraseña, intenta nuevamente',
        ));
      }
    } catch (e) {
      emit(LoginErrorState(
        title: 'Upsss',
        message:
            'Tenemos problemas para recuperar la contraseña, intenta nuevamente',
      ));
    }
  }
}

_InformationClientModel informationModelFromJson(String str) =>
    _InformationClientModel.fromJson(json.decode(str));

String informationModelToJson(_InformationClientModel data) =>
    json.encode(data.toJson());

class _InformationClientModel {
  _InformationClientModel({
    required this.respuesta,
  });

  List<String> respuesta;

  factory _InformationClientModel.fromJson(Map<String, dynamic> json) =>
      _InformationClientModel(
        respuesta: json['Respuesta'] == null
            ? []
            : List<String>.from(json['Respuesta'].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        'Respuesta': List<dynamic>.from(respuesta.map((x) => x)),
      };
}
