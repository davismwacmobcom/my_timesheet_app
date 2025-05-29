import 'package:get_it/get_it.dart';
import '../di/main_di.dart';
import '../network/network_base.dart';
import '../network/network_services.dart';
import '../time_sheet/repository/time_sheet_repository.dart';

GetIt getIt = GetIt.instance;

Future<void> setupLocator() async {
  getIt.registerLazySingleton<NetWorkBaseServices>(() => NetworkServices());
  getIt.registerFactory<TimeSheetRepo>(() => TimeSheetRepoImplements());

}

Future<void> initializeObjects() async {
  getIt.registerLazySingleton<MainDi>(() => MainDi());
}

void unRegisteringDi() {
  final isRegistered = getIt.isRegistered(instance: getIt<MainDi>());
  if (isRegistered) {
    getIt.unregister(instance: getIt<MainDi>());
    getIt.registerLazySingleton<MainDi>(() => MainDi());
  }
}