import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:health_sync_app/authentication/auth_models.dart';
import 'package:health_sync_app/authentication/auth_provider.dart';
import 'package:health_sync_app/colors.dart';
import 'package:health_sync_app/doctor/doctor_main.dart';
import 'package:health_sync_app/doctor/registration/doc_reg.dart';
import 'package:provider/provider.dart';

class MoreScreen extends StatefulWidget {
  const MoreScreen({super.key});

  @override
  State<MoreScreen> createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: FirebaseFirestore.instance
          .collection("Users")
          .doc(Provider.of<AuthProvider>(context).myUId)
          .get(),
      builder: (context, snapshot) {
        User? document;
        if (snapshot.hasData) {
          var thisDocument = snapshot.data!.data();
          document = User.fromJson(thisDocument!);
        }
        return Scaffold(
          backgroundColor: HealthColors.blue2,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ListView(
              children: [
                const SizedBox(
                  height: 100,
                ),
                Center(
                  child: Text(
                    document != null ? document.name : "your_name",
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "  You",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
                ListTile(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  tileColor: Colors.white,
                  title: const Text(
                    "Profile",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    size: 20,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                ListTile(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  tileColor: Colors.white,
                  title: const Text(
                    "See Health Care Providers",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    size: 20,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "  Join us",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
                ListTile(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  tileColor: Colors.white,
                  title: const Text(
                    "Hospital",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    size: 20,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => document != null
                            ? document.isMedic == true
                                ? const DoctorMainScreen()
                                : const DocRegister()
                            : const DocRegister(),
                      ),
                    );
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  tileColor: Colors.white,
                  title: const Text(
                    "Medical Consultant",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    size: 20,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "  More",
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: "Roboto",
                    fontSize: 18,
                  ),
                ),
                ListTile(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  tileColor: Colors.white,
                  title: const Text(
                    "Support",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    size: 20,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                ListTile(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  tileColor: Colors.white,
                  title: const Text(
                    "Legal",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    size: 20,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
