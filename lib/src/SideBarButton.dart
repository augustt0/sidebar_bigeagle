import 'package:flutter/material.dart';

typedef IntCallback(int);

class SideBarButtonFlat {
  /// Label of the button
  String title;

  /// Icon of the button
  IconData icon;
  SideBarButtonFlat({required this.title, required this.icon});
}

class SideBarButton extends StatefulWidget {
  /// Label of the button
  final String title;

  /// Icon of the button
  final IconData icon;

  /// Should the button expand when mouse hover? How much?, 1 is default
  final double onHoverScale;

  /// If the button is selected
  final bool pressed;

  /// Current position of the button in the Side Bar
  final int index;

  /// Function called when te user tap the button
  final IntCallback updateValue;

  // SideBar background color
  final Color color;

  /// Accent color of the Side Bar (Text and icons color), white is default.
  final Color accentColor;

  /// The app color, white is default.
  final Color appColor;

  SideBarButton(
      {super.key,
      required this.title,
      required this.icon,
      required this.pressed,
      required this.index,
      required this.accentColor,
      required this.appColor,
      required this.color,
      required this.onHoverScale,
      required this.updateValue});

  _SideBarButtonState createState() => _SideBarButtonState();
}

class _SideBarButtonState extends State<SideBarButton> {
  double scale = 1;

  @override
  Widget build(BuildContext context) {
    double spacing = MediaQuery.of(context).size.width / 40;
    double widthSize = MediaQuery.of(context).size.width / 6 + 40;
    return Transform.scale(
      scale: scale,
      child: Container(
          width: widthSize,
          height: 60,
          child: widget.pressed
              ? Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          bottomLeft: Radius.circular(30))),
                  elevation: 0.0,
                  color: widget.appColor,
                  child: spacing > 20
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: spacing,
                            ),
                            Icon(
                              widget.icon,
                              color: widget.color,
                            ),
                            SizedBox(
                              width: spacing,
                            ),
                            Text(
                              widget.title,
                              style: TextStyle(
                                color: widget.color,
                              ),
                              overflow: TextOverflow.fade,
                            ),
                          ],
                        )
                      : Icon(
                          widget.icon,
                          color: widget.color,
                        ),
                )
              : Center(
                  child: Container(
                    width: widthSize,
                    height: 60,
                    child: InkWell(
                      child: spacing > 20
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: spacing,
                                ),
                                Icon(widget.icon, color: widget.accentColor),
                                SizedBox(
                                  width: spacing,
                                ),
                                Text(
                                  widget.title,
                                  style: TextStyle(color: widget.accentColor),
                                  overflow: TextOverflow.fade,
                                ),
                              ],
                            )
                          : Icon(widget.icon, color: widget.accentColor),
                      onTap: () {
                        setState(() {
                          scale = 1;
                        });
                        widget.updateValue(widget.index);
                      },
                      hoverColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onHover: (value) {
                        if (value) {
                          setState(() {
                            scale = widget.onHoverScale.clamp(0.5, 2);
                          });
                        } else {
                          setState(() {
                            scale = 1;
                          });
                        }
                      },
                    ),
                  ),
                )),
    );
  }
}
