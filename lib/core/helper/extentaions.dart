import 'package:flutter/material.dart';

extension Navigation on BuildContext {
  Future<dynamic> pushName(String routNmae, {Object? arguments}) {
    return Navigator.of(this).pushNamed(routNmae, arguments: arguments);
  }

  Future<dynamic> pushReplacementNamed(String routNmae, {Object? arguments}) {
    return Navigator.of(this)
        .pushReplacementNamed(routNmae, arguments: arguments);
  }

  Future<dynamic> pushNamedAndRemoveUntil(String routNmae,
      {Object? arguments, required RoutePredicate routePredicate}) {
    return Navigator.of(this).pushNamedAndRemoveUntil(routNmae, routePredicate,
        arguments: arguments);
  }

  void pop() => Navigator.of(this).pop();
}
