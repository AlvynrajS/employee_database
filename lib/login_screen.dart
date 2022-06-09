import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:employee_details/create_screen.dart';
import 'package:employee_details/read_screen.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isLoading = false;
  final databaseReference = FirebaseDatabase.instance.ref();

  // final SharedPreferences? _prefs = AppUtils.prefs;

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.white, Colors.blueGrey],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter),
          ),
          child: _isLoading
              ? const Center(child: CircularProgressIndicator())
              : ListView(
                  children: [headerSection(), textSection(), buttonSection()],
                ),
        ),
      ),
    );
  }

  Container buttonSection() {
    return Container(
      width: MediaQuery.of(context).size.width,

      padding: const EdgeInsets.symmetric(horizontal: 20),
      margin: const EdgeInsets.only(top: 30),
      // decoration: BoxDecoration(color: Colors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ElevatedButton(
              onPressed: () {
                bool isValid = formKey.currentState!.validate();
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CreateScreen()));
                // if (isValid) {
                //   FirebaseFirestore.instance.collection('users').add({
                //     // "profile_pic": profile_pic.text,
                //     "Date of Birth": password.text,
                //     "Email": email.text,
                //     "Phone Number": phonenumber.text,
                //     "First Name": firstname.text,
                //   }).then(((value) {
                //     Navigator.of(context).push(MaterialPageRoute(
                //         builder: (context) => EmployeeListScreen()));
                //   }));

                //   // login();
                // } else {}
              },
              child:
                  const Text("Login", style: TextStyle(color: Colors.white))),
          const SizedBox(height: 10.0),
          ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CreateScreen()));
                // login();
              },
              child:
                  const Text("Signup", style: TextStyle(color: Colors.white))),
        ],
      ),
    );
  }

  Widget textSection() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      margin: const EdgeInsets.only(top: 30),
      // decoration: BoxDecoration(color: Colors.white),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            buildTextFormField("Email or Phone number", emailcontroller),
            const SizedBox(height: 30),
            buildTextFormField("password", passwordcontroller)
          ],
        ),
      ),
    );
  }

  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController firstname = TextEditingController();
  TextEditingController password = TextEditingController();
  // TextEditingController profile_pic = TextEditingController();
  TextEditingController phonenumber = TextEditingController();
  TextEditingController email = TextEditingController();

  TextFormField buildTextFormField(
      String hint, TextEditingController controller) {
    return TextFormField(
      controller: controller,
      validator: (value) {
        if (value != null && value.isNotEmpty) {
          return null;
        } else {
          return "Textfield can't be empty";
        }
      },
      decoration: InputDecoration(
          hintText: hint,
          border: const OutlineInputBorder(),
          labelText: hint,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide: BorderSide(color: Colors.white)),
          fillColor: Colors.white),
    );
  }

  Container headerSection() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
      child: const Text("Database",
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.w700, fontSize: 24)),
    );
  }

  // Future<Future<Object?>> login() async {
  //   if (emailcontroller.text == "Admin" && passwordcontroller.text == "0000") {
  //     return Navigator.push(context,
  //         MaterialPageRoute(builder: (context) => const EmployeeListScreen()));
  //   } else {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //         const SnackBar(content: Text("Data Not Found. Please sigup")));
  //     Navigator.push(context,
  //         MaterialPageRoute(builder: (context) => const CreateScreen()));
}

    // if (emailcontroller.text.isNotEmpty && passwordcontroller.text.isNotEmpty) {
    //   var response = await http.post(Uri.parse("").replace(queryParameters: {
    //     'email (or) phone': emailcontroller.text.trim(),
    //     'password': passwordcontroller.text.trim()
    //   }));
    // if (response.statusCode == 200) {
    //   Map<String, dynamic> jsonData = jsonDecode(response.body);

    // LoginResponse loginResponse = LoginResponse.fromJson(jsonData);

    // if (loginResponse.error == "000") {
    //   final preference = await _prefs;

    //   preference!.setString("id", loginResponse.data?.id ?? '');

    // Navigator.pushReplacement(context,
    //     MaterialPageRoute(builder: (context) => const CreateScreen()));
    // } else {
    //   ScaffoldMessenger.of(context)
    //       .showSnackBar(const SnackBar(content: Text("Data Not Found")));
    // }
    // }
    // if (response.statusCode == 001) {
    //   ScaffoldMessenger.of(context)
    //       .showSnackBar(const SnackBar(content: Text("Data Not Found")));
    // }
    // }
  // }
  // Future<bool> doesNameAlreadyExist(String name) async {
  // final QuerySnapshot result = await Firestore.instance
  //   .collection('company')
  //   .where('name', isEqualTo: name)
  //   .limit(1)
  //   .getDocuments();
  // final List<DocumentSnapshot> documents = result.documents;
  // return documents.length == 1;
// }
// }
