// To parse this JSON data, do
//
//     final foodModel = foodModelFromJson(jsonString);

import 'dart:convert';

FoodModel foodModelFromJson(String str) => FoodModel.fromJson(json.decode(str));

String foodModelToJson(FoodModel data) => json.encode(data.toJson());

class FoodModel {
    FoodModel({
     
        this.id,
        this.foodName,
        this.image,
        this.price,
        this.description,
        this.status,
        this.createdAt,
        this.updatedAt,
    });

    final int id;
    final String foodName;
    final String image;
    final String price;
    final String description;
    final String status;
    final DateTime createdAt;
    final DateTime updatedAt;

    factory FoodModel.fromJson(Map<String, dynamic> json) => FoodModel(
        id: json["id"],
        foodName: json["food_name"],
        image: json["image"],
        price: json["price"],
        description: json["description"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "food_name": foodName,
        "image": image,
        "price": price,
        "description": description,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
