import 'package:paipfood_package/paipfood_dependencies.dart';

enum RouteType {
  route,
  moduleR,
  childR;
}

class RouteModularModel {
  String route;
  String moduleR;
  String childR;
  List<String>? params;
  TransitionType? t;
  Duration? d;

  RouteModularModel({
    required this.route,
    required this.moduleR,
    required this.childR,
    this.params,
    this.t = TransitionType.scale,
    this.d = const Duration(milliseconds: 700),
  });
}
