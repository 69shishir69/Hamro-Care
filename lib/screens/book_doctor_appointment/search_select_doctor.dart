import 'package:flutter/material.dart';
import 'package:hospital_management_system/models/doctorModel.dart';
import 'package:hospital_management_system/repository/category_repository.dart';
import 'package:hospital_management_system/utils/url.dart';

class SearchDoctor extends StatefulWidget {
  const SearchDoctor({Key? key}) : super(key: key);

  @override
  State<SearchDoctor> createState() => _SearchDoctorState();
}

class _SearchDoctorState extends State<SearchDoctor> {
  final _doctorEditingController = TextEditingController();
  String searchQuery = "";

  @override
  Widget build(BuildContext context) {
    List<String>? healthCategoryList =
        ModalRoute.of(context)!.settings.arguments as List<String>;
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
                    Text(
                      healthCategoryList[1],
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color.fromRGBO(118, 125, 152, 1),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  onChanged: (value) {
                    setState(() {
                      searchQuery = value;
                    });
                  },
                  controller: _doctorEditingController,
                  decoration: const InputDecoration(
                      fillColor: Colors.white,
                      prefixIcon: Icon(
                        Icons.search,
                        color: Color.fromARGB(156, 183, 184, 186),
                      ),
                      // suffixIcon: IconButton(onPressed: onpressed, icon: const Icon(Icons.remove_red_eye_outlined)),
                      hintText: "Enter a Doctor Name",
                      hintStyle: TextStyle(
                          color: Color.fromARGB(156, 152, 154, 156),
                          fontWeight: FontWeight.w500),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.transparent,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.transparent,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.transparent,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      filled: true,
                      contentPadding: EdgeInsets.all(8)),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "* required";
                    }
                    return null;
                  },
                  // onTap: onTap,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: false,
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.7,
                  child: FutureBuilder<List<DoctorModel?>>(
                    future: CategoryRepository()
                        .loadDepartmentDoctor(healthCategoryList[1]),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (BuildContext context, index) {
                            debugPrint(index.toString());
                            return snapshot.data![index]!.username!
                                    .toLowerCase()
                                    .contains(searchQuery.toLowerCase())
                                ? doctorContainer(snapshot.data![index],
                                    healthCategoryList[1])
                                : const SizedBox();
                          },
                        );
                      } else if (snapshot.hasError) {
                        return const Text("Error");
                      } else {
                        return const Center(child: CircularProgressIndicator());
                      }
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget doctorContainer(DoctorModel? doctorModel, String department) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          '/appointmentDoctorDetailsScreen',
          arguments: [
            doctorModel!.id,
            department,
          ],
        );
        // debugPrint(doctorModel!.id! + department);
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Container(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
          // height: height * 0.13,
          width: double.infinity,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color:
                    const Color.fromARGB(255, 233, 233, 233).withOpacity(0.5),
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
                    image: doctorModel!.picture == null
                        ? const NetworkImage(
                            "https://w.wallhaven.cc/full/x8/wallhaven-x8gkvz.jpg")
                        : NetworkImage(baseUrl + doctorModel.picture!),
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
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      doctorModel.username!,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      doctorModel.department!,
                      style: const TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: const [
                        Icon(
                          Icons.star,
                          color: Colors.amber,
                          size: 18,
                        ),
                        Text(
                          "4.5",
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          "| 120 Reviews",
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
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
      ),
    );
  }
}
