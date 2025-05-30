import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_timesheet_app/scaffold_with_navbar.dart';
import 'package:my_timesheet_app/time_sheet/model/unattended_shift_response.dart';
import 'package:my_timesheet_app/time_sheet/shift_details_screen.dart';
import 'package:my_timesheet_app/time_sheet/time_sheet_detail_screen.dart';
import 'package:my_timesheet_app/time_sheet/time_sheet_screen.dart';
import 'package:my_timesheet_app/time_sheet/time_sheet_viewmodel.dart';
import 'availability_dio_screen.dart';
import 'bookings_screen.dart';
import 'error_screen.dart';
import 'find_shift_screen.dart';
import 'home_screen.dart';
import 'get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'time_sheet/repository/time_sheet_repository.dart';
import 'package:my_timesheet_app/menu_screen.dart';

void main() async{
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await setupLocator();
    runApp(TodoApp());
  }, (error, stackTrace) {
    print("error:${stackTrace.toString()}");
  },
  );
}

class TodoApp extends StatelessWidget {

  final GoRouter _router = GoRouter(
    initialLocation: "/",
    routes: [
      ShellRoute(
        builder: (context, state, child) => ScaffoldWithNavBar(child: child),
        routes: [
          GoRoute(
            path: '/',
            pageBuilder: (context, state) => NoTransitionPage<void>(
              key: state.pageKey,
              child: HomeScreen(),
            ),
          ),
          GoRoute(
            path: '/findShift',
            pageBuilder: (context, state) => NoTransitionPage<void>(
              key: state.pageKey,
              child: FindShiftScreen(),
            ),
          ),
          GoRoute(
            path: '/bookings',
            pageBuilder: (context, state) => NoTransitionPage<void>(
              key: state.pageKey,
              child: BookingsScreen(),
            ),
          ),
          GoRoute(
            path: '/timeSheets',
            pageBuilder: (context, state) => NoTransitionPage<void>(
              key: state.pageKey,
              child: TimeSheetScreen(),
            ),
            routes: [
              GoRoute(
                path: 'time-sheet-details-screen',
                builder: (context, state) {
                  final type = state.extra as String;
                  return TimeSheetDetailScreen(type: type,);
                },
              ),
            ],
          ),
          GoRoute(
            path: '/availability',
            pageBuilder: (context, state) => NoTransitionPage<void>(
              key: state.pageKey,
              child: AvailabilityDioScreen(),
            ),
          ),
          GoRoute(
            path: '/shift-details',
            name: 'shiftDetails',
            builder: (context, state) {
              final shift = state.extra as ShiftItem; // Cast extra to your type
              return ShiftDetailsScreen(shift: shift);
            },
          ),
          GoRoute(
            path: '/menu-screen',
            name: 'menuScreen',
            builder: (context, state) {
              return MenuScreen();
            },
          ),
        ],
      )
    ],
    errorBuilder: (context, state) => ErrorScreen(),
  );

  TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TimeSheetViewmodel>(
      create: (context) => TimeSheetViewmodel(
        timeSheetRepo: getIt<TimeSheetRepo>(),
      )..getPayoutData()
       ..getUnattendedResponse()
       ..getSubmittedResponse()
        ..getWithdrawResponse()
        ..getFlaggedResponse(), // Immediately fetch on init
      child: MaterialApp.router(
        routerConfig: _router,
        debugShowCheckedModeBanner: false,
        title: 'Xpress Health',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
      ),
    );
  }
}
