import 'dart:convert';
import 'package:bloc_test/data/model/user_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  Future<List<UserModel>> getData() async {
    List<UserModel> userdata = [];
    try {
      var url = "https://jsonplaceholder.typicode.com/users";

      final request = http.Request("GET", Uri.parse(url));

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        final rowData = await response.stream.bytesToString();

        List<dynamic> data = jsonDecode(rowData);

        for (var element in data) {
          UserModel userModel = UserModel.fromJson(element);
          userdata.add(userModel);
        }
      }
    } catch (e) {
      // Handle the exception here, e.g., print an error message
      print("Error fetching weather data: $e");
      throw Exception("Failed to fetch weather data");
    }
    return userdata;
  }
}
