// To parse this JSON data, do
//
//     final orders = ordersFromJson(jsonString);

// ignore_for_file: prefer_null_aware_operators

import 'dart:convert';

class Orders {
    Orders({
        this.data,
        this.message,
        this.status,
    });

    final List<Datum> data;
    final String message;
    final bool status;

    factory Orders.fromRawJson(String str) => Orders.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Orders.fromJson(Map<String, dynamic> json) => Orders(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        message: json["message"],
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "message": message,
        "status": status,
    };
}

class Datum {
    Datum({
        this.id,
        this.userId,
        this.orderNo,
        this.paymentType,
        this.orderDetails,
        this.transaction,
        this.status,
    });

    final int id;
    final String userId;
    final String orderNo;
    final String paymentType;
    final List<OrderDetail> orderDetails;
    final Transaction transaction;
    final String status;

    factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        userId: json["user_id"],
        orderNo: json["order_no"],
        paymentType: json["payment_type"],
        orderDetails: List<OrderDetail>.from(json["order_details"].map((x) => OrderDetail.fromJson(x))),
        transaction: json["transaction"] == null ? null : Transaction.fromJson(json["transaction"]),
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "order_no": orderNo,
        "payment_type": paymentType,
        "order_details": List<dynamic>.from(orderDetails.map((x) => x.toJson())),
        "transaction": transaction == null ? null : transaction.toJson(),
        "status": status,
    };
}

class OrderDetail {
    OrderDetail({
        this.id,
        this.orderId,
        this.foodId,
        this.food,
        this.foodPrice,
        this.qty,
        this.totalAmt,
    });

    final int id;
    final String orderId;
    final String foodId;
    final Food food;
    final String foodPrice;
    final String qty;
    final String totalAmt;

    factory OrderDetail.fromRawJson(String str) => OrderDetail.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory OrderDetail.fromJson(Map<String, dynamic> json) => OrderDetail(
        id: json["id"],
        orderId: json["order_id"],
        foodId: json["food_id"],
        food: Food.fromJson(json["food"]),
        foodPrice: json["food_price"],
        qty: json["qty"],
        totalAmt: json["total_amt"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "order_id": orderId,
        "food_id": foodId,
        "food": food.toJson(),
        "food_price": foodPrice,
        "qty": qty,
        "total_amt": totalAmt,
    };
}

class Food {
    Food({
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

    factory Food.fromRawJson(String str) => Food.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Food.fromJson(Map<String, dynamic> json) => Food(
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

class Transaction {
    Transaction({
        this.id,
        this.userId,
        this.orderId,
        this.paymentType,
        this.status,
        this.content,
    });

    final int id;
    final String userId;
    final String orderId;
    final String paymentType;
    final String status;
    final String content;

    factory Transaction.fromRawJson(String str) => Transaction.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Transaction.fromJson(Map<String, dynamic> json) => Transaction(
        id: json["id"],
        userId: json["user_id"],
        orderId: json["order_id"],
        paymentType: json["payment_type"],
        status: json["status"],
        content: json["content"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "order_id": orderId,
        "payment_type": paymentType,
        "status": status,
        "content": content,
    };
}
