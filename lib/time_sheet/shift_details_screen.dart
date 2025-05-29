import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../logger.dart';
import 'model/unattended_shift_response.dart';

class ShiftDetailsScreen extends StatelessWidget {
  final ShiftItem shift;

  const ShiftDetailsScreen({Key? key, required this.shift}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF5F5F5),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
                children: [
                  // Custom App bar with back button and title
                  Stack(
                    children: [
                      Container(
                        height: 396,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(shift.shiftTiming=="day"? 'assets/images/card_night.png': 'assets/images/card_day.png'), // Your image path
                            fit: BoxFit.cover, // Options: cover, contain, fill, etc.
                          ),
                          borderRadius: BorderRadius.circular(0), // optional rounded corners
                        ),
                        padding: const EdgeInsets.only(top: 30,left: 8),
                        child: Column(
                          children: [
                            //row for back button and day night image
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(
                                  icon: Icon(Icons.arrow_back, color: Color(shift.shiftTiming=="day"?0xffffffff:0xFF180833)),
                                  onPressed: () {
                                    // Handle back navigation
                                    context.pop();
                                  },
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 40,right: 20),
                                  child: Image.asset(shift.shiftTiming=="day"? 'assets/images/night_big.png':'assets/images/day_big.png'),
                                )
                              ],
                            ),
                            //shift details
                            Container(
                              padding: const EdgeInsets.all(16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Premium Shift',
                                        style: TextStyle(
                                          color: Color(shift.shiftTiming=="day"?0xffffffff:0xFF180833),
                                          fontSize: 34,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Text(
                                        '€23/hr',
                                        style: TextStyle(
                                          color: Color(shift.shiftTiming=="day"?0xffffffff:0xFF180833),
                                          fontSize: 24,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                  //shift date and time
                                  Row(
                                    children: [
                                      Icon(Icons.calendar_today, color: Color(shift.shiftTiming=="day"?0xffffffff:0xFFE43144), size: 16),
                                      SizedBox(width: 4),
                                      Text(
                                        '06 Aug 2024',
                                        style: TextStyle(
                                            color: Color(shift.shiftTiming=="day"?0xffffffff:0xFF180833),
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400
                                        ),
                                      ),
                                      SizedBox(width: 16),
                                      Icon(Icons.access_time, color: Color(shift.shiftTiming=="day"?0xffffffff:0xFFE43144), size: 16),
                                      SizedBox(width: 4),
                                      Text(
                                        '08:00 PM - 08:00 AM',
                                        style: TextStyle(
                                            color: Color(shift.shiftTiming=="day"?0xffffffff:0xFF180833),
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10),
                                  //men and covid ward button
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          foregroundColor: Color(shift.shiftTiming=="day"?0xffffffff:0xff191B1E),
                                          backgroundColor: Color(shift.shiftTiming=="day"?0xff67646F:0xffFDF7F1), // Text color
                                          elevation: 4, // Shadow depth
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(12),
                                          ),
                                          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                                        ),
                                        onPressed: () {
                                        },
                                        child: Text('Men'),
                                      ),
                                      SizedBox(width: 10),
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          foregroundColor: Color(shift.shiftTiming=="day"?0xffffffff:0xff191B1E),
                                          backgroundColor: Color(shift.shiftTiming=="day"?0xff67646F:0xffFDF7F1),// Text color
                                          elevation: 8, // Shadow depth
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(12),
                                          ),
                                          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                                        ),
                                        onPressed: () {
                                        },
                                        child: Text('Covid Ward'),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      // Content
                      Padding(
                        padding: const EdgeInsets.only(top:360,bottom: 120), // Space for the fixed button
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 16),
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: Colors.white,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        '#PT134544',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Container(
                                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                        decoration: BoxDecoration(
                                          color: Colors.green.withOpacity(0.1),
                                          borderRadius: BorderRadius.circular(20),
                                        ),
                                        child: Row(
                                          children: const [
                                            Icon(Icons.check, color: Colors.green, size: 16),
                                            SizedBox(width: 4),
                                            Text(
                                              'Marked as Favorite',
                                              style: TextStyle(
                                                color: Colors.green,
                                                fontSize: 12,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    'Blackberry Clinic/ NHS Unit',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    'Kore Care Home Chapel Rd, Abbey Knockmoy, Town, Co Galway H06W678',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 14,
                                    ),
                                  ),
                                  SizedBox(height: 12),
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                                    decoration: BoxDecoration(
                                      color: Colors.orange.withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: const [
                                        Icon(Icons.location_on, color: Colors.orange, size: 16),
                                        SizedBox(width: 4),
                                        Text(
                                          'Hampstead Clinic',
                                          style: TextStyle(
                                            color: Colors.orange,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            SizedBox(height: 10),

                            // Job Details
                            Container(
                              padding: const EdgeInsets.all(16),
                              color: Colors.white,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Job Details',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                  SizedBox(height: 12),
                                  Text(
                                    'We are seeking a compassionate and dedicated Registered Nurse to join our healthcare team. The ideal candidate will provide high-quality patient care, collaborate with medical professionals, and contribute to the overall well-being of our patients.',
                                    style: TextStyle(
                                      color: Colors.grey[700],
                                      fontSize: 14,
                                    ),
                                  ),
                                  SizedBox(height: 16),
                                  Text(
                                    'Key Responsibilities:',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  _buildBulletPoint('Seeking a compassionate and dedicated Registered Nurse.'),
                                  _buildBulletPoint('Join our healthcare team to provide high-quality patient care.'),
                                  _buildBulletPoint('Coordinate with medical professionals.'),
                                  _buildBulletPoint('Strong commitment to patient safety.'),
                                ],
                              ),
                            ),

                            SizedBox(height: 10),

                            // Allowances
                            Container(
                              padding: const EdgeInsets.all(16),
                              color: Colors.white,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Allowances',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                  SizedBox(height: 12),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Petrol',
                                        style: TextStyle(
                                          color: Colors.grey[700],
                                          fontSize: 14,
                                        ),
                                      ),
                                      Text(
                                        '€5',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),

                            SizedBox(height: 10),

                            // Map
                            Container(
                              padding: const EdgeInsets.all(16),
                              color: Colors.white,
                              width: double.infinity,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.network(
                                      'https://images.unsplash.com/photo-1506905925346-21bda4d32df4',
                                      height: 200,
                                      width: double.infinity,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  SizedBox(height: 12),
                                  Text(
                                    'Kore Care Home Chapel Rd, Abbey Knockmoy, Town, Co Galway H06W678',
                                    style: TextStyle(
                                      color: Colors.grey[700],
                                      fontSize: 14,
                                    ),
                                  ),
                                  SizedBox(height: 12),
                                  Container(
                                    width: double.infinity,
                                    padding: const EdgeInsets.symmetric(vertical: 12),
                                    decoration: BoxDecoration(
                                      color: Colors.green,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    alignment: Alignment.center,
                                    child: const Text(
                                      'Get Direction',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ]
                  ),
                ]
            ),
          ),

          //fixed bottom button
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 90,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, -5),
                  ),
                ],
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: ElevatedButton(
                onPressed: () {
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green, // button color
                  padding: EdgeInsets.symmetric(vertical: 12), // for better height
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  minimumSize: Size(double.infinity, 0), // full-width button
                ),
                child: const Text(
                  'Request',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ),
        ]
      )
    );
  }

  Widget _buildBulletPoint(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
        margin: const EdgeInsets.only(top: 6, right: 8),
            width: 6,
            height: 6,
            decoration: const BoxDecoration(
              color: Colors.black,
              shape: BoxShape.circle,
            ),
          ),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                color: Colors.grey[700],
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }

}