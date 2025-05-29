import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:my_timesheet_app/shift_card_1.dart';

import '../shift.dart';

class FindShiftScreen extends StatefulWidget {
  const FindShiftScreen({super.key});

  @override
  State<FindShiftScreen> createState() => _FindShiftScreenState();
}

class _FindShiftScreenState extends State<FindShiftScreen> {
  bool isPremiumSelected = false;
  final List<Shift> shifts = [
    Shift(
      date: DateTime(2025, 8, 6),
      location: 'Riada House Unit',
      subLocation: 'House Unit',
      distance: 12,
      startTime: const TimeOfDay(hour: 11, minute: 0),
      endTime: const TimeOfDay(hour: 14, minute: 0),
      hourlyRate: 23,
      totalPay: 38,
      hours: 6,
      county: 'Co.Dublin',
      isPremium: true,
      imageUrl: 'https://randomuser.me/api/portraits/men/32.jpg',
    ),
    Shift(
      date: DateTime(2025, 8, 6),
      location: 'Riada House Unit',
      subLocation: 'House Unit',
      distance: 12,
      startTime: const TimeOfDay(hour: 8, minute: 0),
      endTime: const TimeOfDay(hour: 8, minute: 0),
      hourlyRate: 10,
      totalPay: 60,
      hours: 6,
      county: 'Co.Dublin',
      isPremium: false,
      isNightShift: true,
    ),
    Shift(
      date: DateTime(2025, 8, 6),
      location: 'Riada House Unit',
      subLocation: 'House Unit',
      distance: 12,
      startTime: const TimeOfDay(hour: 11, minute: 0),
      endTime: const TimeOfDay(hour: 14, minute: 0),
      hourlyRate: 23,
      totalPay: 38,
      hours: 6,
      county: 'Co.Dublin',
      isPremium: true,
      imageUrl: 'https://randomuser.me/api/portraits/men/32.jpg',
    ),
    Shift(
      date: DateTime(2025, 8, 6),
      location: 'Riada House Unit',
      subLocation: 'House Unit',
      distance: 12,
      startTime: const TimeOfDay(hour: 8, minute: 0),
      endTime: const TimeOfDay(hour: 8, minute: 0),
      hourlyRate: 10,
      totalPay: 60,
      hours: 6,
      county: 'Co.Dublin',
      isPremium: false,
      isNightShift: true,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF7F7F7),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            // Handle back navigation
          },
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 16),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              children: [
                SvgPicture.asset(
                  'assets/icons/map.svg',
                  height: 28,
                ),
                SizedBox(width: 4),
                Text(
                  'Location',
                  style: TextStyle(
                    color: Color(0xFF191B1E),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: Container(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'All Available Shifts',
                style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF191B1E),
                ),
              ),
              Text(
                'There are 71 new shifts in your area',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 15,
                  color: Color(0xFF616169)
                ),
              ),
              SizedBox(height: 16,),
              Row(
                children: [
                  _buildFilterButton(),
                  SizedBox(width: 12),
                  _buildTabButton('Premium', true),
                ],
              ),
              SizedBox(height: 20,),
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 0),
                  itemCount: shifts.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () => _navigateToDetails(shifts[index]),
                      child: ShiftCard2(shift: shifts[index]),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFilterButton() {
    return GestureDetector(
      onTap: () {
        setState(() {
          isPremiumSelected = false;
          context.push('/filter-screen');
        });
      },
      child: Container(
        height: 40,
        decoration: BoxDecoration(
          border: Border.all(color: Color(isPremiumSelected?0xffE7E7E7:0xff019B5B),width: 2),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              SvgPicture.asset('assets/icons/find_shift_filter.svg',height: 18,),
              SizedBox(width: 8),
              Text(
                'Filter',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              SizedBox(width: 4),
              Text(
                '(2)',
                style: TextStyle(color: Colors.black, fontSize: 12,letterSpacing: 2.0),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTabButton(String title, bool isPremium) {
    final bool isSelected = isPremium == isPremiumSelected;

    return GestureDetector(
      onTap: () {
        setState(() {
          isPremiumSelected = isPremium;
        });
      },
      child: Container(
        height: 40,
        padding:EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: isSelected ? Colors.black : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
          border: isSelected ? null : Border.all(color: Color(0xffE7E7E7),width: 2),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: isSelected ? Colors.white : Colors.black,
            ),
          ),
        ),
      ),
    );
  }

  void _navigateToDetails(Shift shift) {
    context.push(
      '/shift-details',
      extra: shift,
    );
  }

}