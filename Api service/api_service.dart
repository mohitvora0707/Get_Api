import 'package:http/http.dart' as http;

import '../Model/Api_Model.dart';

class ApiService {
  static Future<List<Products>> getData() async {
    http.Response response =
        await http.get(Uri.parse('https://fakestoreapi.com/products'));

    return productsFromJson(response.body);
  }
}
