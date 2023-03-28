import 'package:flutter/material.dart';
import 'package:hospital_management_system/models/user.dart';
import 'package:hospital_management_system/repository/user_repository.dart';
import 'package:hospital_management_system/utils/url.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PatientDetails extends StatefulWidget {
  const PatientDetails({Key? key}) : super(key: key);

  @override
  State<PatientDetails> createState() => _PatientDetailsState();
}

class _PatientDetailsState extends State<PatientDetails> {
  Color blue = const Color.fromRGBO(11, 86, 222, 5);
  Color grey = Colors.grey;
  User? user;

  final _fullnameEditingController = TextEditingController();
  final _mobileEditingController = TextEditingController();
  final _emailEditingController = TextEditingController();

  final _globalKey = GlobalKey<FormState>();

  @override
  void initState() {
    getUserDetails();
    super.initState();
  }

  void getUserDetails() async {
    User? user1 = await UserRepository().getUserDetails();

    setState(() {
      user = user1!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 250, 250, 255),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: _globalKey,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text(
                        "User Details",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Color.fromARGB(255, 84, 90, 113),
                        ),
                      ),
                      InkWell(
                        onTap: () async {
                          SharedPreferences prefs =
                              await SharedPreferences.getInstance();
                          prefs.clear();
                          Navigator.of(context).pushNamedAndRemoveUntil(
                              '/login', (Route<dynamic> route) => false);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: const Color.fromARGB(255, 229, 24, 24),
                          ),
                          height: 30,
                          width: 100,
                          child: const Center(
                            child: Text(
                              "LogOut",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  if (user != null)
                    Stack(
                      children: [
                        SizedBox(
                          child: CircleAvatar(
                            backgroundImage: user!.picture == null
                                ? const NetworkImage(
                                    "https://w.wallhaven.cc/full/v9/wallhaven-v9kw9l.jpg")
                                : NetworkImage(baseUrl + user!.picture!),
                            radius: 80,
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                width: 4,
                                color:
                                    Theme.of(context).scaffoldBackgroundColor,
                              ),
                              color: Colors.grey[200],
                            ),
                            child: InkWell(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, '/patientProfileUpdate');
                              },
                              child: const Icon(
                                Icons.edit,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  const SizedBox(
                    height: 10,
                  ),
                  if (user != null)
                    Container(
                      // height: 60,
                      padding: const EdgeInsets.fromLTRB(20, 10, 0, 10),
                      alignment: Alignment.centerLeft,
                      // color: Colors.white,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: const Color.fromARGB(255, 235, 235, 235)
                                .withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: const Offset(
                                0, 3), // changes position of shadow
                          ),
                        ],
                        borderRadius: BorderRadius.circular(10),
                        // color: const Color.fromRGBO(11, 86, 222, 5),
                        color: Colors.white,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Fullname",
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: Color.fromARGB(210, 118, 125, 152),
                            ),
                          ),
                          const SizedBox(height: 3),
                          // if (user != null &&
                          //     user!.fname != null &&
                          //     user!.lname != null)
                          Text(
                            user!.fname! + " " + user!.lname!,
                            style: const TextStyle(
                              color: Color.fromRGBO(67, 67, 77, 0.9),
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                            "Gender",
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: Color.fromARGB(210, 118, 125, 152),
                            ),
                          ),
                          const SizedBox(height: 3),
                          // if (user != null && user!.gender != null)
                          Text(
                            user!.gender!,
                            style: const TextStyle(
                              color: Color.fromRGBO(67, 67, 77, 0.9),
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                            "Age",
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: Color.fromARGB(210, 118, 125, 152),
                            ),
                          ),
                          const SizedBox(height: 3),
                          // if (user != null && user!.age != null)
                          Text(
                            user!.age!,
                            style: const TextStyle(
                              color: Color.fromRGBO(67, 67, 77, 0.9),
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                            "Username",
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: Color.fromARGB(210, 118, 125, 152),
                            ),
                          ),
                          const SizedBox(height: 3),
                          // if (user != null && user!.username != null)
                          Text(
                            user!.username!,
                            style: const TextStyle(
                              color: Color.fromRGBO(67, 67, 77, 0.9),
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ),
                  const SizedBox(height: 15),
                  if (user != null)
                    Container(
                      padding: const EdgeInsets.fromLTRB(20, 10, 0, 10),
                      alignment: Alignment.centerLeft,
                      // color: Colors.white,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: const Color.fromARGB(255, 235, 235, 235)
                                .withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: const Offset(
                                0, 3), // changes position of shadow
                          ),
                        ],
                        borderRadius: BorderRadius.circular(10),
                        // color: const Color.fromRGBO(11, 86, 222, 5),
                        color: Colors.white,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Email",
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: Color.fromARGB(210, 118, 125, 152),
                            ),
                          ),
                          const SizedBox(height: 3),
                          // if (user != null && user!.email != null)
                          Text(
                            user!.email!,
                            style: const TextStyle(
                              color: Color.fromRGBO(67, 67, 77, 0.9),
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            "Phone",
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: Color.fromARGB(210, 118, 125, 152),
                            ),
                          ),
                          const SizedBox(height: 3),
                          // if (user != null && user!.phone != null)
                          Text(
                            user!.phone!,
                            style: const TextStyle(
                              color: Color.fromRGBO(67, 67, 77, 0.9),
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            "Address",
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: Color.fromARGB(210, 118, 125, 152),
                            ),
                          ),
                          const SizedBox(height: 3),
                          // if (user != null && user!.address != null)
                          Text(
                            user!.address!,
                            style: const TextStyle(
                              color: Color.fromRGBO(67, 67, 77, 0.9),
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(height: 10)
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
