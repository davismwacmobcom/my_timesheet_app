import 'dart:math' as logger;

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart';
import 'package:my_timesheet_app/time_sheet/shift_card.dart';
import 'package:my_timesheet_app/time_sheet/shift_card_flagged.dart';
import 'package:my_timesheet_app/time_sheet/shift_card_submitted.dart';
import 'package:my_timesheet_app/time_sheet/shift_card_withdraw.dart';
import 'package:my_timesheet_app/time_sheet/time_sheet_viewmodel.dart';
import 'package:provider/provider.dart';
import '../../get_it/get_it.dart';
import '../../shift.dart';
import 'package:http/http.dart';

import '../shift_card_1.dart';
import 'model/flagged_shift_response.dart';
import 'model/submitted_shift_response.dart';
import 'model/withdraw_shift_response.dart';

class TimeSheetScreen extends StatefulWidget {
  const TimeSheetScreen({super.key});

  @override
  State<TimeSheetScreen> createState() => _TimeSheetScreenState();
}

class _TimeSheetScreenState extends State<TimeSheetScreen>  with TickerProviderStateMixin{

  late TabController _tabController;

  late TimeSheetViewmodel _timeSheetViewmodel;
  // Scroll controllers for each tab to preserve position
  final Map<int, ScrollController> _tabScrollControllers = {};
  final Map<int, double> _scrollPositions = {};

  @override
  void initState() {
    super.initState();
    _timeSheetViewmodel = Provider.of<TimeSheetViewmodel>(context, listen: false);

    _tabController = TabController(length: 4, vsync: this, initialIndex: 0);

    // Initialize scroll controllers for each tab
    for (int i = 0; i < 4; i++) {
      _tabScrollControllers[i] = ScrollController();
      _scrollPositions[i] = 0.0;
    }

  }

  void _saveScrollPosition(int tabIndex) {
    if (_tabScrollControllers[tabIndex]?.hasClients == true) {
      _scrollPositions[tabIndex] = _tabScrollControllers[tabIndex]!.offset;
    }
  }

