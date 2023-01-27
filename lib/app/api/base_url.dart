import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class BaseUrl {
  static const String appName = 'Membership';

  static const String baseUrl = "https://membership.abc-pasko.com/api/";

  static const String privacyPolicy =
      "https://www.termsfeed.com/live/aed34a4d-00c3-4499-aec3-16287c7a2d99";

  static const int refreshDataDuration = 800;

  //API BAWAAN
  final String _url = 'https://membership.abc-pasko.com/api/';

  postData(data, apiUrl) async {
    var fullUrl = Uri.parse(_url + apiUrl + await _getToken());
    return await http.post(fullUrl,
        body: jsonEncode(data), headers: _setHeaders());
  }

  postForgotPassword(data, apiUrl) async {
    var fullUrl = Uri.parse(_url + apiUrl);
    return await http.post(fullUrl,
        body: jsonEncode(data), headers: _setHeaders());
  }

  getData(apiUrl) async {
    var fullUrl = Uri.parse(_url + apiUrl + await _getToken());
    return await http.get(fullUrl, headers: _setHeaders());
  }

  _setHeaders() => {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      };

  _getToken() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var token = localStorage.getString('token');
    return '?token=$token';
  }
}
