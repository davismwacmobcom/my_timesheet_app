import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class ScaffoldWithNavBar extends StatefulWidget {
  final Widget child;

  const ScaffoldWithNavBar({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  State<ScaffoldWithNavBar> createState() => _ScaffoldWithNavBarState();
}

class _ScaffoldWithNavBarState extends State<ScaffoldWithNavBar> {
  int _currentIndex = 0;

  static const List<String> _paths = [
    '/',
    '/findShift',
    '/bookings',
    '/timeSheets',
    '/availability'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          labelTextStyle: WidgetStateProperty.resolveWith<TextStyle>((states) {
            if (states.contains(WidgetState.selected)) {
              return TextStyle(
                  color: Color(0xff019B5B),
                  fontWeight: FontWeight.bold,
                  fontSize: 14
              );
            }
            return TextStyle(
                color: Colors.grey,
                fontSize: 14
            );
          }),
        ),
        child: NavigationBar(
          onDestinationSelected: (int index) {
            setState(() {
              _currentIndex = index;
            });
            context.go(_paths[index]);
          },
          selectedIndex: _currentIndex,
          destinations: [
            NavigationDestination(
              icon: SvgPicture.asset(
                  'assets/icons/xpress_home.svg',
                  height: 24,
                  colorFilter: ColorFilter.mode(Color(_currentIndex==0 ? 0xff019B5B : 0xff1C1C1C), BlendMode.srcIn),
              ),
              /*selectedIcon: Icon(Icons.home),*/
              label: 'Home',
            ),
            NavigationDestination(
              icon: SvgPicture.asset(
                  'assets/icons/xpress_search.svg',
                  height: 24,
                  colorFilter: ColorFilter.mode(Color(_currentIndex==1 ? 0xff019B5B : 0xff1C1C1C), BlendMode.srcIn),
              ),
              label: 'Find Shifts',
            ),
            NavigationDestination(
              icon: SvgPicture.asset(
                'assets/icons/xpress_calender.svg',
                height: 24,
                colorFilter: ColorFilter.mode(Color(_currentIndex==2 ? 0xff019B5B : 0xff1C1C1C), BlendMode.srcIn),
              ),
              label: 'Booking',
            ),
            NavigationDestination(
              icon: SvgPicture.asset(
                'assets/icons/xpress_time.svg',
                height: 24,
                colorFilter: ColorFilter.mode(Color(_currentIndex==3 ? 0xff019B5B : 0xff1C1C1C), BlendMode.srcIn),
              ),
              label: 'Time Sheets',
            ),
            NavigationDestination(
              icon: SvgPicture.asset(
                'assets/icons/xpress_availability.svg',
                height: 24,
                colorFilter: ColorFilter.mode(Color(_currentIndex==4 ? 0xff019B5B : 0xff1C1C1C), BlendMode.srcIn),
              ),
              label: 'Availability',
            ),
          ],
        ),
      ),
    );
  }
}