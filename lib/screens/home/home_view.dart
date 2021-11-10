library app.home;

import 'dart:io';

import 'package:flutter/material.dart';

import 'package:fluttergram/widgets/button.dart';
import 'package:image_picker/image_picker.dart';

import 'package:fluttergram/helpers/navigator.dart';
import 'package:fluttergram/locator.dart';
import 'package:fluttergram/ui_shared/constanst.dart';
import 'package:fluttergram/ui_shared/size_config.dart';
import 'package:fluttergram/widgets/bottom_navbar.dart';
import 'package:fluttergram/widgets/input.dart';
import 'package:fluttergram/widgets/profile_item.dart';

part './timeline_view.dart';
part './profile_view.dart';
part './create_post_view.dart';

class HomeView extends StatelessWidget {
  final NavigatorService navigator = locator<NavigatorService>();
  static String route = 'home';

  @override
  Widget build(BuildContext context) {
    return Navigator(
      initialRoute: TimelineView.route,
      key: navigator.homeNavigatorKey,
      onGenerateRoute: homeRouteStack,
    );
  }

  Route<dynamic>? homeRouteStack(RouteSettings settings) {
    Map<String, Route<dynamic>> appRouting = <String, Route<dynamic>>{
      ProfileView.route: MaterialPageRoute<dynamic>(
        settings: RouteSettings(name: settings.name),
        builder: (_) => ProfileView(),
      ),
      TimelineView.route: MaterialPageRoute<dynamic>(
        settings: RouteSettings(name: settings.name),
        builder: (_) => TimelineView(),
      ),
      CreatePostView.route: MaterialPageRoute<dynamic>(
        settings: RouteSettings(name: settings.name),
        builder: (_) => CreatePostView(),
      ),
    };
    return appRouting[settings.name];
  }
}
