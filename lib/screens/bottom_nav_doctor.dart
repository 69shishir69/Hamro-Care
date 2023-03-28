import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:hospital_management_system/screens/doctor_screens/doctor_accepted.dart';
import 'package:hospital_management_system/screens/doctor_screens/doctor_ended.dart';
import 'package:hospital_management_system/screens/doctor_screens/doctor_pending.dart';
import 'package:hospital_management_system/screens/doctor_screens/doctor_profilepage.dart';

class BottomNavDoctor extends StatefulWidget {
  final int index;
  const BottomNavDoctor({Key? key, this.index = 1}) : super(key: key);

  @override
  _BottomNavDoctorState createState() => _BottomNavDoctorState();
}

class _BottomNavDoctorState extends State<BottomNavDoctor> {
  int increment = 0;
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    DoctorPendingPage(),
    DoctorAcceptedPage(),
    DoctorEndedPage(),
    DoctorDetails(),
    // Center(
    //   child: Text(
    //     'Account',
    //     style: optionStyle,
    //   ),
    // ),
  ];

  @override
  Widget build(BuildContext context) {
    debugPrint(widget.index.toString());
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(
      //   elevation: 20,
      //   title: const Text('GoogleNavBar'),
      // ),
      body: IndexedStack(
        index: increment == 0 ? widget.index : _selectedIndex,
        children: _widgetOptions,
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(.1),
            )
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
          child: GNav(
            // rippleColor: Colors.grey[300]!,
            // hoverColor: Colors.grey[100]!,
            gap: 8,
            // activeColor: Colors.black,
            // iconSize: 24,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            // duration: const Duration(milliseconds: 400),
            tabBackgroundColor: Colors.grey[100]!,
            color: const Color.fromARGB(255, 174, 169, 169),
            tabs: const [
              GButton(
                iconActiveColor: Color.fromRGBO(11, 86, 222, 5),
                textColor: Color.fromRGBO(11, 86, 222, 5),
                icon: Icons.home,
                text: 'Pending',
              ),
              GButton(
                iconActiveColor: Color.fromRGBO(11, 86, 222, 5),
                textColor: Color.fromRGBO(11, 86, 222, 5),
                icon: Icons.schedule,
                text: 'Accepted',
              ),
              GButton(
                iconActiveColor: Color.fromRGBO(11, 86, 222, 5),
                textColor: Color.fromRGBO(11, 86, 222, 5),
                icon: Icons.local_hospital,
                text: 'Ended',
              ),
              GButton(
                iconActiveColor: Color.fromRGBO(11, 86, 222, 5),
                textColor: Color.fromRGBO(11, 86, 222, 5),
                icon: Icons.person,
                text: 'Account',
              ),
            ],
            selectedIndex: increment == 0 ? widget.index : _selectedIndex,
            onTabChange: (index) {
              setState(() {
                _selectedIndex = index;
                increment = 1;
              });
            },
          ),
        ),
      ),
    );
  }
}
