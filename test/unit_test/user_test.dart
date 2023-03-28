import 'package:flutter_test/flutter_test.dart';
import 'package:hospital_management_system/models/user.dart';
import 'package:hospital_management_system/repository/user_repository.dart';

void main() {
  late UserRepository? userRepository;
  String? token;

  setUp(() {
    userRepository = UserRepository();
    token = "";
  });
  group("User Tests", () {
    test("user registration", () async {
      bool? expectedResult = true;
      User user = User(
        fname: "Shishir",
        lname: "Kandel",
        gender: "male",
        age: "21",
        username: "B3AV3R69",
        email: "sk4@g.com",
        phone: "9840171407",
        address: "Sankhamul",
        password: "shishir123",
      );
      bool actualResult = await userRepository!.registerUser(user);
      expect(expectedResult, actualResult);
    });

    test("user login", () async {
      bool? expectedResult = true;
      String? email = "shishir";
      String? password = "shishir";
      bool actualResult = await userRepository!.loginUser(email, password);
      expect(expectedResult, actualResult);
    });

    test("Doctor login", () async {
      bool? expectedResult = true;
      String? email = "a";
      String? password = "a";
      bool actualResult = await userRepository!.loginDoctor(email, password);
      expect(expectedResult, actualResult);
    });
  });

  tearDown(() {
    userRepository = null;
  });
}
