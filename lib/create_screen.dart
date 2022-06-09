import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:employee_details/main.dart';
import 'package:employee_details/read_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_database/firebase_database.dart';

class CreateScreen extends StatefulWidget {
  const CreateScreen({Key? key}) : super(key: key);

  @override
  State<CreateScreen> createState() => CreateScreenState();
}

class CreateScreenState extends State<CreateScreen> {
  final databaseReference = FirebaseDatabase.instance.ref();
  final _formkey = GlobalKey<FormState>();

  TextEditingController firstname = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController dob = TextEditingController();
  TextEditingController phonenumber = TextEditingController();
  TextEditingController email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Create Employee Details")),
      body: Padding(
        padding: const EdgeInsets.only(top: 35, left: 20.0, right: 20.0),
        child: SingleChildScrollView(
          child: Form(
              key: _formkey,
              child: Column(
                children: [
                  buildHeaders("Personal Information"),
                  buildTextForm(firstname, "First Name", "First Name"),
                  buildTextForm(email, "Email", "Emial"),
                  buildTextForm(phonenumber, "Phone Number", "Phone Number"),
                  buildTextForm(dob, "Date of birth", "Date of Birth"),
                  // buildTextForm(password, "password", "password"),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: ElevatedButton(
                        onPressed: () {
                          bool? validated = _formkey.currentState?.validate();
                          if (validated == true) {
                            showSaveDialoge(context);
                          }
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) =>
                          //             const EmployeeListScreen()));
                        },
                        child: const Text("Save")),
                  )
                ],
              )),
        ),
      ),
      // }),
    );
  }

  Widget buildTextForm(
      TextEditingController controller, String hint, String lable) {
    return TextFormField(
      controller: controller,
      validator: (value) {
        if (value != null && value.isEmpty) {
          return "This field is mandatory";
        } else {
          return null;
        }
      },
      maxLines: 1,
      // keyboardType: TextInputType.datetime,
      decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(fontStyle: FontStyle.italic),
          labelText: lable),
    );
  }

  Widget buildHeaders(String heading) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(color: Colors.green),
        child: Center(
            child: Text(heading, style: const TextStyle(fontSize: 20.0))),
      ),
    );
  }

  showSaveDialoge(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Cancel")),
              TextButton(
                  onPressed: () {
                    FirebaseFirestore.instance.collection('users').add({
                      "password": password.text,
                      "Date of Birth": dob.text,
                      "Email": email.text,
                      "Phone Number": phonenumber.text,
                      "First Name": firstname.text,
                    }).then(((value) {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => EmployeeListScreen()));
                    }));

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const EmployeeListScreen()));
                  },
                  child: const Text("Ok"))
            ],
            title: const Text("Save Alert"),
            content: const Text("Are you sure save the Employee Details?"),
          );
        });
  }
}
