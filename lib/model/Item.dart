// import 'dart:convert';

// Item itemFromJson(String str) => Item.fromJson(json.decode(str));
// String itemToJson(Item data) => json.encode(data.toJson());

// class Item {
//     Item({
//         this.id,
//         this.brand,
//         this.model,
//         this.color,
//     });

//     int id;
//     String brand;
//     String model;
//     String color;

//     factory Item.fromJson(Map<String, dynamic> json) => Item(
//          id: json["id"],
//          brand: json["brand"],
//          model: json["model"],
//          color: json["color"],
//     );

//     Map<String, dynamic> toJson() => {
//           "id": id,
//           "brand": brand,
//           "model": model,
//           "color": color,
//     };
// }

class Item {
  final String name;
  final int amount;
  final String description;
  static final List<Item> listItem = [];

  Item(this.name, this.amount, this.description);
}
