import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hospital_management_system/models/patient_profile.dart';
import 'package:hospital_management_system/models/user.dart';
import 'package:hospital_management_system/repository/user_repository.dart';
import 'package:hospital_management_system/screens/bottom_nav_bar.dart';
import 'package:hospital_management_system/utils/show_message.dart';
import 'package:image_picker/image_picker.dart';

class PatientProfileUpdate extends StatefulWidget {
  const PatientProfileUpdate({Key? key}) : super(key: key);

  @override
  State<PatientProfileUpdate> createState() => _PatientProfileUpdateState();
}

class _PatientProfileUpdateState extends State<PatientProfileUpdate> {
  File? img;
  Future _loadImage(ImageSource imageSource) async {
    try {
      final image = await ImagePicker().pickImage(source: imageSource);
      if (image != null) {
        setState(() {
          img = File(image.path);
        });
      } else {
        return;
      }
    } catch (e) {
      debugPrint('Failed to pick Image $e');
    }
  }

  Color blue = const Color.fromRGBO(11, 86, 222, 5);
  Color grey = Colors.grey;
  User? user;

  final _fnameEditingController = TextEditingController();
  final _lnameEditingController = TextEditingController();
  final _genderEditingController = TextEditingController();
  final _ageEditingController = TextEditingController();
  final _mobileEditingController = TextEditingController();
  final _usernameEditingController = TextEditingController();
  final _addressEditingController = TextEditingController();

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
      if (user != null) {
        _fnameEditingController.text = user!.fname!;
        _lnameEditingController.text = user!.lname!;
        _genderEditingController.text = user!.gender!;
        _ageEditingController.text = user!.age!;
        _mobileEditingController.text = user!.phone!;
        _usernameEditingController.text = user!.username!;
        _addressEditingController.text = user!.address!;
      }
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
                        "Update Profile",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Color.fromRGBO(118, 125, 152, 1),
                        ),
                      )
                    ],
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
                            controller: _fnameEditingController,
                            decoration: const InputDecoration(
                              hintText: "FirstName",
                              hintStyle: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Color.fromARGB(255, 192, 192, 192),
                              ),
                              labelText: "FirstName*",
                              labelStyle: TextStyle(
                                fontSize: 15,
                                color: Color.fromARGB(255, 192, 192, 192),
                              ),
                              border: UnderlineInputBorder(),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "*Enter FirstName";
                              }
                              return null;
                            },
                          ),
                          TextFormField(
                            controller: _lnameEditingController,
                            decoration: const InputDecoration(
                              hintText: "LastName",
                              hintStyle: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Color.fromARGB(255, 192, 192, 192),
                              ),
                              labelText: "LastName*",
                              labelStyle: TextStyle(
                                fontSize: 15,
                                color: Color.fromARGB(255, 192, 192, 192),
                              ),
                              border: UnderlineInputBorder(),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "*Enter LastName";
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
                            controller: _usernameEditingController,
                            decoration: const InputDecoration(
                              hintText: "Username",
                              hintStyle: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Color.fromARGB(255, 192, 192, 192),
                              ),
                              labelText: "Username*",
                              labelStyle: TextStyle(
                                fontSize: 15,
                                color: Color.fromARGB(255, 192, 192, 192),
                              ),
                              border: UnderlineInputBorder(),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Enter Username";
                              }
                              return null;
                            },
                          ),
                          TextFormField(
                            controller: _genderEditingController,
                            decoration: const InputDecoration(
                              hintText: "Gender",
                              hintStyle: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Color.fromARGB(255, 192, 192, 192),
                              ),
                              labelText: "Gender*",
                              labelStyle: TextStyle(
                                fontSize: 15,
                                color: Color.fromARGB(255, 192, 192, 192),
                              ),
                              border: UnderlineInputBorder(),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Enter Gender";
                              }
                              return null;
                            },
                          ),
                          TextFormField(
                            controller: _ageEditingController,
                            decoration: const InputDecoration(
                              hintText: "Age",
                              hintStyle: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Color.fromARGB(255, 192, 192, 192),
                              ),
                              labelText: "Age*",
                              labelStyle: TextStyle(
                                fontSize: 15,
                                color: Color.fromARGB(255, 192, 192, 192),
                              ),
                              border: UnderlineInputBorder(),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Enter Age";
                              }
                              return null;
                            },
                          ),
                          TextFormField(
                            controller: _addressEditingController,
                            decoration: const InputDecoration(
                              hintText: "Address",
                              hintStyle: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Color.fromARGB(255, 192, 192, 192),
                              ),
                              labelText: "Address*",
                              labelStyle: TextStyle(
                                fontSize: 15,
                                color: Color.fromARGB(255, 192, 192, 192),
                              ),
                              border: UnderlineInputBorder(),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Enter Address";
                              }
                              return null;
                            },
                          ),
                          // SizedBox(
                          //   width: double.infinity,
                          //   child: ElevatedButton.icon(
                          //     onPressed: () {
                          //       _loadImage(ImageSource.gallery);
                          //     },
                          //     icon: const Icon(
                          //         Icons.photo_size_select_actual_rounded),
                          //     label: const Text('Select Image'),
                          //   ),
                          // ),
                          // _displayImage(),
                          const SizedBox(
                            height: 10,
                          ),
                          InkWell(
                            onTap: () {
                              if (_globalKey.currentState!.validate()) {
                                PatientProfile updateProfile = PatientProfile(
                                  fname: _fnameEditingController.text,
                                  lname: _lnameEditingController.text,
                                  gender: _genderEditingController.text,
                                  age: _ageEditingController.text,
                                  username: _usernameEditingController.text,
                                  phone: _mobileEditingController.text,
                                  address: _addressEditingController.text,
                                );
                                _updatePatientProfile(
                                  updateProfile,
                                  img,
                                );
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
                                  "Update Profile",
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

  _updatePatientProfile(PatientProfile patientProfile, File? image) async {
    bool isBooked =
        await UserRepository().updatePatientProfile(patientProfile, image);
    _displayMessage(isBooked);
  }

  _displayMessage(bool isSignUp) {
    if (isSignUp) {
      displaySuccessMessage(context, "Profile Updated Successfully");
      Future.delayed(const Duration(milliseconds: 1500), () {
        // Navigator.pushNamed(context, '/bottomNavBar');
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const BottomNavBar(index: 3)),
        );
      });
    } else {
      displayErrorMessage(context, "Failed to book Appointment");
    }
  }

  // Widget _displayImage() {
  //   return Card(
  //     shape: RoundedRectangleBorder(
  //       borderRadius: BorderRadius.circular(5),
  //       side: const BorderSide(
  //         color: Color.fromARGB(255, 94, 94, 94),
  //         width: 2,
  //       ),
  //     ),
  //     child: ClipRRect(
  //       // For rounded upper right corner and left corner in imageview
  //       borderRadius: BorderRadius.circular(5),
  //       child: SingleChildScrollView(
  //         physics: const BouncingScrollPhysics(),
  //         child: Column(
  //           children: [
  //             Padding(
  //               padding: const EdgeInsets.all(8.0),
  //               child: img == null
  //                   ? Image.network(
  //                       'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460__480.png',
  //                       fit: BoxFit.fill,
  //                       height: 50,
  //                       width: 50,
  //                     )
  //                   : Image.file(img!),
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }
}
