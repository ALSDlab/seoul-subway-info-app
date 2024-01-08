import 'package:seoul_subway_info_app/data/subway_model.dart';

import '../core/result.dart';

abstract interface class SubwayInfoRepository {
  Future<Result<List<SubwayArrivalInfo>>> getSubwayInfo(String stationName);
}