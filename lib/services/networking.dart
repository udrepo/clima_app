import 'dart:convert';

import 'package:http/http.dart' as http;

class Networking {
  final String url;

  Networking(this.url);

  Future getWeatherData() async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }
}
