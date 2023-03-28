import 'package:flutter/material.dart';
import 'package:hospital_management_system/repository/user_repository.dart';
import 'package:hospital_management_system/screens/wear_os_screens/wear_dashboard.dart';
import 'package:hospital_management_system/widgets/text_form_field_input.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:wear/wear.dart';

class WearOsLogin extends StatefulWidget {
  const WearOsLogin({Key? key}) : super(key: key);

  @override
  State<WearOsLogin> createState() => _WearOsLoginState();
}

class _WearOsLoginState extends State<WearOsLogin> {
  final _usernameEditingController = TextEditingController();
  final _passwordEditingController = TextEditingController();
  final _globalKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    _usernameEditingController.dispose();
    _passwordEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WatchShape(
      builder: (BuildContext context, WearShape shape, Widget? child) {
        return AmbientMode(
          builder: (context, mode, child) {
            return Scaffold(
              body: SafeArea(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Form(
                      key: _globalKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // Textformfield for username
                          TextFormFieldInput(
                            textEditingController: _usernameEditingController,
                            hintText: "UserName",
                            prefixIcon: const Icon(
                              Icons.remove_red_eye,
                              color: Color.fromARGB(156, 183, 184, 186),
                            ),
                            textInputType: TextInputType.visiblePassword,
                          ),

                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.02),

                          // Textformfield for password
                          TextFormFieldInput(
                            textEditingController: _passwordEditingController,
                            hintText: "Password",
                            prefixIcon: const Icon(
                              Icons.access_alarm,
                              color: Color.fromARGB(156, 183, 184, 186),
                            ),
                            textInputType: TextInputType.visiblePassword,
                            isPass: true,
                          ),

                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.01),

                          InkWell(
                            onTap: () {
                              if (_globalKey.currentState!.validate()) {
                                _login();
                              }
                            },
                            child: Container(
                              child: const Text(
                                "Login",
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
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  _login() async {
    UserRepository userRepository = UserRepository();
    bool isLogin = await userRepository.loginUser(
      _usernameEditingController.text,
      _passwordEditingController.text,
    );
    _navitageToPatientScreen(isLogin);
  }

  _navitageToPatientScreen(bool isLogin) {
    if (isLogin == true) {
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => const WearOsDashboard()),
      );
    } else {
      MotionToast.error(
              description: const Text("Invalid Patient Credentials.."))
          .show(context);
    }
  }
}
