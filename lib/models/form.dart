// To parse this JSON data, do
//
//     final form = formFromMap(jsonString);

import 'dart:convert';

class Formul {
    Formul({
      required this.area,
      required this.fechaPrest,
               this.fechaReturn,
               this.observacion,
    });

    String  area;
    String  fechaPrest;
    String? fechaReturn;
    String? observacion;
    String? id;

    factory Formul.fromJson(String str) => Formul.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Formul.fromMap(Map<String, dynamic> json) => Formul(
        area       : json["area"],
        fechaPrest : json["fechaPrest"],
        fechaReturn: json["fechaReturn"],
        observacion: json["observacion"],
    );

    Map<String, dynamic> toMap() => {
        "area"       : area,
        "fechaPrest" : fechaPrest,
        "fechaReturn": fechaReturn,
        "observacion": observacion,
    };
}
