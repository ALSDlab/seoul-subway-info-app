import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:seoul_subway_info_app/data/subway_model.dart';

class SubwayInfoApi{



  Future<SubwayArrivalInfo> getSubwayArrivalInfoList(String stationName) async {
    const String baseUrl = 'http://swopenapi.seoul.go.kr/api/subway';
    final response = await http.get(Uri.parse('$baseUrl/sample/json/realtimeStationArrival/0/5/$stationName',));
    return SubwayArrivalInfo.fromJson(jsonDecode(response.body));

  }
}