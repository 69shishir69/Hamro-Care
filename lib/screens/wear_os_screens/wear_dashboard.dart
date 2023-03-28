import 'package:flutter/material.dart';

class WearOsDashboard extends StatefulWidget {
  const WearOsDashboard({Key? key}) : super(key: key);

  @override
  State<WearOsDashboard> createState() => _WearOsDashboardState();
}

class _WearOsDashboardState extends State<WearOsDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/wearDocApt');
              },
              child: const Text(
                "Show Doctor Appointment",
                style: TextStyle(fontSize: 11),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/wearApt');
              },
              child: const Text(
                "Show Appointment",
                style: TextStyle(fontSize: 11),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
