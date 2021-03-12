import 'package:animated_size_and_fade/animated_size_and_fade.dart';
import 'package:flutter/material.dart';
import 'SideBarButton.dart';
import 'SideBarButtonFlat.dart';

typedef IntCallback(int);

class SideBar extends StatefulWidget {
  SideBar({Key key, @required this.children, this.onChange}) : super(key: key);
  List<SideBarButtonFlat> children;
  int selectedIndex = 0;
  final IntCallback onChange;

  @override
  _SideBarState createState() => _SideBarState(children: children);
}

class _SideBarState extends State<SideBar> with TickerProviderStateMixin{
  _SideBarState({@required this.children});

  static int _selectedIndex = 0;

  List<SideBarButtonFlat> children;

  List<Widget> _selectedButtonOpen = new List<Widget>();
  List<Widget> _selectedButtonClosed = new List<Widget>();

  updateButton(int x) {
    setState(() {
      _selectedIndex = x;
      widget.onChange(x);
    });
  }

  void initializeWidgets() {
    children.forEach((element) {
      SideBarButton sideBarButtonOpen = new SideBarButton(
        title: element.title,
        icon: element.icon,
        pressed: true,
        index: children.indexOf(element),
      );

      SideBarButton sideBarButtonClose = new SideBarButton(
        title: element.title,
        icon: element.icon,
        pressed: false,
        index: children.indexOf(element),
        updateValue: updateButton,
      );

      _selectedButtonOpen.add(sideBarButtonOpen);
      _selectedButtonClosed.add(sideBarButtonClose);
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    initializeWidgets();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width / 6 + 40,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.zero,
        child: Stack(
          children: [
            Positioned(
              left: -5,
              top: -5,
              bottom: -5,
              child: Container(
                padding: EdgeInsets.zero,
                width: MediaQuery.of(context).size.width / 6 + 40,
                height: MediaQuery.of(context).size.height,
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(35),
                          bottomRight: Radius.circular(35))),
                  elevation: 0.0,
                  color: Colors.teal,
                ),
              ),
            ),
            Positioned(
              left: 10,
              top: MediaQuery.of(context).size.height / 4,
              bottom: 0,
              child: Container(
                width: MediaQuery.of(context).size.width / 6 + 40,
                height: MediaQuery.of(context).size.height,
                child: ListView.builder(
                  itemCount: _selectedButtonOpen.length,
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, i) {
                    return AnimatedSizeAndFade(
                      vsync: this, 
                      child: _selectedIndex == i ? _selectedButtonOpen[i] : _selectedButtonClosed[i],
                      fadeDuration: const Duration(milliseconds: 50),
                      sizeDuration: const Duration(milliseconds: 200),
                    );
                  }),
              )
            ),
          ],
        ));
  }
}
