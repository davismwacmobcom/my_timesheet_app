import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../shift.dart';
import 'model/submitted_shift_response.dart';
import 'model/withdraw_shift_response.dart';

class ShiftCardWithdraw extends StatelessWidget {
  final ShiftWithdraw shift;

  const ShiftCardWithdraw({Key? key, required this.shift}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DateFormat formatter = DateFormat('dd MMM EEE');
    //final String formattedDate = formatter.format(shift.date).toUpperCase();

    // Create gradient based on premium status and time of day
    List<Color> gradientColors;
    if (shift.shiftTiming=="afternoon") {
      gradientColors = [
        Color(0XFF3D3C43),
        Color(0XFF4C4953),
        Color(0XFF65626D),
        Color(0XFF2F2E34),
      ];
    } else {
      gradientColors = [
        const Color(0xFFF5E1FA),
        const Color(0xFFFFF2C5),
        const Color(0xFFE65656),
      ];
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Color(0xffD5D5D5),
          width: 1
        )
      ),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.all(4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              gradient: LinearGradient(
                  colors: gradientColors,
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight
              ),
            ),
            child: Stack(
              children: [
                Positioned(
                  top: 0,
                  right: 0,
                  child: Opacity(
                    opacity: 0.1,
                    child: ColorFiltered(
                      colorFilter: ColorFilter.mode(
                        Colors.transparent, // You can adjust this to get desired blend
                        BlendMode.luminosity,
                      ),
                      child: Image.asset(
                        'assets/images/diamond_half.png',
                      ),
                    ),
                  )
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                                decoration: BoxDecoration(
                                  color: shift.shiftTiming=="afternoon" ? Colors.grey.shade900 : Colors.white,
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Text(
                                  shift.date,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: shift.shiftTiming=="afternoon" ? Colors.white : Colors.black,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          Text(
                            shift.client.name,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: shift.shiftTiming=="afternoon" ? Colors.white : Colors.black,
                            ),
                          ),
                          const SizedBox(height: 12),
                          Row(
                            children: [
                              Icon(
                                Icons.diamond_outlined,
                                size: 14,
                                color: shift.shiftTiming=="afternoon" ? Colors.white70 : Colors.red,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                '${shift.client.checkInDistance} KM away',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: shift.shiftTiming=="afternoon" ? Colors.white70 : Colors.black54,
                                ),
                              ),
                              const SizedBox(width: 16),
                              Icon(
                                Icons.access_time,
                                size: 14,
                                color: shift.shiftTiming=="afternoon" ? Colors.white70 : Colors.black54,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                '',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: shift.shiftTiming=="afternoon" ? Colors.white70 : Colors.black54,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
            ),
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '€${shift.totalPayRate}.0',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Total: ${shift.totalWorkedHours}hrs · €${shift.hourlyRate}/hr' ,
                      style: const TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                Spacer(),
                ElevatedButton(
                  onPressed: () {
                    // Handle request action
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff24A46F),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text('Request'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _formatTimeRange(TimeOfDay start, TimeOfDay end) {
    String formatTime(TimeOfDay time) {
      final hour = time.hour == 0 ? 12 : time.hour > 12 ? time.hour - 12 : time.hour;
      final period = time.hour < 12 ? 'AM' : 'PM';
      return '$hour:${time.minute.toString().padLeft(2, '0')} $period';
    }

    if (start.hour == 8 && end.hour == 8 && start.minute == 0 && end.minute == 0) {
      return '08:00 PM - 08:00 AM'; // Night shift special case
    }

    return '${formatTime(start)} - ${formatTime(end)}';
  }
}