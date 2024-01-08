import 'package:get_it/get_it.dart';
import 'package:http/http.dart';

import '../data/subway_repository.dart';
import '../data/subway_repository_impl.dart';
import '../ui/main_view_model.dart';

final getIt = GetIt.instance;

void diSetup(){
  getIt.registerSingleton<SubwayInfoRepository>(SubwayInfoRepositoryImpl());
  getIt.registerFactory(() => SubwayViewModel(repository: getIt<SubwayInfoRepository>()));
}