import 'dart:convert';

class HistorialCobroResponse {
    int code;
    String description;
    Detail detail;
    String status;

    HistorialCobroResponse({
        required this.code,
        required this.description,
        required this.detail,
        required this.status,
    });

    factory HistorialCobroResponse.fromJson(String str) => HistorialCobroResponse.fromMap(json.decode(str));
    String toJson() => json.encode(toMap());

    factory HistorialCobroResponse.fromMap(Map<String, dynamic> json) => HistorialCobroResponse(
        code: json["code"] ?? 0,
        description: json["description"] ?? '',
        detail: Detail.fromJson(json["detail"]),
        status: json["status"] ?? '',
    );

    Map<String, dynamic> toMap() => {
        "code": code,
        "description": description,
        "detail": detail.toJson(),
        "status": status,
    };
}

class Detail {
    List<TransactionsDatum> transactionsData;
    int resultCount;

    Detail({
        required this.transactionsData,
        required this.resultCount,
    });

    factory Detail.fromRawJson(String str) => Detail.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Detail.fromJson(Map<String, dynamic> json) => Detail(
        transactionsData: List<TransactionsDatum>.from(json["transactionsData"].map((x) => TransactionsDatum.fromJson(x))),
        resultCount: json["resultCount"],
    );

    Map<String, dynamic> toJson() => {
        "transactionsData": List<dynamic>.from(transactionsData.map((x) => x.toJson())),
        "resultCount": resultCount,
    };
}

class TransactionsDatum {
    DateTime fechaTransaccion;
    Descripcion descripcion;
    String monto;
    String numeroIdentificacionCliente;
    String numeroTelefonicoCliente;
    EstadoTransaccion estadoTransaccion;
    TipoPago tipoPago;
    dynamic usuarioCreador;
    MarcaTarjeta marcaTarjeta;
    BancoAdquiriente bancoAdquiriente;
    String voucher;
    int cuotas;
    TipoCredito tipoCredito;
    int numMesesGracia;
    TieneInteres tieneInteres;
    String valorInteres;
    String numReferencia;
    String numLote;
    String numAutorizacion;
    dynamic resEstado;

    TransactionsDatum({
        required this.fechaTransaccion,
        required this.descripcion,
        required this.monto,
        required this.numeroIdentificacionCliente,
        required this.numeroTelefonicoCliente,
        required this.estadoTransaccion,
        required this.tipoPago,
        required this.usuarioCreador,
        required this.marcaTarjeta,
        required this.bancoAdquiriente,
        required this.voucher,
        required this.cuotas,
        required this.tipoCredito,
        required this.numMesesGracia,
        required this.tieneInteres,
        required this.valorInteres,
        required this.numReferencia,
        required this.numLote,
        required this.numAutorizacion,
        required this.resEstado,
    });

    factory TransactionsDatum.fromRawJson(String str) => TransactionsDatum.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory TransactionsDatum.fromJson(Map<String, dynamic> json) => TransactionsDatum(
        fechaTransaccion: DateTime.parse(json["fecha_transaccion"]),
        descripcion: descripcionValues.map[json["descripcion"]]!,
        monto: json["monto"],
        numeroIdentificacionCliente: json["numero_identificacion_cliente"],
        numeroTelefonicoCliente: json["numero_telefonico_cliente"],
        estadoTransaccion: estadoTransaccionValues.map[json["estado_transaccion"]]!,
        tipoPago: tipoPagoValues.map[json["tipo_pago"]]!,
        usuarioCreador: json["usuarioCreador"],
        marcaTarjeta: marcaTarjetaValues.map[json["marcaTarjeta"]]!,
        bancoAdquiriente: bancoAdquirienteValues.map[json["bancoAdquiriente"]]!,
        voucher: json["voucher"],
        cuotas: json["cuotas"],
        tipoCredito: tipoCreditoValues.map[json["tipoCredito"]]!,
        numMesesGracia: json["numMesesGracia"],
        tieneInteres: tieneInteresValues.map[json["tieneInteres"]]!,
        valorInteres: json["valorInteres"],
        numReferencia: json["numReferencia"],
        numLote: json["numLote"],
        numAutorizacion: json["numAutorizacion"],
        resEstado: json["resEstado"],
    );

    Map<String, dynamic> toJson() => {
        "fecha_transaccion": "${fechaTransaccion.year.toString().padLeft(4, '0')}-${fechaTransaccion.month.toString().padLeft(2, '0')}-${fechaTransaccion.day.toString().padLeft(2, '0')}",
        "descripcion": descripcionValues.reverse[descripcion],
        "monto": monto,
        "numero_identificacion_cliente": numeroIdentificacionCliente,
        "numero_telefonico_cliente": numeroTelefonicoCliente,
        "estado_transaccion": estadoTransaccionValues.reverse[estadoTransaccion],
        "tipo_pago": tipoPagoValues.reverse[tipoPago],
        "usuarioCreador": usuarioCreador,
        "marcaTarjeta": marcaTarjetaValues.reverse[marcaTarjeta],
        "bancoAdquiriente": bancoAdquirienteValues.reverse[bancoAdquiriente],
        "voucher": voucher,
        "cuotas": cuotas,
        "tipoCredito": tipoCreditoValues.reverse[tipoCredito],
        "numMesesGracia": numMesesGracia,
        "tieneInteres": tieneInteresValues.reverse[tieneInteres],
        "valorInteres": valorInteres,
        "numReferencia": numReferencia,
        "numLote": numLote,
        "numAutorizacion": numAutorizacion,
        "resEstado": resEstado,
    };
}

enum BancoAdquiriente {
    BANCO_DE_GUAYAQUIL_S_A
}

final bancoAdquirienteValues = EnumValues({
    "BANCO DE GUAYAQUIL, S.A.": BancoAdquiriente.BANCO_DE_GUAYAQUIL_S_A
});

enum Descripcion {
    SAMASAT_COMUNICACIONES_S_A,
    VENTAS_MEDIANTE_PAGOPLX
}

final descripcionValues = EnumValues({
    "Samasat Comunicaciones S.A": Descripcion.SAMASAT_COMUNICACIONES_S_A,
    "ventas mediante pagoplx": Descripcion.VENTAS_MEDIANTE_PAGOPLX
});

enum EstadoTransaccion {
    APROBADA
}

final estadoTransaccionValues = EnumValues({
    "Aprobada": EstadoTransaccion.APROBADA
});

enum MarcaTarjeta {
    MASTER,
    VISA
}

final marcaTarjetaValues = EnumValues({
    "MASTER": MarcaTarjeta.MASTER,
    "VISA": MarcaTarjeta.VISA
});

enum TieneInteres {
    NO
}

final tieneInteresValues = EnumValues({
    "NO": TieneInteres.NO
});

enum TipoCredito {
    CORRIENTE
}

final tipoCreditoValues = EnumValues({
    "Corriente": TipoCredito.CORRIENTE
});

enum TipoPago {
    LARGO_PLAZO,
    UNICO
}

final tipoPagoValues = EnumValues({
    "Largo Plazo": TipoPago.LARGO_PLAZO,
    "Unico": TipoPago.UNICO
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
