
import 'package:flutter/material.dart';
import 'package:unixofficial/search.dart';
import '22.dart';
import 'bib/fake.dart';

import 'frontpage.dart';




class buyerenter extends StatefulWidget {
  @override
  _buyerenterState createState() => _buyerenterState();
}

class _buyerenterState extends State<buyerenter> {
  final _pages = [
frontbuyer(),
    searchengine(),
    GPArunApp(),
   frontbuyer22(),


 //   timetable()



  ];
  var _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      bottomNavigationBar: BottomNavigationBar(
        elevation: 5,
        selectedItemColor: Colors.blue.shade900 ,
        backgroundColor:Colors.white ,
        unselectedItemColor: Colors.grey.shade600,
        currentIndex: _currentIndex,
        selectedLabelStyle:
        TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        items: [     BottomNavigationBarItem(
            icon: Icon(Icons.album), label: "News"),
          BottomNavigationBarItem(
              icon: Icon(Icons.menu_book_sharp), label: "Library"),
          BottomNavigationBarItem(
              icon: Icon(Icons.school_outlined), label: "GP"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.apps), label: "Markets"
          ),


        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            print(_currentIndex);
          });
        },
      ),
      body: _pages[_currentIndex],
    );
  }
}
