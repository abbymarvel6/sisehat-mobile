import '../utils/interface_helpers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CommonTile extends StatelessWidget {
  const CommonTile({
    required this.child,
    required this.splashColor,
    required this.onTap,
  });
  final Widget child;
  final Color splashColor;
  final Function() onTap;

  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15.0),
      child: Material(
        elevation: 10.0,
        borderRadius: BorderRadius.circular(15.0),
        shadowColor: shadowColor(context),
        child: InkWell(
          child: child,
          splashColor: splashColor,
          borderRadius: BorderRadius.circular(15.0),
          onTap: onTap == null ? doNothing : () => onTap(),
        ),
      ),
    );
  }
}
