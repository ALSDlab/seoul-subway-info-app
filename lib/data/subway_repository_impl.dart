import 'package:seoul_subway_info_app/data/subway_api.dart';
import 'package:seoul_subway_info_app/data/subway_model.dart';
import 'package:seoul_subway_info_app/data/subway_repository.dart';

class SubwayInfoRepositoryImpl implements SubwayInfoRepository {
  final _api = SubwayInfoApi();

  @override
  Future<List<SubwayArrivalInfo>> getSubwayInfo(String stationName) async{
    final model = await _api.getSubwayArrivalInfoList(stationName);
    List<SubwayArrivalInfo> infoResult = [];
    if (infoResult == null) {
      return [];
    }
    return model.map((e) => infoResult.add(e));
  }
}