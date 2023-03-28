import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hospital_management_system/screens/bottom_nav_bar.dart';
import 'package:hospital_management_system/screens/bottom_nav_doctor.dart';
import 'package:hospital_management_system/screens/login_page.dart';
import 'package:hospital_management_system/screens/patient_profile.dart';
import 'package:hospital_management_system/screens/register_page.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets(
    'Registration Test',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: RegisterPageScreen(),
        ),
      );
      Finder txtFname = find.byKey(const ValueKey('txtFirst'));
      await tester.enterText(txtFname, 'b');
      Finder txtLname = find.byKey(const ValueKey('txtLast'));
      await tester.enterText(txtLname, 'b');
      Finder txtEmmail = find.byKey(const ValueKey('txtEmail'));
      await tester.enterText(txtEmmail, 'cccccfff');
      Finder txtPhone = find.byKey(const ValueKey('txtPhone'));
      await tester.enterText(txtPhone, '123');
      Finder txtUsername = find.byKey(const ValueKey('txtUsername'));
      await tester.enterText(txtUsername, 'and');
      Finder txtAddress = find.byKey(const ValueKey('txtAddress'));
      await tester.enterText(txtAddress, 'and');
      Finder txtPassword = find.byKey(const ValueKey('txtPassword'));
      await tester.enterText(txtPassword, 'c');
      Finder btnRegister = find.byKey(const ValueKey('btnSignup'));
      await tester.dragUntilVisible(
        btnRegister, // what you want to find
        find.byType(SingleChildScrollView), // widget you want to scroll
        const Offset(0, 50), // delta to move
      );
      await tester.tap(btnRegister);
      await tester.pumpAndSettle();
      expect(find.byType(SafeArea), findsOneWidget);
    },
  );

  testWidgets('Login Test', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        routes: {
          '/bottom_navbar': (context) => const BottomNavBar(index: 0),
        },
        home: const LoginPageScreen(),
      ),
    );
    Finder btnPatient = find.byKey(const ValueKey('btnPatient'));
    await tester.tap(btnPatient);
    Finder txtEmail = find.byKey(const ValueKey('txtUsername'));
    await tester.enterText(txtEmail, 'shishir');
    Finder txtPassword = find.byKey(const ValueKey('txtPassword'));
    await tester.enterText(txtPassword, 'shishir');
    Finder btnLogin = find.byKey(const ValueKey('btnLogin'));
    await tester.tap(btnLogin);
    await tester.pumpAndSettle();
    expect(find.text("Login as: "), findsOneWidget);
  });

  testWidgets('Doctor Login Test', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        routes: {
          '/bottom_navbar_doc': (context) => const BottomNavDoctor(index: 0),
        },
        home: const LoginPageScreen(),
      ),
    );
    Finder btnDoctor = find.byKey(const ValueKey('btnDoctor'));
    await tester.tap(btnDoctor);
    Finder txtEmail = find.byKey(const ValueKey('txtUsername'));
    await tester.enterText(txtEmail, 'a');
    Finder txtPassword = find.byKey(const ValueKey('txtPassword'));
    await tester.enterText(txtPassword, 'a');
    Finder btnLogin = find.byKey(const ValueKey('btnLogin'));
    await tester.tap(btnLogin);
    await tester.pumpAndSettle();
    expect(find.byType(SafeArea), findsOneWidget);
  });

  testWidgets("check Profile", (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        routes: {
          "/bottomNavBar": (context) => const BottomNavBar(index: 0),
          // "/aboutus": (context) => const AboutUsScreen(),
        },
        home: const PatientDetails(),
      ),
    );
    expect(find.text("User Details"), findsOneWidget);
  });
}
