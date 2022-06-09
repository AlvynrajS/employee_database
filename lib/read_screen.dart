import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:employee_details/delete_screen.dart';
import 'package:employee_details/login_screen.dart';
import 'package:employee_details/update_screen.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class EmployeeListScreen extends StatefulWidget {
  const EmployeeListScreen({Key? key}) : super(key: key);

  @override
  State<EmployeeListScreen> createState() => EmployeeListScreenState();
}

class EmployeeListScreenState extends State<EmployeeListScreen> {
  final databaseReference = FirebaseDatabase.instance.ref().child("users");
  final collectionReference = FirebaseFirestore.instance
      .collection("user 1")
      .where("Email" "==" "Alwin123@gamil.com");
  final documentReference = FirebaseDatabase.instance.ref().child("users");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Employee List"),
        leading: GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LoginPage()));
            },
            child: Icon(Icons.arrow_back)),
      ),
      body: Container(
        child: StreamBuilder(
            stream: FirebaseFirestore.instance.collection('users').snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: ((context, index) => Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Container(
                            // margin: EdgeInsets.all(10.00),
                            padding: const EdgeInsets.all(10.0),
                            height: 100.0,
                            width: MediaQuery.of(context).size.width / 2,
                            decoration:
                                const BoxDecoration(color: Colors.green),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(snapshot.data?.docs[index]
                                          ['First Name']),
                                      // Text(snapshot.data?.docs[index]
                                      //     ['password']),
                                      Text(snapshot.data?.docs[index]
                                          ['Date of Birth']),
                                      Text(snapshot.data!.docs[index]['Email']),
                                      Text(snapshot.data?.docs[index]
                                          ['Phone Number']),
                                    ],
                                  ),
                                ),
                                Container(
                                  decoration:
                                      const BoxDecoration(color: Colors.white),
                                  child: IconButton(
                                      onPressed: () async {
                                        Navigator.of(context)
                                            .push(MaterialPageRoute(
                                          builder: (context) =>
                                              const UpdateScreen(),
                                        ));
                                      },
                                      alignment: Alignment.centerRight,
                                      icon: const Icon(Icons.edit)),
                                ),
                                const VerticalDivider(),
                                Container(
                                  decoration:
                                      const BoxDecoration(color: Colors.white),
                                  child: IconButton(
                                      onPressed: () {
                                        Navigator.of(context)
                                            .push(MaterialPageRoute(
                                          builder: (context) =>
                                              const DeleteScreen(),
                                        ));
                                      },
                                      icon: const Icon(Icons.delete)),
                                )
                              ],
                            ),
                          ),
                        )));
              } else {
                return Container();
              }
            }),
      ),
    );
  }
}
