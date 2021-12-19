// To parse this JSON data, do
//
//     final ejercicios = ejerciciosFromJson(jsonString);

import 'dart:convert';

List<Ejercicios> ejerciciosFromJson(String str) => List<Ejercicios>.from(json.decode(str).map((x) => Ejercicios.fromJson(x)));

String ejerciciosToJson(List<Ejercicios> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Ejercicios {
    Ejercicios({
        this.fieldsProto,
    });

    FieldsProto? fieldsProto;

    factory Ejercicios.fromJson(Map<String, dynamic> json) => Ejercicios(
        fieldsProto: FieldsProto.fromJson(json["_fieldsProto"]),
    );

    Map<String, dynamic> toJson() => {
        "_fieldsProto": fieldsProto!.toJson(),
    };
}

class FieldsProto {
    FieldsProto({
        this.descripcionEjercicio,
        this.imagenEjercicio,
        this.nombreEjemplo,
    });

    DescripcionEjercicio? descripcionEjercicio;
    DescripcionEjercicio? imagenEjercicio;
    DescripcionEjercicio? nombreEjemplo;

    factory FieldsProto.fromJson(Map<String, dynamic> json) => FieldsProto(
        descripcionEjercicio: DescripcionEjercicio.fromJson(json["descripcion_ejercicio"]),
        imagenEjercicio: DescripcionEjercicio.fromJson(json["imagen_ejercicio"]),
        nombreEjemplo: DescripcionEjercicio.fromJson(json["nombre_ejemplo"]),
    );

    Map<String, dynamic> toJson() => {
        "descripcion_ejercicio": descripcionEjercicio!.toJson(),
        "imagen_ejercicio": imagenEjercicio!.toJson(),
        "nombre_ejemplo": nombreEjemplo!.toJson(),
    };
}

class DescripcionEjercicio {
    DescripcionEjercicio({
        this.stringValue,
        this.valueType,
    });

    String? stringValue;
    String? valueType;

    factory DescripcionEjercicio.fromJson(Map<String, dynamic> json) => DescripcionEjercicio(
        stringValue: json["stringValue"],
        valueType: json["valueType"],
    );

    Map<String, dynamic> toJson() => {
        "stringValue": stringValue,
        "valueType": valueType,
    };
}
