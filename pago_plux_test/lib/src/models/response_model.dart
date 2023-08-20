import 'dart:convert';

class PagoResponseModel {
  int? code;
  String? description;
  DetailModel? detail;
  String? status;
  bool? respuestaEnviada;

  PagoResponseModel(
    {
      required code,
      required description,
      required detail,
      required status,
      required respuestaEnviada,
    }
  );

  factory PagoResponseModel.fromJson(String str) => PagoResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  PagoResponseModel.fromMap(Map<String, dynamic> json) {
    code = json['code'] ?? 0;
    description = json['description'] ?? '';
    status = json['status'] ?? '';
    respuestaEnviada = json['respuestaEnviada'] ?? false;
    detail = json['detail'] != null ? DetailModel.fromJsonMap(json['detail']) : null;
  }

  Map<String, dynamic> toMap() => {
    "code": code ?? 0,
    "description": description ?? '',
    "status": status ?? '',
    "detail": detail ?? null,
    "respuestaEnviada": respuestaEnviada ?? false
  };
}

class DetailModel {
  String? idTransaccion;
  String? token;
  double? amount;
  String? cardType;
  String? cardInfo;
  String? cardIssuer;
  String? clientID;
  String? clientName;
  String? state;
  String? fecha;
  String? acquirer;
  int? deferred;
  String? interests;
  int? interestValue;
  String? amountWoTaxes;
  String? amountWTaxes;
  String? taxesValue;
  double? amountAuthorized;
  String? tipoPago;

  DetailModel.fromJsonMap(Map<String, dynamic> json) {
    token = json['id_transaccion'] ?? '';
    token = json['token'] ?? '';
    amount = json['amount'] ?? 0;  
    cardType = json['cardType'] ?? '';
    cardInfo = json['cardInfo'] ?? '';
    cardIssuer = json['cardIssuer'] ?? '';
    clientID = json['clientID'] ?? '';
    clientName = json['clientName'] ?? '';
    state = json['state'] ?? '';    
    fecha = json['fecha'];    
    acquirer = json['acquirer'] ?? '';
    deferred = json['deferred'] ?? 0;
    interests = json['interests'] ?? '';
    interestValue = json['interestValue'] ?? 0;
    amountWoTaxes = json['amountWoTaxes'] ?? '';
    amountWTaxes = json['amountWTaxes'] ?? '';
    taxesValue = json['taxesValue'] ?? '';
    amountAuthorized = json['amountAuthorized'] ?? 0;
    tipoPago = json['tipoPago'] ?? '';
  }
}
