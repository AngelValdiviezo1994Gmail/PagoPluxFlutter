
part of 'authentication_bloc.dart';

String tokenUserGeneral = '';
const storageGenial = FlutterSecureStorage();
bool authLocal = false;

UsuarioType? objRspUsuario;
  
final LocalAuthentication auth = LocalAuthentication(); 

//ignore: must_be_immutable
class AuthenticationState extends Equatable {

  final int varObtieneToken;
  
  UsuarioType objUs = UsuarioType(
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
    id: '1'
  );

  bool tieneFeatureNotificacion = false;
  int numNotificaciones = 0;

  AuthenticationState(
  {
    varObtieneToken = 0,
    objUs,
    lstBannerEnRolAppGen,
    numNotificaciones
  }) : varObtieneToken = varObtieneToken ?? 0;
  

  AuthenticationState copyWith({
    int? getToken,
    UsuarioType? objUsuario,
    int? cantNot
  }) 
  => AuthenticationState(
    varObtieneToken: getToken ?? varObtieneToken,
    objUs: objUsuario ?? objUs,
    numNotificaciones: cantNot ?? numNotificaciones
  );

  Future<String> readToken() async {
    try{
      
      var connectivityResult = await (Connectivity().checkConnectivity());
    
      if (connectivityResult != ConnectivityResult.mobile && connectivityResult != ConnectivityResult.wifi) {
        return 'NI';
      }

/*
      PackageInfo packageInfo = await PackageInfo.fromPlatform();

      String nombreSistemaOperativo = '';

      if(Platform.isAndroid) {
        nombreSistemaOperativo = 'Android';
      }
      
      if(Platform.isIOS) {
        nombreSistemaOperativo = 'iOS';
      }
      */

      String token = await storage.read(key: 'jwtPago') ?? '';
      String correo = await storage.read(key: 'correoUser') ?? '';
      String respuesta = token.isNotEmpty ? '$token|$correo' : '';

      return respuesta; 
    }
    catch(ex) {
      return '';
    }
    
  }
  
  @override
  List<Object> get props => [varObtieneToken,objUs];
}