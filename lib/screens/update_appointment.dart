import 'package:flutter/material.dart';
import 'package:hospital_management_system/repository/category_repository.dart';
import 'package:hospital_management_system/response/appointment_response.dart';
import 'package:hospital_management_system/screens/bottom_nav_bar.dart';
import 'package:hospital_management_system/utils/show_message.dart';

class UpdateAppointmentScreen extends StatefulWidget {
  const UpdateAppointmentScreen({Key? key}) : super(key: key);

  @override
  State<UpdateAppointmentScreen> createState() =>
      _UpdateAppointmentScreenState();
}

class _UpdateAppointmentScreenState extends State<UpdateAppointmentScreen> {
  Color blue = const Color.fromRGBO(11, 86, 222, 5);
  Color grey = Colors.grey;
  String? appointmentFor;

  final _fullnameEditingController = TextEditingController();
  final _mobileEditingController = TextEditingController();
  final _emailEditingController = TextEditingController();

  final _globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    AppointmentResponse appointmentResponse =
        ModalRoute.of(context)!.settings.arguments as AppointmentResponse;
    debugPrint(appointmentResponse.toString());
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
                          Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) =>
                                    const BottomNavBar(index: 1)),
                          );
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
                  Container(
                    color: Colors.white,
                    width: double.infinity,
                    // height: 70,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 10, 0, 10),
                      child: Row(
                        children: [
                          const CircleAvatar(
                            backgroundImage: NetworkImage(
                                "https://w.wallhaven.cc/full/v9/wallhaven-v9kw9l.jpg"),
                            radius: 25,
                          ),
                          const SizedBox(
                            width: 40,
                          ),
                          Text(
                            appointmentResponse.fullname!,
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
                          appointmentResponse.visitPurpose!,
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
                          "Date and Time",
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: Color.fromARGB(210, 118, 125, 152),
                          ),
                        ),
                        Text(
                          appointmentResponse.date! +
                              " " +
                              appointmentResponse.time!,
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
                                  appointmentResponse.fullname!,
                                  style: TextStyle(
                                    color: appointmentFor ==
                                            appointmentResponse.fullname!
                                        ? const Color.fromRGBO(67, 67, 77, 0.9)
                                        : Colors.grey,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15,
                                  ),
                                ),
                                leading: Radio(
                                  value: appointmentResponse.fullname!,
                                  groupValue: appointmentFor,
                                  onChanged: (value) {
                                    setState(() {
                                      appointmentFor = value.toString();
                                      // debugPrint(appointmentFor);
                                      _fullnameEditingController.text =
                                          appointmentResponse.fullname!;
                                      _mobileEditingController.text =
                                          appointmentResponse.mobile!;
                                      _emailEditingController.text =
                                          appointmentResponse.email!;
                                    });
                                  },
                                ),
                              ),
                              Divider(
                                color: const Color.fromARGB(255, 165, 165, 165),
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
                                        ? const Color.fromRGBO(67, 67, 77, 0.9)
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
                                      _fullnameEditingController.text = "";
                                      _mobileEditingController.text = "";
                                      _emailEditingController.text = "";
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
                              AppointmentResponse updateAppointment =
                                  AppointmentResponse(
                                id: appointmentResponse.id!,
                                category: appointmentResponse.category!,
                                date: appointmentResponse.date!,
                                time: appointmentResponse.time!,
                                appointmentFor: appointmentFor,
                                visitPurpose: appointmentResponse.visitPurpose!,
                                email: _emailEditingController.text,
                                fullname: _fullnameEditingController.text,
                                mobile: _mobileEditingController.text,
                              );
                              _updateAppointment(updateAppointment);
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
                                "Update Appointment",
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

  _updateAppointment(AppointmentResponse updateAppointment) async {
    bool isUpdated =
        await CategoryRepository().updateAppointment(updateAppointment);
    // debugPrint(isUpdated.toString());
    _displayMessage(isUpdated);
  }

  _displayMessage(bool isUpdated) {
    if (isUpdated) {
      displaySuccessMessage(context, "Appointment Updated");
      Future.delayed(const Duration(milliseconds: 1500), () {
        // Navigator.pushNamed(context, '/bottomNavBar');
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const BottomNavBar(index: 1)),
        );
      });
    } else {
      displayErrorMessage(context, "Failed to update Appointment");
    }
  }
}
