import 'package:http/http.dart' as http;

import '../Model/Cosmetic_Model.dart';

class Frenchcosmeticdata {
  static Future<List<CosmeticModel>> GatData() async {
    http.Response response = await (http.get(
      Uri.parse(
          "https://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline"),
    ));
    return cosmeticModelFromJson(response.body);
  }
}
