/* ***************************************************************
 * @author       : Gerardo Yandún
 * @model        : PagoResponseModel
 * @description  : Objeto de respuesta en pago
 * @version  : v1.0.0
 * @copyright (c)  PagoPlux 2021
 *****************************************************************/
class PagoResponseModel {
  int? code;
  String? description;
  DetailModel? detail;
  String? status;

  PagoResponseModel.fromJsonMap(Map<String, dynamic> json) {
    code = json['code'];
    description = json['description'];
    status = json['status'];
    detail = DetailModel.fromJsonMap(json['detail']);
  }
}

class DetailModel {
  String? token;
  String? amount;
  String? cardType;
  String? cardInfo;
  String? cardIssuer;
  String? clientID;
  String? clientName;
  String? fecha;

  DetailModel.fromJsonMap(Map<String, dynamic> json) {
    token = json['token'];
    amount = json['amount'];
    cardType = json['cardType'];
    cardInfo = json['cardInfo'];
    cardIssuer = json['cardIssuer'];
    clientID = json['clientID'];
    clientName = json['clientName'];
    fecha = json['fecha'];
  }
}
