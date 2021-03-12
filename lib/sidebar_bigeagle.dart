library sidebar_bigeagle;

export 'package:sidebar_bigeagle/src/SideBarButton.dart';
export 'package:sidebar_bigeagle/src/SideBarButtonFlat.dart';

import 'package:animated_size_and_fade/animated_size_and_fade.dart';
import 'package:flutter/material.dart';

import 'src/SideBarButton.dart';
import 'src/SideBarButtonFlat.dart';

typedef IntCallback(int);

// ignore: must_be_immutable
class SideBar extends StatefulWidget {
  /// List of buttons of the Side Bar
  final List<SideBarButtonFlat> children;

  /// Tab callback, index are tab index which is being clicked.
  final IntCallback onChange;

  /// Logo of the app
  final Widget logo;

  /// Background color of the Side Bar
  final Color color;

  /// Accent color of the Side Bar (Text and icons color), white is default.
  Color accentColor = Colors.white;

  /// The app color, white is default.
  Color appColor = Colors.white;

  SideBar(
      {Key key,
      @required this.children,
      @required this.logo,
      @required this.color,
      this.accentColor,
      this.appColor,
      @required this.onChange})
      : super(key: key);
  @override
  _SideBarState createState() =>
      _SideBarState(children: children, logo: logo, color: color);
}

class _SideBarState extends State<SideBar> with TickerProviderStateMixin {
  _SideBarState({@required this.children, this.logo, this.color});

  Widget logo;
  Color color;

  static int _selectedIndex = 0;

  List<SideBarButtonFlat> children;

  List<Widget> _selectedButtonOpen = [];
  List<Widget> _selectedButtonClosed = [];

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
        accentColor: widget.accentColor,
        appColor: widget.appColor,
        pressed: true,
        index: children.indexOf(element),
      );

      SideBarButton sideBarButtonClose = new SideBarButton(
        title: element.title,
        icon: element.icon,
        accentColor: widget.accentColor,
        appColor: widget.appColor,
        pressed: false,
        index: children.indexOf(element),
        updateValue: updateButton,
      );

      _selectedButtonOpen.add(sideBarButtonOpen);
      _selectedButtonClosed.add(sideBarButtonClose);
    });
  }

  @override
  void initState() {
    super.initState();
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
                  color: color,
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
                          child: _selectedIndex == i
                              ? _selectedButtonOpen[i]
                              : _selectedButtonClosed[i],
                          fadeDuration: const Duration(milliseconds: 50),
                          sizeDuration: const Duration(milliseconds: 200),
                        );
                      }),
                )),
            Positioned(
              top: 40,
              left: 10,
              child: Container(
                width: MediaQuery.of(context).size.width / 6 + 10,
                child: logo,
              ),
            ),
          ],
        ));
  }
}
