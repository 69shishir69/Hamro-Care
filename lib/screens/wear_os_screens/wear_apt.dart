import 'package:flutter/material.dart';
import 'package:hospital_management_system/models/health_category.dart';
import 'package:hospital_management_system/repository/category_repository.dart';
import 'package:hospital_management_system/response/appointment_response.dart';
import 'package:hospital_management_system/screens/bottom_nav_bar.dart';
import 'package:hospital_management_system/utils/show_message.dart';

class WearAppointment extends StatefulWidget {
  const WearAppointment({Key? key}) : super(key: key);

  @override
  State<WearAppointment> createState() => _WearAppointmentState();
}

class _WearAppointmentState extends State<WearAppointment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 250, 250, 255),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
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
                          width: 30,
                          height: 15,
                          child: const Text(
                            "Back",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 9,
                            ),
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            color: const Color.fromARGB(248, 0, 71, 203),
                            // border:
                          ),
                          alignment: Alignment.center,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      "Patient Details",
                      style: TextStyle(
                        fontSize: 9,
                        fontWeight: FontWeight.w500,
                        color: Color.fromRGBO(118, 125, 152, 1),
                      ),
                    )
                  ],
                ),
                FutureBuilder<List<AppointmentResponse?>>(
                  future: CategoryRepository().getBookedAppointment(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      // debugPrint("data: " + snapshot.data.toString());

                      return SizedBox(
                        height: MediaQuery.of(context).size.height,
                        child: ListView.separated(
                          itemCount: snapshot.data!.length,
                          separatorBuilder: (BuildContext context, index) {
                            return const SizedBox(height: 4);
                          },
                          itemBuilder: (BuildContext context, index) {
                            return scheduleContainer(snapshot.data![index]);
                          },
                        ),
                      );
                    } else if (snapshot.hasError) {
                      return const Center(
                        child: Text("Error"),
                      );
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget scheduleContainer(AppointmentResponse? appointmentResponse) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              // color: const Color.fromARGB(255, 222, 222, 222).withOpacity(0.5),
              color: const Color.fromARGB(255, 218, 226, 255).withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
          borderRadius: BorderRadius.circular(5),
          // color: const Color.fromRGBO(11, 86, 222, 5),
          color: Colors.white,
        ),
        width: double.infinity,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      appointmentResponse!.fullname!,
                      style: const TextStyle(
                        // color: Colors.black87,
                        color: Color.fromARGB(248, 0, 71, 203),
                        fontSize: 9,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      appointmentResponse.category!,
                      style: const TextStyle(
                        // color: Color.fromARGB(255, 226, 226, 226),
                        fontSize: 9,

                        color: Color.fromARGB(255, 155, 174, 255),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                // color: const Color.fromARGB(248, 0, 71, 203),
                color: const Color.fromRGBO(11, 86, 222, 5),

                // color: Colors.grey[100],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      const Icon(
                        Icons.lock_clock,
                        size: 9,
                        // color: Color.fromARGB(248, 0, 71, 203),
                        color: Colors.white,
                      ),
                      Text(
                        appointmentResponse.date! +
                            " " +
                            appointmentResponse.time!,
                        style: const TextStyle(
                          // color: Color.fromARGB(248, 0, 71, 203),
                          fontSize: 8,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  deleteAppointment(AppointmentResponse appointmentResponse) async {
    bool isDeleted;
    HealthCategory? healthCategory = await CategoryRepository()
        .getHealthCategoryId(appointmentResponse.category!);
    debugPrint(appointmentResponse.time!);
    bool isAdded = await CategoryRepository().reAddAppointmentTime(
      healthCategory!.id!,
      appointmentResponse.date!,
      appointmentResponse.time!,
    );
    // debugPrint(isAdded.toString());
    if (isAdded) {
      isDeleted =
          await CategoryRepository().deleteAppointment(appointmentResponse.id!);
      if (isDeleted) {
        // debugPrint(isDeleted.toString());
        displaySuccessMessage(context, "Appointment deleted successfully");

        Future.delayed(
          const Duration(milliseconds: 1500),
          () {
            // Navigator.pushNamed(context, '/bottomNavBar');
            Navigator.of(context).push(
              MaterialPageRoute(
                  builder: (context) => const BottomNavBar(index: 1)),
            );
          },
        );
      }
    }
  }
}
