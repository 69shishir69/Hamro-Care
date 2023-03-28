import 'package:flutter/material.dart';
import 'package:hospital_management_system/models/user.dart';
import 'package:hospital_management_system/repository/user_repository.dart';
import 'package:hospital_management_system/utils/show_message.dart';
import 'package:hospital_management_system/widgets/text_form_field_input.dart';

class RegisterPageScreen extends StatefulWidget {
  const RegisterPageScreen({Key? key}) : super(key: key);

  @override
  State<RegisterPageScreen> createState() => _RegisterPageScreenState();
}

class _RegisterPageScreenState extends State<RegisterPageScreen> {
  final _fnameEditingController = TextEditingController();
  final _lnameEditingController = TextEditingController();
  final _emailEditingController = TextEditingController();
  final _passwordEditingController = TextEditingController();
  final _usernameEditingController = TextEditingController();
  final _addressEditingController = TextEditingController();
  final _phoneEditingController = TextEditingController();

  final _globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 250, 250, 255),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Form(
              key: _globalKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  // Flexible(child: Container(), flex: 1),
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
                          color: const Color.fromRGBO(11, 86, 222, 5),
                          // border:
                        ),
                        alignment: Alignment.center,
                      ),
                    ),
                  ),

                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),

                  // text form field for firstname
                  TextFormFieldInput(
                    key: const ValueKey("txtFirst"),
                    textEditingController: _fnameEditingController,
                    hintText: "Fname",
                    prefixIcon: const Icon(
                      Icons.access_alarm,
                      color: Color.fromARGB(156, 183, 184, 186),
                    ),
                    textInputType: TextInputType.visiblePassword,
                  ),

                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),

                  // text form field for firstname
                  TextFormFieldInput(
                    key: const ValueKey("txtLast"),
                    textEditingController: _lnameEditingController,
                    hintText: "Lname",
                    prefixIcon: const Icon(
                      Icons.access_alarm,
                      color: Color.fromARGB(156, 183, 184, 186),
                    ),
                    textInputType: TextInputType.visiblePassword,
                  ),

                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),

                  // textformfield for email
                  TextFormFieldInput(
                    key: const ValueKey("txtEmail"),
                    textEditingController: _emailEditingController,
                    hintText: "Email",
                    prefixIcon: const Icon(
                      Icons.access_alarm,
                      color: Color.fromARGB(156, 183, 184, 186),
                    ),
                    textInputType: TextInputType.visiblePassword,
                  ),

                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),

                  // textformfield for password
                  TextFormFieldInput(
                    key: const ValueKey("txtPassword"),
                    textEditingController: _passwordEditingController,
                    hintText: "Password",
                    prefixIcon: const Icon(
                      Icons.access_alarm,
                      color: Color.fromARGB(156, 183, 184, 186),
                    ),
                    textInputType: TextInputType.visiblePassword,
                    isPass: true,
                  ),

                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),

                  // textformfield for username
                  TextFormFieldInput(
                    key: const ValueKey("txtUsername"),
                    textEditingController: _usernameEditingController,
                    hintText: "Username",
                    prefixIcon: const Icon(
                      Icons.access_alarm,
                      color: Color.fromARGB(156, 183, 184, 186),
                    ),
                    textInputType: TextInputType.visiblePassword,
                  ),

                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),

                  // textformfield for address
                  TextFormFieldInput(
                    key: const ValueKey("txtAddress"),
                    textEditingController: _addressEditingController,
                    hintText: "Address",
                    prefixIcon: const Icon(
                      Icons.access_alarm,
                      color: Color.fromARGB(156, 183, 184, 186),
                    ),
                    textInputType: TextInputType.visiblePassword,
                  ),

                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),

                  // texteditingcontroller for phone
                  TextFormFieldInput(
                    key: const ValueKey("txtPhone"),
                    textEditingController: _phoneEditingController,
                    hintText: "Phone",
                    prefixIcon: const Icon(
                      Icons.access_alarm,
                      color: Color.fromARGB(156, 183, 184, 186),
                    ),
                    textInputType: TextInputType.visiblePassword,
                  ),

                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),

                  // SignUp button
                  InkWell(
                    key: const ValueKey("btnSignup"),
                    onTap: () {
                      if (_globalKey.currentState!.validate()) {
                        User user = User(
                          fname: _fnameEditingController.text,
                          lname: _lnameEditingController.text,
                          username: _usernameEditingController.text,
                          email: _emailEditingController.text,
                          phone: _phoneEditingController.text,
                          address: _addressEditingController.text,
                          password: _passwordEditingController.text,
                        );
                        _registerUser(user);
                      }
                    },
                    child: Container(
                      child: const Text(
                        "SignUp",
                        style: TextStyle(color: Colors.white),
                      ),
                      width: double.infinity,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      decoration: const ShapeDecoration(
                        color: Color.fromRGBO(11, 86, 222, 5),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(4),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: const Text("Already an Account? "),
                        padding: const EdgeInsets.symmetric(vertical: 8),
                      ),

                      // SignUp button
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/login');
                        },
                        child: Container(
                          child: const Text(
                            "Login",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromRGBO(11, 86, 222, 5)),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 8),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _registerUser(User user) async {
    bool isSignUp = await UserRepository().registerUser(user);
    _displayMessage(isSignUp);
  }

  _displayMessage(bool isSignUp) {
    if (isSignUp) {
      displaySuccessMessage(context, "register success");
      Navigator.pushNamed(context, '/login');
    } else {
      displayErrorMessage(context, "register Failed");
    }
  }
}
