// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'dart:convert';

Product productFromJson(String str) => Product.fromJson(json.decode(str));

String productToJson(Product data) => json.encode(data.toJson());

class Product {
  Product({
    this.id,
    this.descripcion,
    this.nombre,
    this.sku,
  });

  String id;
  String descripcion;
  String nombre;
  String sku;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json['id'],
        descripcion: json['descripcion'],
        nombre: json['nombre'],
        sku: json['sku'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'descripcion': descripcion,
        'nombre': nombre,
        'sku': sku,
      };
}
