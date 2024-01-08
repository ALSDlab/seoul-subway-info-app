import 'package:seoul_subway_info_app/data/subway_model.dart';

abstract interface class SubwayInfoRepository {
  Future<List<SubwayArrivalInfo>> getSubwayInfo(String stationName);
}