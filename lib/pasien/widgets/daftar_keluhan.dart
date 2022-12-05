import 'dart:math' as math;
import 'dart:ui';

import '../utils/colors.dart';
import '../utils/text_styles.dart';
import '../utils/interface_helpers.dart';
import 'common_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const double minHeight = 80;
AnimationController controller;

void toggleBottomSheet() =>
    controller.fling(velocity: isBottomSheetOpen ? -2 : 2);
bool get isBottomSheetOpen => (controller.status == AnimationStatus.completed);

class DaftarKeluhan extends StatefulWidget {
  @override
  _DaftarKeluhanState createState() => _DaftarKeluhanState();
}

class _DaftarKeluhanState extends State<DaftarKeluhan>
    with SingleTickerProviderStateMixin {
  double get maxHeight => MediaQuery.of(context).size.height;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  double lerp(double min, double max) => lerpDouble(min, max, controller.value);

  List<String> itemTitles = [
    'What is this app about?',
    'Credits',
  ];

  List<String> itemContent = [
    'Dashboard Reborn is a showcase of beautiful UI elements written purely in Dart code.\n\nThe entire project is open source, and you can use the code however you want in your own apps.\n\nThat said, if you liked this app or found it helpful, please fork/star it on GitHub and give me a shoutout. Pull requests are more than welcome too.\n\nThanks!',
    'This app would not have been possible without the Flutter framework, the open source projects that I\'ve used and the tireless efforts of developers and contributors in the Flutter community. \n\nPlease see the README.md file in the repository below for more details.',
  ];

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        return Positioned(
          height: lerp(minHeight, maxHeight),
          left: 0,
          right: 0,
          bottom: 0,
          child: GestureDetector(
            onTap: toggleBottomSheet,
            onVerticalDragUpdate: handleDragUpdate,
            onVerticalDragEnd: handleDragEnd,
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: shadowColor(context),
                    blurRadius: 15.0,
                  ),
                ],
              ),
              child: Material(
                color: extraInvertColorsMild(context),
                elevation: 10.0,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  topRight: Radius.circular(10.0),
                ),
                shadowColor: shadowColor(context),
                child: InkWell(
                  onTap: doNothing,
                  splashColor: MyColors.accent,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Stack(
                      children: <Widget>[
                        Expanded(
                          child: ListView(
                            children: List.generate(itemTitles.length, (index) {
                              return CommonTile(
                                child: Padding(
                                  padding: EdgeInsets.all(20.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        itemTitles[index],
                                        style: HeadingStylesDefault.accent,
                                        textAlign: TextAlign.center,
                                        softWrap: true,
                                        overflow: TextOverflow.fade,
                                      ),
                                      SizedBox(
                                        height: 20.0,
                                      ),
                                      Text(
                                        itemContent[index],
                                        style: isThemeCurrentlyDark(context)
                                            ? BodyStylesDefault.white
                                            : BodyStylesDefault.black,
                                        textAlign: TextAlign.left,
                                        softWrap: true,
                                        overflow: TextOverflow.fade,
                                      ),
                                    ],
                                  ),
                                ),
                                splashColor: MyColors.accent,
                              );
                            }),
                          ),
                        ),
                        MenuButton(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void handleDragUpdate(DragUpdateDetails details) {
    controller.value -= details.primaryDelta / maxHeight;
  }

  void handleDragEnd(DragEndDetails details) {
    if (controller.isAnimating ||
        controller.status == AnimationStatus.completed) return;

    final double flingVelocity =
        details.velocity.pixelsPerSecond.dy / maxHeight;
    if (flingVelocity < 0.0)
      controller.fling(
        velocity: math.max(2.0, -flingVelocity),
      );
    else if (flingVelocity > 0.0)
      controller.fling(
        velocity: math.min(-2.0, -flingVelocity),
      );
    else
      controller.fling(velocity: controller.value < 0.5 ? -2.0 : 2.0);
  }
}

class MenuButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 0,
      bottom: 30,
      child: GestureDetector(
        onTap: toggleBottomSheet,
        child: AnimatedIcon(
          icon: AnimatedIcons.menu_close,
          size: 24.0,
          progress: controller,
          semanticLabel: 'Open/close',
          color: invertColorsMild(context),
        ),
      ),
    );
  }
}
