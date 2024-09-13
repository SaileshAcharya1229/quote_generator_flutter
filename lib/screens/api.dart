import 'dart:convert';

import 'package:quote_generator/screens/quote_model.dart';
import 'package:http/http.dart' as http;

class APi {
  static const String baseUrl = "https://zenquotes.io/api/";

  static Future<QuoteModel> fetchRandomQuote() async {
    final response = await http.get(Uri.parse("${baseUrl}random"));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return QuoteModel.fromJson(data[0]);
    } else {
      throw Exception("failed to generate quote");
    }
  }
}