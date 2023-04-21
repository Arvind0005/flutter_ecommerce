import 'package:http/http.dart' as http;
import 'package:quantumapp/API/apiconstants.dart';
import 'package:quantumapp/models/Category_model.dart';
import '../API/apiconstants.dart';
import 'package:quantumapp/models/Product_model.dart';

class ApiService {
  Future<List<ProductModel>> getProducts() async {
    try {
      var url = Uri.parse(ApiConstants.baseurl + ApiConstants.productEndpoint);
      var response = await http.get(
        url,
      );
      if (response.body != null) {
        List<ProductModel> _model = ProductModelFromJson(response.body);
        return _model;
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<List<String>> getCategories() async {
    try {
      var url = Uri.parse(ApiConstants.baseurl + ApiConstants.categoryEndpoint);
      var response = await http.get(
        url,
      );
      if (response.body != null) {
        List<String> _categories = CategoryModelfromJson(response.body);
        print(
            "qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq");
        print(_categories);
        return _categories;
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
