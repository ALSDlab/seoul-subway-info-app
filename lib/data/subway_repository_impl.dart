import 'package:seoul_subway_info_app/data/subway_api.dart';
import 'package:seoul_subway_info_app/data/subway_model.dart';
import 'package:seoul_subway_info_app/data/subway_repository.dart';

import '../core/result.dart';

class SubwayInfoRepositoryImpl implements SubwayInfoRepository {
  final _api = SubwayInfoApi();

  @override
  Future<Result<List<SubwayArrivalInfo>>> getSubwayInfo(String stationName) async {
    try {
      final model = await _api.getSubwayArrivalInfoList(stationName);
      final infoResult = model.map((e) => SubwayArrivalInfo.fromJson(e)).toList();
      return Result.success(infoResult);
    } catch (e) {
      return Result.error(Exception(e.toString()));
    }


  }
}