import 'package:flutter/cupertino.dart';
import 'package:seoul_subway_info_app/ui/main_state.dart';

import '../data/subway_repository.dart';

class SubwayViewModel extends ChangeNotifier {
  final SubwayInfoRepository _repository;
  MainState _state = const MainState();

  MainState get state => _state;

  SubwayViewModel({
    required SubwayInfoRepository repository,
  }) : _repository = repository;

  Future<void> searchSubwayInfo(String stationName) async {
    _state = state.copyWith(
      isLoading: true,
    );
    notifyListeners();
    _state = state.copyWith(
      isLoading: false,
      subwayInfoLists: await _repository.getSubwayInfo(stationName),
    );
    notifyListeners();
  }
}
