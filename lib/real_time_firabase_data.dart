import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class FireBaseRealTimeData extends StatefulWidget {
  const FireBaseRealTimeData({Key? key}) : super(key: key);

  @override
  State<FireBaseRealTimeData> createState() => FireBaseRealTimeDataState();
}

class FireBaseRealTimeDataState extends State<FireBaseRealTimeData> {
  final databaseReference = FirebaseDatabase.instance.ref();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Employee Details")),
        body: Container(
          child: Column(
            children: [
              ElevatedButton(
                  onPressed: () {
                    createRecord();
                  },
                  child: const Text("Create Data")),
              ElevatedButton(
                  onPressed: () {
                    getData();
                  },
                  child: const Text("View Data")),
              ElevatedButton(
                  onPressed: () {
                    update();
                  },
                  child: const Text("Update Data")),
              ElevatedButton(
                  onPressed: () {
                    delete();
                  },
                  child: const Text("Delete Data")),
            ],
          ),
        ));
  }

  void createRecord() {
    databaseReference.child("user 1").set({
      'Name': 'Alwin',
      'City': 'kovilpatti',
      'Date of Birth': '21/02/1996',
      'Emial Id': 'alvyn21@gmail.com',
      'Phone Number': '8056527428'
    });
    databaseReference.child("user 2").set({
      'Name': 'Mariganesh',
      'City': 'Chennai',
      'Date of Birth': '21/06/1996',
      'Emial Id': 'ganesh21@gmail.com',
      'Phone Number': '8056524758'
    });
    databaseReference.child("user 3").set({
      'Name': 'Thangaraj',
      'City': 'Madurai',
      'Date of Birth': '27/08/1996',
      'Emial Id': 'thanga27@gmail.com',
      'Phone Number': '8075421258'
    });
  }

  void getData() {
    databaseReference.once().then((var snapshot) {
      print('Data : ${snapshot.snapshot.value}');
    });
  }

  void update() {
    databaseReference.child('user 1').update({'Name': 'Alwinraj'});
  }

  void delete() {
    databaseReference.child('user 1').remove();
  }
}
