import 'dart:convert';
import 'package:http/http.dart' as http;
import '../utils/constants.dart';

class PixabayApi {
  static Future<List> fetchImages(String query) async {
    final response = await http.get(
      Uri.parse('${Constants.PIXABAY_BASE_URL}?key=${Constants.API_KEY}&q=$query&image_type=photo&per_page=10'),
    );

    if (response.statusCode == 200) {
      return json.decode(response.body)['hits'];
    } else {
      throw Exception('Failed to load images');
    }
  }
}
