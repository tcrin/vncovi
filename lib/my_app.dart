import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vncovi/modules/authentication/login_phone_page.dart';
import 'package:vncovi/modules/declaration/declaration_page.dart';
import 'package:vncovi/modules/home/home_page.dart';
import 'package:vncovi/modules/information/information_covid_page.dart';
import 'package:vncovi/route/route_name.dart';

import 'controller/nav_controller.dart';
import 'modules/qr/qr_page.dart';
import 'modules/vaccination/vaccination_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    NavigationController navigation =
        Provider.of<NavigationController>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: Navigator(
        pages: [
          const MaterialPage(
            child: LoginPage(),
          ),
          if (navigation.screenName == RouteName.infoPage)
            const MaterialPage(child: InformationCovidPage()),
          if (navigation.screenName == RouteName.qrPage)
            const MaterialPage(child: QRPage()),
          if (navigation.screenName == RouteName.healthDeclarationPage)
            const MaterialPage(child: DeclarationPage()),
          if (navigation.screenName == RouteName.vaccinationPage)
            const MaterialPage(child: VaccinationPage()),
        ],
        onPopPage: (route, result) {
          bool popStatus = route.didPop(result);
          if (popStatus == true) {
            Provider.of<NavigationController>(context, listen: false)
                .changScreen(RouteName.homePage);
          }
          return popStatus;
        },
      ),
    );
  }
}
