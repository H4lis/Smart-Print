import 'package:http/http.dart' as http;
import 'dart:convert';

class MidtransService {
  static const String serverKey = 'SB-Mid-server-ygjZkxwYMVgWXpHMsp1lMKiZ';
  static const String baseUrl = 'https://api.sandbox.midtrans.com/v2';

  static Future<Map<String, dynamic>> createTransaction(Map<String, dynamic> body) async {
    final url = Uri.parse('$baseUrl/charge');
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Basic ' + base64Encode(utf8.encode('$serverKey:')),
    };

    final response = await http.post(url, headers: headers, body: jsonEncode(body));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to create transaction: ${response.body}');
    }
  }
}
