import 'package:flutter_firebase_quiz_app/core/keys/global_key.dart';



abstract class PageRouteRepository {
  Future<dynamic>? page(String routeName, {Object? arguments});
  Future<dynamic>? pageAndReplace(String routeName, {Object? arguments});
  Future<dynamic>? pageAndRemoveUntil(String routeName, {Object? arguments});
  dynamic back({Object? arguments});
}

class Go implements PageRouteRepository {
  static Go to = Go._init();
  Go._init();

  @override
  dynamic back({Object? arguments}) {
    if (GlobalContextKey.instance.globalKey.currentState != null) {
      return GlobalContextKey.instance.globalKey.currentState!.pop(arguments);
    } else {
      throw Exception();
    }
  }

  @override
  Future<dynamic> page(String routeName, {Object? arguments}) async {
    if (GlobalContextKey.instance.globalKey.currentState != null) {
      return await GlobalContextKey.instance.globalKey.currentState!.pushNamed(routeName, arguments: arguments);
    } else {
      throw Exception();
    }
  }

  @override
  Future<dynamic> pageAndRemoveUntil(String routeName, {Object? arguments}) async {
    if (GlobalContextKey.instance.globalKey.currentState != null) {
      return await GlobalContextKey.instance.globalKey.currentState!
          .pushNamedAndRemoveUntil(routeName, (route) => false, arguments: arguments);
    } else {
      throw Exception();
    }
  }

  @override
  Future<dynamic> pageAndReplace(String routeName, {Object? arguments}) async {
    if (GlobalContextKey.instance.globalKey.currentState != null) {
      return await GlobalContextKey.instance.globalKey.currentState!
          .pushReplacementNamed(routeName, arguments: arguments);
    } else {
      throw Exception();
    }
  }
}
