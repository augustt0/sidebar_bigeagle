import 'package:flutter/material.dart';

class SideBarButton extends StatelessWidget {
  /// Label of the button
  final String title;

  /// Icon of the button
  final IconData icon;

  /// If the button is selected
  final bool pressed;

  /// Current position of the button in the Side Bar
  final int index;

  /// Function called when te user tap the button
  final Function updateValue;

  // SideBar background color
  final Color color;

  /// Accent color of the Side Bar (Text and icons color), white is default.
  final Color accentColor;

  /// The app color, white is default.
  final Color appColor;

  SideBarButton(
      {@required this.title,
      @required this.icon,
      @required this.pressed,
      @required this.index,
      @required this.accentColor,
      @required this.appColor,
      @required this.color,
      this.updateValue});
  @override
  Widget build(BuildContext context) {
    double spacing = MediaQuery.of(context).size.width / 40;
    double widthSize = MediaQuery.of(context).size.width / 6 + 40;
    return Container(
        width: widthSize,
        height: 60,
        child: pressed
            ? Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        bottomLeft: Radius.circular(30))),
                elevation: 0.0,
                color: appColor,
                child: spacing > 20
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: spacing,
                          ),
                          Icon(
                            icon,
                            color: color,
                          ),
                          SizedBox(
                            width: spacing,
                          ),
                          Text(
                            title,
                            style: TextStyle(
                              color: color,
                            ),
                            overflow: TextOverflow.fade,
                          ),
                        ],
                      )
                    : Icon(
                        icon,
                        color: color,
                      ),
              )
            : Center(
                child: Container(
                  width: widthSize,
                  height: 60,
                  child: TextButton(
                    child: spacing > 20
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: spacing,
                              ),
                              Icon(icon, color: accentColor),
                              SizedBox(
                                width: spacing,
                              ),
                              Text(
                                title,
                                style: TextStyle(color: accentColor),
                                overflow: TextOverflow.fade,
                              ),
                            ],
                          )
                        : Icon(icon, color: accentColor),
                    onPressed: () => updateValue(index),
                  ),
                ),
              ));
  }
}
