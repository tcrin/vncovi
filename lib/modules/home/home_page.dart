import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vncovi/components/bottomnav.dart';
import 'package:vncovi/components/header/header.dart';
import 'package:vncovi/modules/home/component/dropdown_btn.dart';
import 'package:vncovi/themes/app_assets.dart';
import 'package:vncovi/themes/app_colors.dart';
import 'package:vncovi/themes/app_styles.dart';

import 'component/covid_map.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Header(
              textTop: 'Đeo khẩu trang',
              textBottom: 'trước khi ra khỏi nhà',
              image: AppAssets.Drcorona,
            ),
           DropdownBtn(),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const <Widget>[
                      Text(
                        "Bản đồ dịch bệnh",
                        style: AppStyle.kTitleTextStyle,
                      ),
                      Text(
                        "Xem chi tiết",
                        style: TextStyle(
                          color: AppColor.kPrimaryColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  const CovidMap(),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNav(
        activeButtonIndex: 0,
      ),
    );
  }
}
