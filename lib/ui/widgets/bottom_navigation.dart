import 'package:flutter/material.dart';

class AnimatedBottomNavigation extends StatefulWidget {
  const AnimatedBottomNavigation({
    required this.items,
    this.height = 100,
    this.backgroundColor = const Color(0xff273564),
    this.activeIconColor = const Color(0xffFF6B4D),
    this.inactiveIconColor = Colors.white,
    this.circleColor = Colors.white,
    this.animationDuration = const Duration(milliseconds: 500),
  });

  final Color backgroundColor;
  final double height;
  final List<NavigationBarItem> items;
  final Color activeIconColor;
  final Color inactiveIconColor;
  final Color circleColor;
  final Duration animationDuration;

  @override
  AnimatedBottomNavigationState createState() =>
      AnimatedBottomNavigationState();
}

class AnimatedBottomNavigationState extends State<AnimatedBottomNavigation> {
  late double circleX;
  int active = 0;
  bool isActive = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      decoration: BoxDecoration(color: widget.backgroundColor, boxShadow: [
        BoxShadow(color: Colors.black38, blurRadius: 4, spreadRadius: 2),
      ]),
      child: Stack(
        children: <Widget>[
          backgroundAnimation(widget.animationDuration, widget.circleColor),
          setUpRow(widget.items),
        ],
      ),
    );
  }

  Widget setUpRow(List<NavigationBarItem> items) {
    List<Widget> list = <Widget>[];
    for (var i = 0; i < items.length; i++) {
      list.add(setUpIcons(
        items[i].icon,
        items[i].title,
        i,
        items[i].onClick,
      ));
    }
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: list);
  }

  Widget setUpIcons(Icon icon, String title, int index, VoidCallback onClick) {
    if (widget.items.length < 2 || widget.items.length > 4) {
      throw new Exception(
          'Only 2-4 items are allowed for the Navigation bar to look beautiful');
    }

    bool isActiveIndex = index == active;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        AnimatedContainer(
          curve: Curves.easeInOutBack,
          transform: Matrix4.translationValues(
              0, isActive && isActiveIndex ? -15 : 0, 0),
          child: IconButton(
            icon: icon,
            iconSize: isActive && isActiveIndex ? 35 : 30,
            color: isActive && isActiveIndex
                ? widget.activeIconColor
                : widget.inactiveIconColor,
            onPressed: () {
              onClick();
              setState(() {
                active = index;
              });
            },
          ),
          duration: widget.animationDuration,
        ),
        isActive && isActiveIndex
            ? Container(
                transform: Matrix4.translationValues(0, -10, 0),
                child: Text(
                  '$title',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              )
            : Container(),
      ],
    );
  }

  Widget backgroundAnimation(Duration d, Color bg) {
    int amount = widget.items.length;
    double screenW = MediaQuery.of(context).size.width;
    double dim = 62;
    var translation;
    var center = (screenW / 2) - dim / 2;
    switch (amount) {
      case 2:
        if (active == 0) {
          translation =
              Matrix4.translationValues(center - (dim * 1.22), -10, 0);
        } else {
          translation =
              Matrix4.translationValues(center + (dim * 1.22), -10, 0);
        }
        break;
      case 3:
        if (active == 0) {
          translation =
              Matrix4.translationValues(center - (dim * 1.82), -10, 0);
        } else if (active == 1) {
          translation = Matrix4.translationValues(center, -10, 0);
        } else {
          translation =
              Matrix4.translationValues(center + (dim * 1.82), -10, 0);
        }
        break;
      case 4:
        if (active == 0) {
          translation =
              Matrix4.translationValues(center - (dim * 2.18), -10, 0);
        } else if (active == 1) {
          translation =
              Matrix4.translationValues(center - (dim * 0.73), -10, 0);
        } else if (active == 2) {
          translation =
              Matrix4.translationValues(center + (dim * 0.73), -10, 0);
        } else {
          translation =
              Matrix4.translationValues(center + (dim * 2.18), -10, 0);
        }
        break;
    }

    return AnimatedContainer(
      transform: translation,
      curve: Curves.easeInOutBack,
      alignment: Alignment.center,
      height: dim,
      width: dim,
      decoration: BoxDecoration(shape: BoxShape.circle, color: bg, boxShadow: [
        BoxShadow(color: Colors.black45, blurRadius: 2, spreadRadius: 2)
      ]),
      duration: d,
    );
  }
}

class NavigationBarItem {
  const NavigationBarItem({
    required this.icon,
    required this.title,
    required this.onClick,
  });

  final Icon icon;
  final String title;
  final VoidCallback onClick;
}