  void _restoreScrollPosition(int tabIndex) {
    if (_tabScrollControllers[tabIndex]?.hasClients == true) {
      final position = _scrollPositions[tabIndex] ?? 0.0;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (_tabScrollControllers[tabIndex]?.hasClients == true) {
          _tabScrollControllers[tabIndex]!.animateTo(
            position,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        }
      });
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    _tabScrollControllers.values.forEach((controller) => controller.dispose());
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF3F3F3),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            // App Bar
            SliverAppBar(
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
              elevation: 1,
              pinned: true,
              floating: false,
              title: Row(
                children: [
                  SvgPicture.asset(
                    'assets/icons/xpress_home_menu.svg',
                      height: 24,
                      colorFilter: ColorFilter.mode(Colors.black, BlendMode.srcIn)
                  ),
                  SizedBox(width: 12),
                  Text(
                    'Time Sheet',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Spacer(),
                  OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Colors.white),
                      foregroundColor: Colors.teal,
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    ),
                    child: Text(
                      'View Payments',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff019B5B)
                      ),
                    ),
                  ),
                ],
              ),
              automaticallyImplyLeading: false,
            ),

            // Balance Card
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Consumer<TimeSheetViewmodel>(
                  builder: (context, viewModel, child) {
                    final payout = viewModel.payoutData;
                    String totalBalance = '£--';
                    String holidayPay = '£--';

                    if (payout != null) {
                      totalBalance = '£${payout.withdrawCount ?? 0}';
                      holidayPay = '£${payout.holidayPayAmount ?? 0}';
                    }

                    return Card(
                      color: Colors.white,
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Total balance',
                              style: TextStyle(
                                  color: Color(0xff616169),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              totalBalance,
                              style: TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.w500,
                                color: Color(0xff181A1A),
                              ),
                            ),
                            SizedBox(height: 12),
                            dottedLine(),
                            SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      'Holiday Pay Balance ',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Text(
                                      holidayPay,
                                      style: TextStyle(
                                        color: Color(0xff019B5B),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  size: 16,
                                  color: Color(0xff019B5B),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),


            // Sticky Tab Bar
            SliverPersistentHeader(
              pinned: true,
              delegate: _StickyTabBarDelegate(
                TabBar(
                  controller: _tabController,
                  isScrollable: true,
                  tabAlignment: TabAlignment.start,
                  padding: EdgeInsets.only(left: 16),
                  labelPadding: EdgeInsets.symmetric(horizontal: 12),
                  indicatorPadding: EdgeInsets.zero,
                  indicatorColor: Color(0xff1C1C1C),
                  labelColor: Color(0xff1C1C1C),
                  unselectedLabelColor: Color(0xff999999),
                  labelStyle: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                  unselectedLabelStyle: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                  onTap: (index) {
                    _saveScrollPosition(_tabController.previousIndex);
                    Future.delayed(const Duration(milliseconds: 100), () {
                      _restoreScrollPosition(index);
                    });
                  },
                  tabs: [
                    Tab(text: 'Unattended'),
                    Tab(text: 'Submitted'),
                    Tab(text: 'Withdraw'),
                    Tab(text: 'Flagged'),
                  ],
                ),
              ),
            ),
          ];
        },
        body: TabBarView(
          controller: _tabController,
          children: [
            _buildUnattendedTab(),
            _buildTabContentSubmitted(0, 'Submitted'),
            _buildTabContentWithdraw(1, 'Withdraw'),
            _buildTabContentFlagged(2, 'Flagged'),
          ],
        ),
      ),
    );
  }

  Widget _buildTabContentSubmitted(int tabIndex, String tabName) {

    return Consumer<TimeSheetViewmodel>(
      builder: (context, viewModel, child) {
        List<ShiftSubmitted>? shiftList=viewModel.submittedShiftListData?.data[0].shifts;
        if (shiftList == null) {
          return Center(child: CircularProgressIndicator());
        }
        if (shiftList.isEmpty) {
          return Center(child: Text("No unattended shifts found"));
        }

        return ListView.builder(
          padding: EdgeInsets.all(16),
          itemCount: shiftList.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                context.push(
                  '/timeSheets/time-sheet-details-screen',
                  extra: shiftList[index].shiftTiming,
                );
              },
              child: ShiftCardSubmitted(shift: shiftList[index]),
            );
          },
        );
      },
    );
  }
  Widget _buildTabContentWithdraw(int tabIndex, String tabName) {

    return Consumer<TimeSheetViewmodel>(
      builder: (context, viewModel, child) {
        List<ShiftWithdraw>? shiftList=viewModel.withdrawShiftListData?.data[0].shifts;
        if (shiftList == null) {
          return Center(child: CircularProgressIndicator());
        }
        if (shiftList.isEmpty) {
          return Center(child: Text("No unattended shifts found"));
        }

        return ListView.builder(
          padding: EdgeInsets.all(16),
          itemCount: shiftList.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                context.push(
                  '/timeSheets/time-sheet-details-screen',
                  extra: shiftList[index].shiftTiming,
                );
              },
              child: ShiftCardWithdraw(shift: shiftList[index]),
            );
          },
        );
      },
    );
  }
  Widget _buildTabContentFlagged(int tabIndex, String tabName) {

    return Consumer<TimeSheetViewmodel>(
      builder: (context, viewModel, child) {
        List<ShiftFlagged>? shiftList=viewModel.flaggedShiftListData?.data[0].shifts;
        if (shiftList == null) {
          return Center(child: CircularProgressIndicator());
        }
        if (shiftList.isEmpty) {
          return Center(child: Text("No unattended shifts found"));
        }

        return ListView.builder(
          padding: EdgeInsets.all(16),
          itemCount: shiftList.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                context.push(
                    '/timeSheets/time-sheet-details-screen',
                  extra: shiftList[index].shiftTiming,
                );
              },
              child: ShiftCardFlagged(shift: shiftList[index]),
            );
          },
        );
      },
    );
  }
  Widget _buildUnattendedTab() {
    return Consumer<TimeSheetViewmodel>(
      builder: (context, viewModel, child) {
        final shiftList = viewModel.unattendedShiftData?.data;
        if (shiftList == null) {
          return Center(child: CircularProgressIndicator());
        }
        if (shiftList.isEmpty) {
          return Center(child: Text("No unattended shifts found"));
        }

        return RefreshIndicator(
          onRefresh: () async {
            await viewModel.getUnattendedResponse();
          },
          child: ListView.builder(
            padding: EdgeInsets.all(16),
            itemCount: shiftList.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  context.push(
                    '/shift-details',
                    extra: shiftList[index],
                  );
                },
                child: ShiftCard(shift: shiftList[index]),
              );
            },
          ),
        );
      },
    );
  }

  Widget dottedLine() {
    return CustomPaint(
      size: Size(double.infinity, 1), // Full width, 1 pixel height
      painter: CustomPainterWrapper(),
    );
  }
}

class CustomPainterWrapper extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Color(0xffCCCCCC)
      ..strokeWidth = 1;

    double dashWidth = 4;
    double dashSpace = 3;
    double startX = 0;

    while (startX < size.width) {
      canvas.drawLine(Offset(startX, 0), Offset(startX + dashWidth, 0), paint);
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

// Custom delegate for sticky tab bar
class _StickyTabBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar tabBar;

  _StickyTabBarDelegate(this.tabBar);

  @override
  double get minExtent => tabBar.preferredSize.height;

  @override
  double get maxExtent => tabBar.preferredSize.height;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Color(0xffF3F3F3),
      child: tabBar,
    );
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
