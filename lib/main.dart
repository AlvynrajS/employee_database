import 'package:employee_details/create_screen.dart';
import 'package:employee_details/delete_screen.dart';
import 'package:employee_details/login_screen.dart';
import 'package:employee_details/read_screen.dart';
import 'package:employee_details/real_time_firabase_data.dart';
import 'package:employee_details/update_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Employee  Details',
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          primarySwatch: Colors.green,
          errorColor: Colors.red.shade700,
          hintColor: Colors.grey,
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                  fixedSize: const Size.fromWidth(500.0),
                  primary: Colors.green.shade400,
                  side: const BorderSide(color: Colors.black, width: 1.0)))),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("Login Page")), body: LoginPage()

        // Padding(
        //   padding: const EdgeInsets.all(8.0),
        //   child: Column(
        //     crossAxisAlignment: CrossAxisAlignment.stretch,
        //     children: [
        //       _buildButtons("Create", const CreateScreen()),
        //       _buildButtons("Read", const EmployeeListScreen()),
        //       _buildButtons("Update", const UpdateScreen()),
        //       _buildButtons("Delete", const DeleteScreen()),
        //       // _buildButtons("RealTimeDataBase", const FireBaseRealTimeData())
        //     ],
        //   ),
        // ),
        );
  }

  // Widget _buildButtons(String title, dynamic screen) {
  //   return Center(
  //       child: ElevatedButton(
  //           style: ButtonStyle(),
  //           onPressed: () {
  //             Navigator.of(context)
  //                 .push(MaterialPageRoute(builder: (context) => screen
  //                     //  const create_screen(),
  //                     ));
  //           },
  //           child: Text(title)));
  // }
}
