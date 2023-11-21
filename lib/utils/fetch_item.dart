// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'package:qemulshop_app/model/item_api.dart';

// Future<List<Item>> fetchItem() async {
//   var url = Uri.parse('https://muhkemal-lathif-tugas.pbp.cs.ui.ac.id/json');
//   var response = await http.get(url, headers: {
//     "Access-Control-Allow-Origin": "*",
//     "Content-Type": "application/json",
//   });
//   // print(response.body);
//   // melakukan decode response menjadi bentuk json
//   var data = jsonDecode(utf8.decode(response.bodyBytes));
//   // print(data);

//   // melakukan konversi data json menjadi object ToDo
//   List<Item> listItem = [];
//   for (var d in data) {
//     if (d != null) {
//       listItem.add(Item.fromJson(d));
//     }
//   }
//   return listItem;
// }

// // REFERENCES
// // 1) https://stackoverflow.com/questions/65630743/how-to-solve-flutter-web-api-cors-error-only-with-dart-code