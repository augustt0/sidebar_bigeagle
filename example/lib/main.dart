import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:sidebar_bigeagle/sidebar_bigeagle.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  int _selectedIndex = 0;

  List<Widget> pages = [];
  @override
  void initState() {
    super.initState();
    pages = [
      Text("Dashboard page"),
      Text("Inventory page"),
      Text("Search page"),
      Text("Online orders page"),
      Text("Codes page"),
      Text("Settings page"),
      Text("About page"),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Row(
        children: [
          SideBar(
            logo: Image.asset(
              "res/placeholder.com-logo4.png",
              fit: BoxFit.fitWidth,
              ),
            children: [
              SideBarButtonFlat(title: "Dashboard", icon: Icons.dashboard),
              SideBarButtonFlat(title: "Inventory", icon: Icons.view_list),
              SideBarButtonFlat(title: "Search", icon: Icons.search),
              SideBarButtonFlat(title: "Online orders", icon: Icons.receipt),
              SideBarButtonFlat(title: "Codes", icon: Icons.qr_code_scanner),
              SideBarButtonFlat(title: "Settings", icon: Icons.settings),
              SideBarButtonFlat(title: "About", icon: Icons.info),
            ],
            onChange: (value) {
              setState(() {
                _selectedIndex = value;
              });
            }
          ),
          // Contenido principal
          Expanded(
            child: pages[_selectedIndex],
          )
        ],
      ),
      ),
    );
  }
}
