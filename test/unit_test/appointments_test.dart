import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hospital_management_system/models/appointment_hdt_model.dart';
import 'package:hospital_management_system/models/health_category.dart';
import 'package:hospital_management_system/repository/category_repository.dart';

void main() {
  // String? token;
  // setUp(() {
  //   token =
  //       "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJwSUQiOiI2MmI5MzIzYjRiMGExMTI3ZTI2ZTg2NzciLCJpYXQiOjE2NTYzMDUxMzJ9.b0mDsiOctIg0jwDRhEwxX2gRlE8FPhXG9DShMrgluVk";
  //   categoryRepository = CategoryRepository();
  // });

  test("show Category", () async {
    String? expectedResult = "Women's Health";
    debugPrint(expectedResult);

    List<HealthCategory?> actualResultList =
        await CategoryRepository().loadHealthCategory();
    debugPrint(expectedResult);

    debugPrint(actualResultList.toString());
    String? actualResult = actualResultList[0]!.name;
    expect(expectedResult, actualResult);
  });

  test("show Department", () async {
    String? expectedResult = "Women's Health";
    debugPrint(expectedResult);

    List<HealthCategory?> actualResultList =
        await CategoryRepository().loadHealthCategory();
    debugPrint(expectedResult);

    debugPrint(actualResultList.toString());
    String? actualResult = actualResultList[0]!.name;
    expect(expectedResult, actualResult);
  });

  test("show Date", () async {
    String? expectedResult = "Tuesday, 24 December, 2021";
    debugPrint(expectedResult);
    String hcId = "62b491ca29d24b17c62174d8";

    List<AppointmentHDTModel?> actualResultList =
        await CategoryRepository().loadAppointmentHDT(hcId);
    debugPrint(expectedResult);

    debugPrint(actualResultList.toString());
    String? actualResult = actualResultList[0]!.date;
    expect(expectedResult, actualResult);
  });
}
