import 'dart:convert';

Order orderFromJson(String str) => Order.fromJson(json.decode(str));

String orderToJson(Order data) => json.encode(data.toJson());

class Order {
    String requestedBy;
    String type;
    int comboId;

    Order({
        required this.requestedBy,
        required this.type,
        required this.comboId,
    });

    factory Order.fromJson(Map<String, dynamic> json) => Order(
        requestedBy: json["requestedBy"],
        type: json["type"],
        comboId: json["comboId"],
    );

    Map<String, dynamic> toJson() => {
        "requestedBy": requestedBy,
        "type": type,
        "comboId": comboId,
    };
}