import 'package:flutter/material.dart';
import 'package:hospital_management_system/models/appointment_hdt_model.dart';
import 'package:hospital_management_system/repository/category_repository.dart';

class AppointmentDateScreen extends StatefulWidget {
  const AppointmentDateScreen({Key? key}) : super(key: key);

  @override
  State<AppointmentDateScreen> createState() => _AppointmentDateScreenState();
}

class _AppointmentDateScreenState extends State<AppointmentDateScreen> {
  Color blue = const Color.fromRGBO(11, 86, 222, 5);
  Color grey = const Color.fromARGB(255, 185, 185, 185);

  int? selectedIndexDate;
  List<String?> time = [];
  bool? isSelectedDate = false;
  String? dateValue;

  int? selectedIndexTime;
  bool? isSelectedTime;
  String? timeValue;

  @override
  Widget build(BuildContext context) {
    List<String>? healthCategoryList =
        ModalRoute.of(context)!.settings.arguments as List<String>;
    debugPrint(MediaQuery.of(context).size.height.toString());
    debugPrint(MediaQuery.of(context).size.width.toString());

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 250, 250, 255),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
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
                      width: 50,
                    ),
                    const Text(
                      "Available Appointments",
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
                    "Choose a Date",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Color.fromARGB(255, 56, 71, 96),
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                FutureBuilder<List<AppointmentHDTModel?>>(
                  future: CategoryRepository()
                      .loadAppointmentHDT(healthCategoryList[0]),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return SizedBox(
                        // height: MediaQuery.of(context).size.height / 7,
                        child: GridView.builder(
                          shrinkWrap: true,
                          itemCount: snapshot.data!.length,
                          gridDelegate:
                              const SliverGridDelegateWithMaxCrossAxisExtent(
                            crossAxisSpacing: 10.0,
                            mainAxisSpacing: 10.0,
                            maxCrossAxisExtent: 200,
                            childAspectRatio: 2,
                          ),
                          itemBuilder: (BuildContext context, index) {
                            return dateAndtime(snapshot.data![index], index);
                          },
                        ),
                      );
                    } else if (snapshot.hasError) {
                      return const Text("Error");
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  },
                ),
                const SizedBox(height: 25),
                if (isSelectedDate!)
                  Column(
                    children: [
                      Text(
                        "$dateValue",
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Color.fromRGBO(67, 78, 97, 1),
                        ),
                      ),
                      const Divider(
                        height: 30,
                        indent: 30,
                        endIndent: 30,
                        thickness: 0.6,
                        color: Colors.black,
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
                          child: GridView.count(
                            shrinkWrap: true,
                            crossAxisCount:
                                MediaQuery.of(context).size.height > 420
                                    ? 3
                                    : 5,
                            mainAxisSpacing: 20,
                            crossAxisSpacing: 20,
                            childAspectRatio: 1.9,
                            children: List.generate(time.length, (index) {
                              return timeWidget(time[index]!, index);
                            }),
                          ),
                        ),
                      )
                    ],
                  ),
                const SizedBox(height: 25),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/appointmentDetailScreen',
                        arguments: [
                          healthCategoryList,
                          dateValue,
                          timeValue,
                        ]);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: const Color.fromRGBO(11, 86, 222, 5),
                    ),
                    height: 50,
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: const Center(
                      child: Text(
                        "Book An Appointment",
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
        ),
      ),
    );
  }

  Widget dateAndtime(AppointmentHDTModel? appointmentHDTModel, int index) {
    return InkWell(
      onTap: () {
        setState(() {
          selectedIndexDate = index;
          time = appointmentHDTModel!.time;
          isSelectedDate = true;
          dateValue = appointmentHDTModel.date;
          timeValue = "";
          selectedIndexTime = null;
        });
      },
      child: Container(
        height: 60,
        // width: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          border: Border.all(
            width: 1.2,
            color: selectedIndexDate == index ? blue : grey,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(8.0, 0, 8, 6),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                appointmentHDTModel!.date!,
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
              Text(
                appointmentHDTModel.time.length.toString() + " Available Slots",
                style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Color.fromARGB(255, 63, 219, 68)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget timeWidget(String timeData, int index) {
    List<String> timeValueList = timeData.split(" ");
    return InkWell(
      onTap: () {
        setState(() {
          selectedIndexTime = index;
          timeValue = timeData;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          border: Border.all(
            width: 1.2,
            color: selectedIndexTime == index ? blue : grey,
            style: BorderStyle.solid,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(4),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  timeValueList[0],
                  style: const TextStyle(
                    color: Color.fromRGBO(11, 86, 222, 20),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  timeValueList[1],
                  style: const TextStyle(
                    color: Color.fromRGBO(11, 86, 222, 20),
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
