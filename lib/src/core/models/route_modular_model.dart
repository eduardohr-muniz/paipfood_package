import 'package:paipfood_package/paipfood_dependencies.dart';

class RouteModularModel {
  String route;
  String moduleR;
  String childR;
  TransitionType? t;
  Duration? d;

  RouteModularModel({
    required this.route,
    required this.moduleR,
    required this.childR,
    this.t = TransitionType.scale,
    this.d = const Duration(milliseconds: 700),
  });
}
