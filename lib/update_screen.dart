import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:employee_details/read_screen.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class UpdateScreen extends StatefulWidget {
  const UpdateScreen({Key? key}) : super(key: key);

  @override
  State<UpdateScreen> createState() => UpdateScreenState();
}

class UpdateScreenState extends State<UpdateScreen> {
  @override
  void initState() {
    super.initState();
    _editingController = TextEditingController(text: initialText);
  }

  @override
  void dispose() {
    _editingController.dispose();
    super.dispose();
  }

  final databaseReference = FirebaseDatabase.instance.ref().child("users");
  final formkey = GlobalKey<FormState>();
  final documentReference = FirebaseDatabase.instance;
  bool _isEditingText = false;
  late TextEditingController _editingController;
  String initialText = "Initial Text";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Update Employee Details")),
        body: FirebaseAnimatedList(
            query: databaseReference,
            itemBuilder: (BuildContext context, DataSnapshot snapshot,
                Animation<double> animation, int index) {
              return ListView(
                children: [
                  Column(children: [
                    Row(children: [
                      Container(
                        decoration: const BoxDecoration(color: Colors.red),
                        child: IconButton(
                            onPressed: () {},
                            alignment: Alignment.centerRight,
                            icon: const Icon(Icons.edit)),
                      ),
                    ])
                  ])
                ],
              );
            }));
  }

  Future<void> updatedialoge(String name, String addres, String dob,
      String mail, String phone, BuildContext context, var key) {
    var firstname = TextEditingController(text: name);
    var dateofbirth = TextEditingController(text: dob);
    var address = TextEditingController(text: addres);
    var phonenumber = TextEditingController(text: phone);
    var email = TextEditingController(text: mail);
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              actions: [
                TextButton(
                    onPressed: () {
                      updateData(firstname.text, address.text, Key);
                      updateData2(dateofbirth.text, email.text, Key);
                      updateData3(phonenumber.text, Key);
                      Navigator.of(context).pop();
                    },
                    child: const Text("Update")),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text("Cancel")),
              ],
              title: const Text("Update Data"),
              content: Column(
                children: [
                  TextFormField(
                    controller: firstname,
                    decoration: const InputDecoration(
                        border: UnderlineInputBorder(), labelText: "FirstName"),
                  ),
                  const SizedBox(height: 5.0),
                  TextFormField(
                    controller: address,
                    decoration: const InputDecoration(
                        border: UnderlineInputBorder(), labelText: "Address"),
                  ),
                  const SizedBox(height: 5.0),
                  TextFormField(
                    controller: dateofbirth,
                    decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: "Date of Birth"),
                  ),
                  const SizedBox(height: 5.0),
                  TextFormField(
                    controller: email,
                    decoration: const InputDecoration(
                        border: UnderlineInputBorder(), labelText: "Email"),
                  ),
                  const SizedBox(height: 5.0),
                  TextFormField(
                    controller: phonenumber,
                    decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: "Phone Number"),
                  ),
                ],
              ));
        });
  }

  void updateData(String firstanme, String address, var key) {
    Map<String, String> x = {"firstname": firstanme, "address": address};
    databaseReference.child(key).update(x);
  }

  void updateData2(String dob, String email, var key) {
    Map<String, String> y = {"dob": dob, "email": email};
    databaseReference.child(key).update(y);
  }

  void updateData3(String phonenumber, var key) {
    Map<String, String> z = {"phonenumber": phonenumber};
    databaseReference.child(key).update(z);
  }
}
