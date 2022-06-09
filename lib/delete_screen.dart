import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DeleteScreen extends StatefulWidget {
  const DeleteScreen({Key? key}) : super(key: key);

  @override
  State<DeleteScreen> createState() => _DeleteScreenState();
}

class _DeleteScreenState extends State<DeleteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Update Employee Details")),
      body: ElevatedButton(
          onPressed: () {
            final documentChange =
                FirebaseFirestore.instance.collection("users");
            documentChange.doc().delete();
            showDeleteDialoge(context);
          },
          child: const Text("Delete Data")),
    );
  }

  showDeleteDialoge(BuildContext context) {
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
                    Navigator.of(context).pop();
                  },
                  child: const Text("Delete"))
            ],
            title: const Text("Delete Alert"),
            content: const Text("Are you sure Delete the Data?"),
          );
        });
  }
}
