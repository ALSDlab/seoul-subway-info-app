import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:seoul_subway_info_app/data/subway_model.dart';

class SubwayInfoApi{



  Future<List<dynamic>> getSubwayArrivalInfoList(String stationName) async {
    const String baseUrl = 'http://swopenapi.seoul.go.kr/api/subway';
    final response = await http.get(Uri.parse('$baseUrl/sample/json/realtimeStationArrival/0/5/$stationName',));
    final data = SubwayArrivalInfo.fromJson(jsonDecode(response.body)) as Map<String, dynamic>;
    final realTimeArrivalList = data['realtimeArrivalList'];
    return realTimeArrivalList;

  }
}