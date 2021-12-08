import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Network {
  final String url;

  Network(this.url);

  Future<dynamic> getJSON() async {
    final http.Response response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      debugPrint("Response: ${response.body}");
      return jsonDecode(response.body);
    }
  }
}
