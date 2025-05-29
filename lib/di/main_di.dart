

import '../get_it/get_it.dart';
import '../time_sheet/repository/time_sheet_repository.dart';
import '../time_sheet/time_sheet_viewmodel.dart';

class MainDi {

  final TimeSheetViewmodel timeSheetViewmodel =
  TimeSheetViewmodel(timeSheetRepo: getIt<TimeSheetRepo>());

}


