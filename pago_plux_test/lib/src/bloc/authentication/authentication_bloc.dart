
import 'dart:io';

import 'package:bloc/bloc.dart';
//ignore: unused_import
import 'package:meta/meta.dart';

import '../../models/index.dart';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:local_auth/local_auth.dart';
import 'package:equatable/equatable.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

const storage = FlutterSecureStorage();

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  int obtieneToken = 0;
  UsuarioType objUsBloc = UsuarioType(
    cedula: '',
    codigo: '',
    fotoPerfil: '',
    celular: '',
    codigoConvivencia: '',
    codigoIntegracion: '',
    direccion: '',
    estado: '',
    fechaRegistro: DateTime.now(),
    latitud: 0,
    longitud: 0,
    servicioActivo: true,
    sesionColaborador: '',
    apellidos: 'Test',
    area: 'Test',
    cargo: 'Test',
    correo: 'Test',
    empresa: 'Test',
    fechaIngreso: DateTime.now(),
    identificacion: 'Test',
    nombres: 'Test',
    rucEmpresa: 'Test',
    sueldo: 2000,
    tipoContrato: 'Test',
    tipoIdentificacion: 'Test',
    dispositivoId: 'Test',
    latitudLocalidad: 0,
    longitudLocalidad: 0,
    id: '1',  
  );

  bool tieneFeatureNotificacion = false;

  AuthenticationBloc() : super(AuthenticationState(varObtieneToken: 0)) {
    on<OnNewAutenticacionEvent>(_onReInitPosition);
    on<GetNewAutenticacionEvent>(_onNewUser);
  }

  Future<void> init() async {
    add( OnNewAutenticacionEvent(obtieneToken),);
    add( GetNewAutenticacionEvent(objUsBloc),);
  }

  void _onReInitPosition( OnNewAutenticacionEvent event, Emitter<AuthenticationState> emit ) {
    emit( state.copyWith( getToken: obtieneToken ) );
  }

  void _onNewUser( GetNewAutenticacionEvent event, Emitter<AuthenticationState> emit ) {
    emit( state.copyWith( getToken: obtieneToken, objUsuario: objUsBloc ) );
  }

  void getPosicion() {
    //PosicionInicial 
    add(OnNewAutenticacionEvent(obtieneToken));
  }

  void setInicicaSesion(int obtuvoToken) {
    obtieneToken = obtuvoToken;
    add(OnNewAutenticacionEvent(obtuvoToken));
  }

  void setUsuarioLog(UsuarioType objUser) {
    objUsBloc = objUser;
    add(GetNewAutenticacionEvent(objUser));
  }


  @override
  //ignore: unnecessary_overrides
  Future<void> close() {
    return super.close();
  }

}
