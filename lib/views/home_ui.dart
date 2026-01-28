import 'package:flutter/material.dart';
import 'package:flutter_iot_second_app/views/about_ui.dart';
import 'package:flutter_iot_second_app/views/bmi_ui.dart';
import 'package:flutter_iot_second_app/views/bmr_ui.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeUi extends StatefulWidget {
  const HomeUi({super.key});

  @override
  State<HomeUi> createState() => _HomeUiState();
}

class _HomeUiState extends State<HomeUi> {
  //สร้างตัวแปรควบคุม currenindex ของ BarItem
  int currenIndexStatus = 1;

  //สร้างตัวแปรที่ Widget หน้าจอที่จะมาแสดง body ของ scaffold
  List<Widget> showBody = [
    BmiUi(),
    AboutUi(),
    BmrUi(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 9, 82, 116),
        title: Text(
          'Body Health Calculator',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          setState(() {
            currenIndexStatus = value;
          });
        },
        currentIndex: currenIndexStatus,
        selectedItemColor: Colors.pink,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person_3,
              ),
              label: 'BMI'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(
                FontAwesomeIcons.personBooth,
              ),
              label: 'BMR'),
        ],
      ),
      body: showBody[currenIndexStatus],
    );
  }
}
