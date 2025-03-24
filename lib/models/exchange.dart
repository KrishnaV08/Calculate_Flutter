// To parse this JSON data, do
//
//     final exchange = exchangeFromJson(jsonString);

import 'dart:convert';

Exchange exchangeFromJson(String str) => Exchange.fromJson(json.decode(str));

String exchangeToJson(Exchange data) => json.encode(data.toJson());

class Exchange {
    String result;
    String documentation;
    String termsOfUse;
    int timeLastUpdateUnix;
    String timeLastUpdateUtc;
    int timeNextUpdateUnix;
    String timeNextUpdateUtc;
    String baseCode;
    Map<String, double> conversionRates;

    Exchange({
        required this.result,
        required this.documentation,
        required this.termsOfUse,
        required this.timeLastUpdateUnix,
        required this.timeLastUpdateUtc,
        required this.timeNextUpdateUnix,
        required this.timeNextUpdateUtc,
        required this.baseCode,
        required this.conversionRates,
    });

    factory Exchange.fromJson(Map<String, dynamic> json) => Exchange(
        result: json["result"],
        documentation: json["documentation"],
        termsOfUse: json["terms_of_use"],
        timeLastUpdateUnix: json["time_last_update_unix"],
        timeLastUpdateUtc: json["time_last_update_utc"],
        timeNextUpdateUnix: json["time_next_update_unix"],
        timeNextUpdateUtc: json["time_next_update_utc"],
        baseCode: json["base_code"],
        conversionRates: Map.from(json["conversion_rates"]).map((k, v) => MapEntry<String, double>(k, v?.toDouble())),
    );

    Map<String, dynamic> toJson() => {
        "result": result,
        "documentation": documentation,
        "terms_of_use": termsOfUse,
        "time_last_update_unix": timeLastUpdateUnix,
        "time_last_update_utc": timeLastUpdateUtc,
        "time_next_update_unix": timeNextUpdateUnix,
        "time_next_update_utc": timeNextUpdateUtc,
        "base_code": baseCode,
        "conversion_rates": Map.from(conversionRates).map((k, v) => MapEntry<String, dynamic>(k, v)),
    };
}
