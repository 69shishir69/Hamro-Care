import 'package:flutter/material.dart';
import 'package:hospital_management_system/models/health_category.dart';
import 'package:hospital_management_system/repository/category_repository.dart';
import 'package:hospital_management_system/screens/bottom_nav_bar.dart';
import 'package:shake/shake.dart';

class DoctorDepartmentScreen extends StatefulWidget {
  const DoctorDepartmentScreen({Key? key}) : super(key: key);

  @override
  State<DoctorDepartmentScreen> createState() => _DoctorDepartmentScreenState();
}

class _DoctorDepartmentScreenState extends State<DoctorDepartmentScreen> {
  late ShakeDetector detector;

  @override
  void initState() {
    super.initState();

    detector = ShakeDetector.autoStart(
      onPhoneShake: () {
        setState(() {
          Navigator.of(context).push(
            MaterialPageRoute(
                builder: (context) => const BottomNavBar(index: 2)),
          );
        });
      },
    );
  }

  @override
  void dispose() {
    detector.stopListening();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 250, 250, 255),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) =>
                                  const BottomNavBar(index: 0)),
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
                            color: const Color.fromRGBO(11, 86, 222, 5),
                            // border:
                          ),
                          alignment: Alignment.center,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 70,
                    ),
                    const Text(
                      "Book an Appointment",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Color.fromRGBO(118, 125, 152, 1),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 15),
                Container(
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    "Choose Department of a doctor",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Color.fromRGBO(67, 78, 97, 1),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                FutureBuilder<List<HealthCategory?>>(
                  future: CategoryRepository().loadHealthCategory(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      // print(snapshot.data![0]!.name);
                      // print(snapshot.data!.length);

                      return SizedBox(
                        height: MediaQuery.of(context).size.height / 1.3,
                        // color: Colors.amber,
                        child: GridView.builder(
                          itemCount: snapshot.data!.length,
                          gridDelegate:
                              const SliverGridDelegateWithMaxCrossAxisExtent(
                            crossAxisSpacing: 10.0,
                            mainAxisSpacing: 10.0,
                            maxCrossAxisExtent: 200,
                            childAspectRatio: 1.8,
                          ),
                          itemBuilder: (BuildContext context, int index) {
                            return InkWell(
                              onTap: () {
                                Navigator.pushNamed(context, "/searchDoctor",
                                    arguments: [
                                      snapshot.data![index]!.id!,
                                      snapshot.data![index]!.name!
                                    ]);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color:
                                      const Color.fromRGBO(225, 241, 255, 0.5),
                                ),
                                child: Center(
                                  child: Text(
                                    snapshot.data![index]!.name!,
                                    style: const TextStyle(
                                        color:
                                            Color.fromRGBO(131, 131, 131, 1)),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    } else if (snapshot.hasError) {
                      return const Text("Error");
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  _loadHealthCategory() {}
}
