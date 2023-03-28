import 'package:flutter/material.dart';
import 'package:hospital_management_system/repository/category_repository.dart';
import 'package:hospital_management_system/response/doctor_appointment/get_doctor_appointment_response.dart';
import 'package:hospital_management_system/screens/bottom_nav_bar.dart';
import 'package:hospital_management_system/utils/show_message.dart';
import 'package:hospital_management_system/utils/url.dart';

class WearDoctorAppointment extends StatefulWidget {
  const WearDoctorAppointment({Key? key}) : super(key: key);

  @override
  State<WearDoctorAppointment> createState() => _WearDoctorAppointmentState();
}

class _WearDoctorAppointmentState extends State<WearDoctorAppointment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 250, 250, 255),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8),
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
                      "Doctor Appointment Details",
                      style: TextStyle(
                        fontSize: 9,
                        fontWeight: FontWeight.w500,
                        color: Color.fromRGBO(118, 125, 152, 1),
                      ),
                    )
                  ],
                ),
                FutureBuilder<List<GetDoctorAppointmentResponse?>>(
                  future: CategoryRepository().getBookedDoctorAppointment(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      debugPrint("data doctor: " + snapshot.data.toString());

                      return SizedBox(
                        height: MediaQuery.of(context).size.height,
                        child: ListView.separated(
                          itemCount: snapshot.data!.length,
                          separatorBuilder: (BuildContext context, index) {
                            return const SizedBox(height: 5);
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

  Widget scheduleContainer(GetDoctorAppointmentResponse? appointmentResponse) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        padding: const EdgeInsets.fromLTRB(4, 2, 4, 2),
        // height: height * 0.13,
        width: double.infinity,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(255, 235, 235, 235).withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
          borderRadius: BorderRadius.circular(5),
          // color: const Color.fromRGBO(11, 86, 222, 5),
          color: Colors.white,
        ),
        child: Row(
          children: [
            SizedBox(
              height: 30,
              width: 30,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image(
                  image: appointmentResponse!.doctorId!.picture == null
                      ? const NetworkImage(
                          "https://w.wallhaven.cc/full/x8/wallhaven-x8gkvz.jpg")
                      : NetworkImage(
                          baseUrl + appointmentResponse.doctorId!.picture!),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // SizedBox(
            //   width: 0.0468 * width,
            // ),
            Padding(
              padding: const EdgeInsets.fromLTRB(4, 0, 0, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 2),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            appointmentResponse.doctorId!.username!,
                            style: const TextStyle(
                              fontSize: 9,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            appointmentResponse.department!,
                            style: const TextStyle(
                              fontSize: 9,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            "Name: " + appointmentResponse.fullname!,
                            style: const TextStyle(
                              fontSize: 9,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            appointmentResponse.status!,
                            style: TextStyle(
                              fontSize: 9,
                              fontWeight: FontWeight.w500,
                              color: appointmentResponse.status! == "Pending"
                                  ? Colors.amber
                                  : appointmentResponse.status! == "Accepted"
                                      ? Colors.green
                                      : Colors.red,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Icon(
                        Icons.lock_clock,
                        color: appointmentResponse.status! == "Pending"
                            ? Colors.amber
                            : appointmentResponse.status! == "Accepted"
                                ? const Color.fromRGBO(11, 86, 222, 5)
                                // ? Colors.green
                                : Colors.red,
                        size: 8,
                      ),
                      Text(
                        appointmentResponse.date! +
                            " - " +
                            appointmentResponse.time!,
                        style: TextStyle(
                          fontSize: 8,
                          fontWeight: FontWeight.w500,
                          color: appointmentResponse.status! == "Pending"
                              ? Colors.amber
                              : appointmentResponse.status! == "Accepted"
                                  ? const Color.fromRGBO(11, 86, 222, 5)
                                  // ? Colors.green
                                  : Colors.red,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  deleteAppointment(GetDoctorAppointmentResponse appointmentResponse) async {
    bool isDeleted;
    isDeleted = await CategoryRepository()
        .deleteDoctorAppointment(appointmentResponse.id!);
    if (isDeleted == true) {
      // debugPrint(isDeleted.toString());
      displaySuccessMessage(context, "Appointment deleted successfully");
      Future.delayed(
        const Duration(milliseconds: 1500),
        () {
          // Navigator.pushNamed(context, '/bottomNavBar');
          Navigator.of(context).push(
            MaterialPageRoute(
                builder: (context) => const BottomNavBar(index: 2)),
          );
        },
      );
    }
  }
}
