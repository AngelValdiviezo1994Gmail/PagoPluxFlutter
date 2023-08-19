
//import 'dart:io';

import 'package:pago_plux_test/src/models/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
//import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:pago_plux_test/src/utils/index.dart';

import '../../environments/index.dart';

const storagePagoService = FlutterSecureStorage();
MensajesAlertas objMensajesPagoService = MensajesAlertas();
ResponseValidation objResponseValidationPagoService = ResponseValidation();

class PagoService extends ChangeNotifier{

  final String endPoint = CadenaConexion().apiLogin;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  

  String nombre = '';
  String get varNombre => nombre;
  set varNombre (String value){
    nombre = value;
    notifyListeners();
  }

  String correo = '';
  String get varCorreo => correo;
  set varCorreo (String value){
    correo = value;
    notifyListeners();
  }

  String telefono = '';
  String get varTelefono => telefono;
  set varTelefono (String value){
    telefono = value;
    notifyListeners();
  }

  String pago = '';
  String get varPago => pago;
  set varPago (String value){
    pago = value;
    notifyListeners();
  }

  String direccion = '';
  String get varDireccion => direccion;
  set varDireccion (String value){
    direccion = value;
    notifyListeners();
  }

  String identificacion = '';
  String get varIdentificacion => identificacion;
  set varIdentificacion (String value){
    identificacion = value;
    notifyListeners();
  }

  bool isValidForm(){
    return formKey.currentState?.validate() ?? false;
  }
  
  registraProspecto(String nombre, String correo, String clave) async {
    final baseURL = '${endPoint}usuarios/crear-cuenta-url/$correo/$nombre/$clave';

    final response = await http.post(Uri.parse(baseURL));
    if(response.statusCode != 200) return null;

    var reponseRs = response.body;
    final clienteRsp = ClientTypeResponse.fromJson(reponseRs);
    
    if(clienteRsp.mensaje.isEmpty) {
      return null;
    }

    notifyListeners();
  }

  String validaDatos() {
    String respuesta = '';

    if (varNombre.trim().isEmpty && varCorreo.trim().isEmpty && varTelefono.trim().isEmpty &&
    varPago.trim().isEmpty && varDireccion.trim().isEmpty && varIdentificacion.trim().isEmpty) {
      respuesta = 'Debes ingresar la información solicitada.';
    }

    if(varIdentificacion.trim().isEmpty || ValidacionesUtils().validaCedula(varIdentificacion.trim()) != 'Ok' && respuesta.isEmpty) {
      respuesta = 'Cédula inválida.';
    }

    if(varCorreo.trim().isEmpty || ValidacionesUtils().validaCorreo(varCorreo.trim()) != 'ok' && respuesta.isEmpty) {
      respuesta = 'Correo inválido.';
    }

    if(varDireccion.trim().isEmpty && respuesta.isEmpty){
      respuesta = 'Dirección inválida.';
    }

    if(varNombre.trim().isEmpty && respuesta.isEmpty){
      respuesta = 'Nombre inválido.';
    }

    if(varTelefono.trim().isEmpty && respuesta.isEmpty){
      respuesta = 'Teléfono inválido.';
    }

    if(varPago.trim().isEmpty || int.parse(varPago.trim().toString()) <= 0 && respuesta.isEmpty){
      respuesta = 'Pago inválido.';
    }

    return respuesta;
  }

}
