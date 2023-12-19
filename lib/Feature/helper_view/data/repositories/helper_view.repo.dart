import 'package:flutter/widgets.dart';

abstract class HelperViewRepo {
  void changeBottomNavIndex(int index, BuildContext context);

  List<Widget> views();
}
