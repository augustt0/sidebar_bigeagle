import 'package:flutter/material.dart';

class SideBarButton extends StatelessWidget {
  SideBarButton({@required this.title, @required this.icon, @required this.pressed, @required this.index, this.updateValue});
  final String title;
  final IconData icon;
  final bool pressed;
  final int index;
  final Function updateValue;
  @override
  Widget build(BuildContext context) {
    double spacing = MediaQuery.of(context).size.width / 40;
    double widthSize = MediaQuery.of(context).size.width / 6 + 40;
    return Container(
        width: widthSize,
        height: 60,
        child: pressed ? Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  bottomLeft: Radius.circular(30))),
          elevation: 0.0,
          child: spacing > 20 ? Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: spacing,
              ),
              Icon(icon, color: Colors.teal,),
              SizedBox(
                width: spacing,
              ),
              Text(title, style: TextStyle(color: Colors.teal,), overflow: TextOverflow.fade,),
            ],
          ) : Icon(icon, color: Colors.teal,),
        ): Center(child: Container(
          width: widthSize,
          height: 60,
          child: TextButton(
            child: spacing > 20 ? Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: spacing,
              ),
              Icon(icon, color: Colors.white,),
              SizedBox(
                width: spacing,
              ),
              Text(title, style: TextStyle(color: Colors.white), overflow: TextOverflow.fade,),
            ],
          ) : Icon(icon, color: Colors.white,),
          onPressed: () => updateValue(index),
          ),
        ),));
  }
}
