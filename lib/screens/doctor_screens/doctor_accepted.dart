import 'package:flutter/material.dart';
import 'package:hospital_management_system/repository/category_repository.dart';
import 'package:hospital_management_system/response/doctor_ui_appointment/get_doctor_ui_appointment.dart';
import 'package:hospital_management_system/screens/bottom_nav_doctor.dart';
import 'package:hospital_management_system/utils/show_message.dart';
import 'package:hospital_management_system/utils/url.dart';

class DoctorAcceptedPage extends StatefulWidget {
  const DoctorAcceptedPage({Key? key}) : super(key: key);

  @override
  State<DoctorAcceptedPage> createState() => _DoctorAcceptedPageState();
}

class _DoctorAcceptedPageState extends State<DoctorAcceptedPage> {
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
                const Text(
                  "Accepted Schedule",
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    color: Color.fromARGB(255, 36, 58, 96),
                    fontSize: 20,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                FutureBuilder<List<GetDoctorUIAppointment?>>(
                  future:
                      CategoryRepository().getDoctorUIAppointment("Accepted"),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      if (snapshot.data!.isNotEmpty) {
                        return SizedBox(
                          height: MediaQuery.of(context).size.height / 1.3,
                          child: ListView.separated(
                            itemCount: snapshot.data!.length,
                            separatorBuilder: (BuildContext context, index) {
                              return const SizedBox(height: 20);
                            },
                            itemBuilder: (BuildContext context, index) {
                              return scheduleContainer(snapshot.data![index]);
                            },
                          ),
                        );
                      } else {
                        return const Center(
                          child: Text("No Accepted Schedule"),
                        );
                      }
                      // debugPrint(
                      //     "data Apt doctor: " + snapshot.data.toString());

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

  Widget scheduleContainer(GetDoctorUIAppointment? appointmentResponse) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
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
          borderRadius: BorderRadius.circular(20),
          // color: const Color.fromRGBO(11, 86, 222, 5),
          color: Colors.white,
        ),
        child: Row(
          children: [
            SizedBox(
              height: 80,
              width: 80,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image(
                  image: appointmentResponse!.patientId!.picture == null
                      ? const NetworkImage(
                          "https://w.wallhaven.cc/full/x8/wallhaven-x8gkvz.jpg")
                      : NetworkImage(
                          baseUrl + appointmentResponse.patientId!.picture!),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // SizedBox(
            //   width: 0.0468 * width,
            // ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            appointmentResponse.patientId!.username!,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            appointmentResponse.department!,
                            style: const TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            "Name: " + appointmentResponse.fullname!,
                            style: const TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            appointmentResponse.status!,
                            style: const TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w500,
                              color: Colors.green,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 25,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          if (appointmentResponse.status! == "Accepted")
                            InkWell(
                              onTap: () {
                                endAppointment(appointmentResponse);
                              },
                              child: SizedBox(
                                height: 40,
                                width: 40,
                                child: CircleAvatar(
                                  // backgroundColor: Colors.white,
                                  backgroundColor: Colors.grey[100],

                                  child: const Center(
                                    child: Icon(
                                      Icons.delete_outlined,
                                      size: 25,
                                      color: Colors.red,
                                    ),
                                  ),
                                ),
                              ),
                            )
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const Icon(
                        Icons.lock_clock,
                        color: Colors.green,
                        size: 18,
                      ),
                      Text(
                        appointmentResponse.date! +
                            " - " +
                            appointmentResponse.time!,
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: Colors.green,
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

  endAppointment(GetDoctorUIAppointment appointmentResponse) async {
    // debugPrint("Appointment ID: " + appointmentResponse.id!);
    bool isAccepted = await CategoryRepository()
        .updateDoctorUIAppointment(appointmentResponse.id!, "Ended");
    if (isAccepted) {
      displaySuccessMessage(context, "Appointment Ended");
      Future.delayed(
        const Duration(milliseconds: 1500),
        () {
          // Navigator.pushNamed(context, '/bottomNavBar');
          Navigator.of(context).push(
            MaterialPageRoute(
                builder: (context) => const BottomNavDoctor(index: 1)),
          );
        },
      );
    } else {
      displayErrorMessage(context, "Appointment Couldnot be Ended");
    }
  }
}
