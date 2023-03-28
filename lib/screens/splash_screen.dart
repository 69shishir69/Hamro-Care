import 'dart:async';
// import 'package:eshopping/utils/api_url.dart';
import 'package:flutter/material.dart';
import 'package:hospital_management_system/screens/bottom_nav_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  String? token;
  // String? token_doc;

  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 3),
  )..repeat(reverse: true);
  late final Animation<double> _animation =
      CurvedAnimation(parent: _controller, curve: Curves.easeIn);
  @override
  void initState() {
    userToken();
    // TODO: implement initState
    super.initState();

    Timer(
        const Duration(seconds: 5),
        (() => token == null
            ? Navigator.pushNamed(context, '/login')
            : Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (context) => const BottomNavBar(index: 0)),
              )));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  userToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      token = prefs.getString("patient");
      // username = prefs.getString("username");
      debugPrint(token);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: FadeTransition(
        opacity: _animation,
        child: Padding(
            padding: const EdgeInsets.all(8),
            child: Image.asset('assets/images/splash.png',
                height: 100, width: 100, semanticLabel: 'Logo')
            // child: Image.asset('assets/images/logo_dark.png')
            ),
      ),
    );
  }
}
