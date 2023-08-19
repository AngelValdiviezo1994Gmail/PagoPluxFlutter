import 'dart:convert';

class ClientTypeResponse {
    ClientTypeResponse({
      required this.token,
      required this.mensaje,
    });
    
    String token;
    String mensaje;

    factory ClientTypeResponse.fromJson(String str) => ClientTypeResponse.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory ClientTypeResponse.fromMap(Map<String, dynamic> json) => ClientTypeResponse(
        token: json["token"] ?? '',
        mensaje: json["mensaje"] ?? '',
    );

    Map<String, dynamic> toMap() => {
        "token": token,
        "mensaje": mensaje,
    };
}
