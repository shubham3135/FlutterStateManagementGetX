import 'package:get_x/productModule/models/product_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static var client = http.Client();

  static Future<List<ProductModel>?> fetchProducts() async {
    var response = await client.get(Uri.http('makeup-api.herokuapp.com',
        '/api/v1/products.json', {'brand': 'maybelline'}));
    if (response.statusCode == 200) {
      var jsonString = response.body;
      return productFromJson(jsonString);
    }else{
      return null;
    }
  }
}
