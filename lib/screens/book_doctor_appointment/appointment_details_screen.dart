import 'package:flutter/material.dart';
import 'package:hospital_management_system/models/book_doctor_appointment.dart';
import 'package:hospital_management_system/models/user.dart';
import 'package:hospital_management_system/repository/category_repository.dart';
import 'package:hospital_management_system/repository/user_repository.dart';
import 'package:hospital_management_system/screens/bottom_nav_bar.dart';
import 'package:hospital_management_system/utils/show_message.dart';
import 'package:hospital_management_system/utils/url.dart';
import 'package:intl/intl.dart';

class AppointmentDoctorDetailsScreen extends StatefulWidget {
  const AppointmentDoctorDetailsScreen({Key? key}) : super(key: key);

  @override
  State<AppointmentDoctorDetailsScreen> createState() =>
      _AppointmentDoctorDetailsScreenState();
}

class _AppointmentDoctorDetailsScreenState
    extends State<AppointmentDoctorDetailsScreen> {
  Color blue = const Color.fromRGBO(11, 86, 222, 5);
  Color grey = Colors.grey;
  User? user;
  String? appointmentFor;

  final _fullnameEditingController = TextEditingController();
  final _mobileEditingController = TextEditingController();
  final _emailEditingController = TextEditingController();
  final _dateEditingController = TextEditingController();
  final _timeEditingController = TextEditingController();
  TimeOfDay selectedTime = TimeOfDay.now();

  final _globalKey = GlobalKey<FormState>();

  @override
  void initState() {
    getUserDetails();
    _dateEditingController.text = "";
    _timeEditingController.text = "";
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
    // debugPrint(user.toString());

    var appointment =
        ModalRoute.of(context)!.settings.arguments as List<String?>;
    // debugPrint(appointment.toString());
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
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            width: 50,
                            height: 25,
                            child: const Text(
                              "Back",
                              style: TextStyle(color: Colors.white),
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              color: blue,
                              // border:
                            ),
                            alignment: Alignment.center,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 80,
                      ),
                      const Text(
                        "Patient Details",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Color.fromRGBO(118, 125, 152, 1),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  if (user != null)
                    Container(
                      color: Colors.white,
                      width: double.infinity,
                      // height: 70,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(20, 10, 0, 10),
                        child: Row(
                          children: [
                            CircleAvatar(
                              backgroundImage: user!.picture == null
                                  ? const NetworkImage(
                                      "https://w.wallhaven.cc/full/v9/wallhaven-v9kw9l.jpg")
                                  : NetworkImage(baseUrl + user!.picture!),
                              radius: 25,
                            ),
                            const SizedBox(
                              width: 40,
                            ),
                            if (user!.username != null)
                              Text(
                                user!.username!,
                                style: const TextStyle(
                                  color: Color.fromRGBO(67, 67, 77, 0.9),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15,
                                ),
                              )
                          ],
                        ),
                      ),
                    ),
                  const SizedBox(height: 15),
                  if (appointment[1] != null)
                    Container(
                      height: 60,
                      padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                      alignment: Alignment.centerLeft,
                      color: Colors.white,
                      width: double.infinity,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Purpose of visit",
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: Color.fromARGB(210, 118, 125, 152),
                            ),
                          ),
                          Text(
                            appointment[1]!,
                            style: const TextStyle(
                              color: Color.fromRGBO(67, 67, 77, 0.9),
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    color: Colors.white,
                    padding: const EdgeInsets.fromLTRB(20, 0, 10, 0),
                    height: 70,
                    child: Center(
                      child: TextField(
                        controller: _dateEditingController,
                        //editing controller of this TextField
                        decoration: const InputDecoration(
                            icon: Icon(Icons.calendar_today),
                            labelText: "Choose Date"),
                        readOnly: true,

                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime.now(),
                              //DateTime.now() - not to allow to choose before today.
                              lastDate: DateTime(2100));

                          if (pickedDate != null) {
                            debugPrint(pickedDate.toString());
                            String formattedDate =
                                DateFormat.yMMMMd().format(pickedDate);
                            debugPrint(formattedDate);
                            setState(() {
                              _dateEditingController.text = formattedDate;
                            });
                          } else {}
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Container(
                    color: Colors.white,
                    padding: const EdgeInsets.fromLTRB(20, 0, 10, 0),
                    height: 70,
                    child: Center(
                      child: TextField(
                        controller: _timeEditingController,
                        //editing controller of this TextField
                        decoration: const InputDecoration(
                            icon: Icon(Icons.timer), labelText: "Choose Time"),
                        readOnly: true,

                        onTap: () async {
                          TimeOfDay? pickedDate = await showTimePicker(
                            context: context,
                            initialTime: selectedTime,
                            initialEntryMode: TimePickerEntryMode.input,
                            confirmText: "CONFIRM",
                            cancelText: "NOT NOW",
                            helpText: "BOOKING TIME",
                          );

                          if (pickedDate != null) {
                            // debugPrint(pickedDate.toString());
                            final now = DateTime.now();
                            final dt = DateTime(now.year, now.month, now.day,
                                pickedDate.hour, pickedDate.minute);
                            final format = DateFormat.jm();
                            String formattedDate = format.format(dt).toString();
                            // debugPrint(format.format(dt));
                            setState(() {
                              _timeEditingController.text = formattedDate;
                            });
                          } else {}
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Container(
                    padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
                    alignment: Alignment.centerLeft,
                    color: Colors.white,
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "This Appointment is for",
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: Color.fromARGB(210, 118, 125, 152),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        if (user != null)
                          Container(
                            width: double.infinity,
                            // height: 70,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              border: Border.all(
                                width: 2,
                                color: const Color.fromARGB(255, 204, 207, 213),
                              ),
                            ),
                            child: Column(
                              children: [
                                ListTile(
                                  title: Text(
                                    user!.username!,
                                    style: TextStyle(
                                      color: appointmentFor == user!.username!
                                          ? const Color.fromRGBO(
                                              67, 67, 77, 0.9)
                                          : Colors.grey,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15,
                                    ),
                                  ),
                                  leading: Radio(
                                    value: user!.username!,
                                    groupValue: appointmentFor,
                                    onChanged: (value) {
                                      setState(() {
                                        appointmentFor = value.toString();
                                        // debugPrint(appointmentFor);
                                        _fullnameEditingController.text =
                                            user!.fname! + " " + user!.lname!;
                                        _mobileEditingController.text =
                                            user!.phone!;
                                        _emailEditingController.text =
                                            user!.email!;
                                      });
                                    },
                                  ),
                                ),
                                Divider(
                                  color:
                                      const Color.fromARGB(255, 165, 165, 165),
                                  thickness: 0.6,
                                  indent:
                                      MediaQuery.of(context).size.width * 0.05,
                                  endIndent:
                                      MediaQuery.of(context).size.width * 0.05,
                                ),
                                ListTile(
                                  title: Text(
                                    "For someone else",
                                    style: TextStyle(
                                      color: appointmentFor == "Someone else"
                                          ? const Color.fromRGBO(
                                              67, 67, 77, 0.9)
                                          : Colors.grey,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                    ),
                                  ),
                                  leading: Radio(
                                    value: "Someone else",
                                    groupValue: appointmentFor,
                                    onChanged: (value) {
                                      setState(() {
                                        appointmentFor = value.toString();
                                        // debugPrint(appointmentFor);
                                      });
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                  if (user != null)
                    Container(
                      width: double.infinity,
                      color: Colors.white,
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
                      alignment: Alignment.centerLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Please provide following information",
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                              color: Color.fromARGB(210, 118, 125, 152),
                            ),
                          ),
                          TextFormField(
                            controller: _fullnameEditingController,
                            readOnly: appointmentFor == user!.username!
                                ? true
                                : false,
                            decoration: const InputDecoration(
                              hintText: "FullName",
                              hintStyle: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Color.fromARGB(255, 192, 192, 192),
                              ),
                              labelText: "FullName*",
                              labelStyle: TextStyle(
                                fontSize: 15,
                                color: Color.fromARGB(255, 192, 192, 192),
                              ),
                              border: UnderlineInputBorder(),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Enter Full Name";
                              }
                              return null;
                            },
                          ),
                          TextFormField(
                            controller: _mobileEditingController,
                            readOnly: appointmentFor == user!.username!
                                ? true
                                : false,
                            decoration: const InputDecoration(
                              hintText: "Mobile",
                              hintStyle: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Color.fromARGB(255, 192, 192, 192),
                              ),
                              labelText: "Mobile*",
                              labelStyle: TextStyle(
                                fontSize: 15,
                                color: Color.fromARGB(255, 192, 192, 192),
                              ),
                              border: UnderlineInputBorder(),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Enter Mobile";
                              }
                              return null;
                            },
                          ),
                          TextFormField(
                            controller: _emailEditingController,
                            readOnly: appointmentFor == user!.username!
                                ? true
                                : false,
                            decoration: const InputDecoration(
                              hintText: "Email",
                              hintStyle: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Color.fromARGB(255, 192, 192, 192),
                              ),
                              labelText: "Email*",
                              labelStyle: TextStyle(
                                fontSize: 15,
                                color: Color.fromARGB(255, 192, 192, 192),
                              ),
                              border: UnderlineInputBorder(),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Enter Email";
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          InkWell(
                            onTap: () {
                              if (appointmentFor == null) {
                                displayErrorMessage(context,
                                    "Please select who is this Appointment For");
                              }
                              if (_globalKey.currentState!.validate() &&
                                  appointmentFor != null) {
                                BookDoctorAppointment bookDoctorAppointment =
                                    BookDoctorAppointment(
                                  department: appointment[1],
                                  date: _dateEditingController.text,
                                  time: _timeEditingController.text,
                                  email: _emailEditingController.text,
                                  fullname: _fullnameEditingController.text,
                                  mobile: _mobileEditingController.text,
                                  doctorId: appointment[0],
                                );
                                _bookDoctorAppointment(bookDoctorAppointment);
                              }
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: const Color.fromRGBO(11, 86, 222, 5),
                              ),
                              height: 50,
                              width: MediaQuery.of(context).size.width,
                              child: const Center(
                                child: Text(
                                  "Book An Appointment",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 18),
                                ),
                              ),
                            ),
                          ),
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

  _bookDoctorAppointment(BookDoctorAppointment bookdoctorAppointment) async {
    bool isBooked =
        await CategoryRepository().bookDoctorAppointment(bookdoctorAppointment);
    _displayMessage(isBooked);
  }

  _displayMessage(bool isSignUp) {
    if (isSignUp) {
      displaySuccessMessage(context, "Appointment Booked");
      Future.delayed(const Duration(milliseconds: 1500), () {
        // Navigator.pushNamed(context, '/bottomNavBar');
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const BottomNavBar(index: 2)),
        );
      });
    } else {
      displayErrorMessage(context, "Failed to book Appointment");
    }
  }
}
