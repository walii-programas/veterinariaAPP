import 'package:appveterinaria/pages/pageVeterinario.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:appveterinaria/pages/pageBlog.dart';
import 'package:appveterinaria/pages/pageService.dart';
import 'package:appveterinaria/pages/pageStart.dart';

void main() => runApp(MaterialApp(home: BottomNavBar()));

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _pageIndex = 0;

  final PageStart _start = new PageStart();
  final PageVeterinario _formVeterinario = new PageVeterinario();
  final PageService _serviceList = new PageService();
  final PageBlog _blogList = new PageBlog();

  Widget _showPage = new PageStart();

  Widget pageChooser(int page) {
    switch (page) {
      case 0:
        return _start;
        break;

      case 1:
        return _serviceList;
        break;

      case 2:
        return _blogList;
        break;

      case 3:
        return _formVeterinario;
        break;

      default:
        return new Container(
          child: new Center(
            child: new Text("lolo"),
          ),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        index: _pageIndex,
        height: 50.0,
        items: <Widget>[
          Icon(Icons.house, size: 30),
          Icon(Icons.design_services, size: 30),
          Icon(Icons.pets_outlined, size: 30),
          Icon(Icons.person_rounded, size: 30),
        ],
        color: Colors.purple,
        buttonBackgroundColor: Colors.purple,
        backgroundColor: Colors.white,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 600),
        onTap: (int tappedIndex) {
          setState(() {
            _showPage = pageChooser(tappedIndex);
          });
        },
      ),
      body: Container(
        color: Colors.white,
        child: Center(
          child: _showPage,
        ),
      ),
    );
  }
}
