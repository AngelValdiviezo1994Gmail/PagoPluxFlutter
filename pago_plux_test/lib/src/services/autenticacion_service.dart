
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:pago_plux_test/environments/index.dart';
import 'package:pago_plux_test/src/models/index.dart';
import 'package:pago_plux_test/src/utils/index.dart';

class AutenticacionService extends ChangeNotifier{

  final String endPointLogin = CadenaConexion().apiLogin;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  ProspectoTypeResponse? objTipoRsp;
  ClienteValidoTypeResponse? objClienteValido;
  ClientTypeResponse? objRspReenvio;
  String tipoIdent = '';
  String numIdent = '';
  String passWord = '';
  String tokenUser = '';
  ClientTypeResponse? objRspInicioSesion;
  UsuarioTypeResponse? objRspUsuarioDatos;
  UsuarioType? objRspUsuario;

  final storage = const FlutterSecureStorage();

  bool isLoading = false;
  bool get varIsLoading => isLoading;
  set varIsLoading (bool value){
    isLoading = value;
    notifyListeners();
  }

  bool isLoadingCambioClave = false;
  bool get varIsLoadingCambioClave => isLoadingCambioClave;
  set varIsLoadingCambioClave (bool value){
    isLoadingCambioClave = value;
    notifyListeners();
  }

  String cedulaSelect = 'assets/BtnCedula_Gris.png';
  String pasaporteSelect = 'assets/BtnPasaporte_Blanco.png';
  String colaboradorSelect = 'assets/BtnColaborador_Naranja.png';
  String familiarSelect = 'assets/BtnFamiliar_Gris.png';

  String get varColaboradorSelect => colaboradorSelect;
  set varColaboradorSelect (String value){
    colaboradorSelect = value;
    notifyListeners();
  }

  String get varFamiliarSelect => familiarSelect;
  set varFamiliarSelect (String value){
    familiarSelect = value;
    notifyListeners();
  }

  String get varCedulaSelect => cedulaSelect;
  set varCedulaSelect (String value){
    cedulaSelect = value;
    notifyListeners();
  }

  String get varPasaporteSelect => pasaporteSelect;
  set varPasaporteSelect (String value){
    pasaporteSelect = value;
    notifyListeners();
  }

  String varCedula = '';
  String varPasaporte = '';
  String varCorreo = '';


  bool isOscured = true;
  bool get varIsOscured => isOscured;
  set varIsOscured (bool value){
    isOscured = value;
    notifyListeners();
  }

  bool isPasaporte = false;
  bool get varIsPasaporte => isPasaporte;
  set varIsPasaporte (bool value){
    isPasaporte = value;
    notifyListeners();
  }

  bool isValidForm(){
    return formKey.currentState?.validate() ?? false;
  }

  bool validaFormulario(String fecNac, String noGen, String noDir, String noCorreoVar){
    bool permiteIngreso = true;

    if(fecNac != '' && noGen != '' && noDir != '' && noCorreoVar != ''){
      permiteIngreso = false;
    }

    return permiteIngreso;
  }

  bool isValidFormAutenticacion(){
    var valCed = ValidacionesUtils().validaCedula(varCedula);
    if(valCed == 'Ok'){
      return true;
    }
    else{
      return false;
    }
    //return FormKey.currentState?.validate() ?? false;
  }

  autenticacion(String emailEntra, String password) async { 
    final baseURL = '${endPointLogin}usuarios/autenticar/$emailEntra/$password';//endPoint;//20

    final response = await http.post(Uri.parse(baseURL));
    
    if(response.statusCode != 200) return null;

    var reponseRs = response.body;
    final clienteRsp = ClientTypeResponse.fromJson(reponseRs);//aquí va a variar el objeto de respuesta cuando se cree el token por el api
    tokenUser = clienteRsp.token;
    storage.write(key: 'jwtPago', value: tokenUser);
    storage.write(key: 'correoUser', value: emailEntra);
    
    notifyListeners();
  }

  reenviaCorreoActivacion(String numIdent, String email) async {

    final baseURL = '${endPointLogin}Clientes/ReenviarActivacion?Identificacion=$numIdent&Correo=$email';

    final varResponse = await http.put(Uri.parse(baseURL));
    if(varResponse.statusCode != 200) return null;

    final prospRsp = ClientTypeResponse.fromJson(varResponse.body);
    objRspReenvio = prospRsp;
    notifyListeners();
  }

  Future logOut() async {
    await storage.delete(key: 'jwtPago');
    await storage.delete(key: 'correoUser');
    return;
  }

  Future<String> readToken() async {
    return await storage.read(key: 'jwtPago') ?? '';
  }

  Future<String> readObjCliente() async {
    storage.write(key: 'objUsuarioLleno', value: '');
    return await storage.read(key: 'objUsuario') ?? ''; 
  }

}
