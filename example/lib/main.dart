import 'package:flutter/material.dart';
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
      // List of pages of example, this is the principal app content
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
          // SideBar Big Eagle
          SideBar(
            color: Colors.teal,
            appColor: Colors.white, // Optional, white is default
            accentColor: Colors.white, // Optional, white is default
            onHoverScale: 1.2, // Recomended value: 1.2, min: 0.5 max: 2
            logo: Image.asset(
              "res/placeholder.com-logo4.png",
              fit: BoxFit.fitWidth,
              ),
            children: [
              // Button list
              SideBarButtonFlat(title: "Dashboard", icon: Icons.dashboard),
              SideBarButtonFlat(title: "Inventory", icon: Icons.view_list),
              SideBarButtonFlat(title: "Search", icon: Icons.search),
              SideBarButtonFlat(title: "Online orders", icon: Icons.receipt),
              SideBarButtonFlat(title: "Codes", icon: Icons.qr_code_scanner),
              SideBarButtonFlat(title: "Settings", icon: Icons.settings),
              SideBarButtonFlat(title: "About", icon: Icons.info),
            ],
            onChange: (value) {
              // When the selection changes, value it's an int
              setState(() {
                _selectedIndex = value;
              });
            }
          ),
          // Principal app content
          Expanded(
            child: pages[_selectedIndex],
          )
        ],
      ),
      ),
    );
  }
}
