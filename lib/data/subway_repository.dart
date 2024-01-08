abstract interface class SubwayInfoRepository {
  Future<List<Map<String, dynamic>>> getSubwayInfo(String stationName);
}