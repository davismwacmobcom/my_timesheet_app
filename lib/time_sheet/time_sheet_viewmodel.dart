
import 'dart:math' as logger;

import 'package:either_dart/either.dart';
import 'package:flutter/cupertino.dart';
import 'package:my_timesheet_app/time_sheet/repository/time_sheet_repository.dart';
import '../../common_functions/common_functions.dart';
import '../../enums/enums.dart';
import 'model/flagged_shift_response.dart';
import 'model/payout_response.dart';
import 'model/submitted_shift_response.dart';
import 'model/unattended_shift_response.dart';
import 'model/withdraw_shift_response.dart';
import 'package:my_timesheet_app/auto_dispose_view_model.dart';

class TimeSheetViewmodel extends AutoDisposeViewModel with TimeSheetMixin{

  String? errorMessage;
  UnattendedShiftData? unattendedShiftData;
  SubmittedShiftListData? submittedShiftListData;
  WithdrawShiftListData? withdrawShiftListData;
  FlaggedShiftListData? flaggedShiftListData;
  PayoutData? payoutData;

  final TimeSheetRepo timeSheetRepo;
  TimeSheetViewmodel({required this.timeSheetRepo});


  Future<bool> getPayoutData() async {
    return timeSheetRepo.getPayoutResponse().fold((left) {
      return false;
    }, (right) {
      if (right?.success ?? false) {
        payoutData = right?.data;
        notifyListeners();
        return true;
      } else {
        return false;
      }
    }).catchError((e) {
      return false;
    });
  }

  Future<void> getUnattendedResponse() async {
    updateLoaderState(LoaderState.loading);
    await timeSheetRepo.getUnattendedResponse().fold((left) {
      debugPrint(left.key.toString());
      LoaderState state = handleResponseError(left.key);
      updateLoaderState(state);
    }, (right) {
      if (right != null) {
        if (right.success) {
          unattendedShiftData = right.data;
          updateLoaderState(LoaderState.loaded);
        } else {
          updateLoaderState(LoaderState.noData);
        }
      }
    }).catchError((error) {
      debugPrint(error.toString());
      updateLoaderState(LoaderState.networkError);
    });
  }

  Future<void> getSubmittedResponse() async {
    updateLoaderState(LoaderState.loading);
    await timeSheetRepo.getSubmittedResponse().fold((left) {
      debugPrint(left.key.toString());
      LoaderState state = handleResponseError(left.key);
      updateLoaderState(state);
    }, (right) {
      if (right != null) {
        if (right.success) {
          submittedShiftListData = right.data;
          updateLoaderState(LoaderState.loaded);
        } else {
          updateLoaderState(LoaderState.noData);
        }
      }
    }).catchError((error) {
      debugPrint(error.toString());
      updateLoaderState(LoaderState.networkError);
    });
  }

  Future<void> getWithdrawResponse() async {
    updateLoaderState(LoaderState.loading);
    await timeSheetRepo.getWithdrawResponse().fold((left) {
      debugPrint(left.key.toString());
      LoaderState state = handleResponseError(left.key);
      updateLoaderState(state);
    }, (right) {
      if (right != null) {
        if (right.success) {
          withdrawShiftListData = right.data;
          updateLoaderState(LoaderState.loaded);
        } else {
          updateLoaderState(LoaderState.noData);
        }
      }
    }).catchError((error) {
      debugPrint(error.toString());
      updateLoaderState(LoaderState.networkError);
    });
  }

  Future<void> getFlaggedResponse() async {
    updateLoaderState(LoaderState.loading);
    await timeSheetRepo.getFlaggedResponse().fold((left) {
      debugPrint(left.key.toString());
      LoaderState state = handleResponseError(left.key);
      updateLoaderState(state);
    }, (right) {
      if (right != null) {
        if (right.success) {
          flaggedShiftListData = right.data;
          updateLoaderState(LoaderState.loaded);
        } else {
          updateLoaderState(LoaderState.noData);
        }
      }
    }).catchError((error) {
      debugPrint(error.toString());
      updateLoaderState(LoaderState.networkError);
    });
  }

  @override
  updateLoaderState(LoaderState state) {
    loaderState = state;
    notifyListeners();
  }

}

mixin TimeSheetMixin {
  LoaderState loaderState = LoaderState.loading;

  updateLoaderState(LoaderState state);

}
