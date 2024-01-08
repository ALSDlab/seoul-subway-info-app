import 'dart:convert';

import 'package:http/http.dart' as http;

class SubwayInfoApi{



  Future<List<dynamic>> getSubwayArrivalInfoList(String stationName) async {
    final String _baseUrl = 'http://swopenapi.seoul.go.kr/api/subway';
    final response = await http.get(Uri.parse('$_baseUrl/sample/json/realtimeStationArrival/0/5/$stationName',));
    return jsonDecode(response.body);

  }
}