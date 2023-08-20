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

    factory HistorialCobroResponse.fromRawJson(String str) => HistorialCobroResponse.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory HistorialCobroResponse.fromJson(Map<String, dynamic> json) => HistorialCobroResponse(
        code: json["code"],
        description: json["description"],
        detail: Detail.fromJson(json["detail"]),
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "description": description,
        "detail": detail.toJson(),
        "status": status,
    };
}

class Detail {
    List<dynamic> transactionsData;
    int resultCount;

    Detail({
        required this.transactionsData,
        required this.resultCount,
    });

    factory Detail.fromRawJson(String str) => Detail.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Detail.fromJson(Map<String, dynamic> json) => Detail(
        transactionsData: List<dynamic>.from(json["transactionsData"].map((x) => x)),
        resultCount: json["resultCount"],
    );

    Map<String, dynamic> toJson() => {
        "transactionsData": List<dynamic>.from(transactionsData.map((x) => x)),
        "resultCount": resultCount,
    };
}
