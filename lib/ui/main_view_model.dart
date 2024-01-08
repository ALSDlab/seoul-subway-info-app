import 'package:flutter/cupertino.dart';
import 'package:seoul_subway_info_app/core/result.dart';
import 'package:seoul_subway_info_app/data/subway_model.dart';
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

    final result = await _repository.getSubwayInfo(stationName);

    switch (result) {
      case Success<List<SubwayArrivalInfo>>():
        _state = state.copyWith(
          isLoading: false,
          subwayInfoLists: result.data,
        );
      case Error<List<SubwayArrivalInfo>>():
        _state = state.copyWith(
          isLoading: false,
          subwayInfoLists: [],
        );
    }
    notifyListeners();
  }
}
