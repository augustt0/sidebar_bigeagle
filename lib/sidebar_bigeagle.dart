library sidebar_bigeagle;

export 'package:sidebar_bigeagle/src/SideBarButton.dart';

import 'package:flutter/material.dart';

import 'src/SideBarButton.dart';

typedef IntCallback(int);

// ignore: must_be_immutable
class SideBar extends StatefulWidget {
  /// List of buttons of the Side Bar
  final List<SideBarButtonFlat> children;

  /// Tab callback, index are tab index which is being clicked.
  final IntCallback onChange;

  /// Logo of the app
  final Widget? logo;

  /// Should the buttons expand when mouse hover? How much?, 1 is default
  final double onHoverScale;

  /// Background color of the Side Bar
  final Color color;

  /// Accent color of the Side Bar (Text and icons color), white is default.
  final Color accentColor;

  /// The app color, white is default.
  final Color appColor;

  /// Border radius of the Side Bar
  final double borderRadius;

  /// Elevation of the Side Bar
  final double elevation;

  SideBar(
      {super.key,
      required this.children,
      required this.color,
      this.logo,
      this.accentColor = Colors.white,
      this.appColor = Colors.white,
      this.borderRadius = 35.0,
      this.elevation = 0.0,
      this.onHoverScale = 1.0,
      required this.onChange});
  @override
  _SideBarState createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> with TickerProviderStateMixin {
  static int _selectedIndex = 0;

  List<Widget> _selectedButtonOpen = [];

  updateButton(int x) {
    setState(() {
      _selectedIndex = x;
      widget.onChange(x);
    });
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
                          topRight: Radius.circular(widget.borderRadius),
                          bottomRight: Radius.circular(widget.borderRadius))),
                  elevation: widget.elevation,
                  color: widget.color,
                  child: Stack(
                    children: [
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
                                  SideBarButton sideBarButtonOpen =
                                      new SideBarButton(
                                    title: widget.children[i].title,
                                    icon: widget.children[i].icon,
                                    onHoverScale: widget.onHoverScale,
                                    color: widget.color,
                                    accentColor: widget.accentColor,
                                    appColor: widget.appColor,
                                    pressed: _selectedIndex == i,
                                    index: widget.children
                                        .indexOf(widget.children[i]),
                                    updateValue: (val) => updateButton(val),
                                  );
                                  return sideBarButtonOpen;
                                }),
                          )),
                      Positioned(
                        top: 40,
                        left: 10,
                        child: Container(
                          width: MediaQuery.of(context).size.width / 6 + 10,
                          child: widget.logo ?? Container(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
