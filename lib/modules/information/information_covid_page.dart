import 'package:flutter/material.dart';
import 'package:vncovi/components/bottomnav.dart';
import 'package:vncovi/components/header/header.dart';
import 'package:vncovi/modules/information/widgets/prevent_card.dart';
import 'package:vncovi/modules/information/widgets/symptom_card.dart';
import 'package:vncovi/themes/app_assets.dart';
import 'package:vncovi/themes/app_styles.dart';
class InformationCovidPage extends StatelessWidget {
  const InformationCovidPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Header(
              image: AppAssets.coronadr,
              textTop: "Thông tin cần biết",
              textBottom: "về Covid-19.",
              onTap: ()=>null,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Triệu chứng",
                    style: AppStyle.kTitleTextStyle,
                  ),
                  SizedBox(height: 20),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        SymptomCard(
                          image: "assets/images/headache.png",
                          title: "Đau đầu",
                          isActive: true,
                        ),
                        SizedBox(width: 10,),
                        SymptomCard(
                          image: "assets/images/caugh.png",
                          title: "Ho",
                        ),
                        SizedBox(width: 10,),
                        SymptomCard(
                          image: "assets/images/fever.png",
                          title: "Sốt",
                        ),
                        SizedBox(width: 10,),
                        SymptomCard(
                          image: "assets/images/headache.png",
                          title: "Đau đầu",
                          isActive: true,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Text("Phòng ngừa", style: AppStyle.kTitleTextStyle),
                  SizedBox(height: 20),
                  PreventCard(
                    text:
                    "Kể từ khi bắt đầu bùng phát virus coronavirus, một số nơi đã hoàn toàn chấp nhận đeo khẩu trang",
                    image: "assets/images/wear_mask.png",
                    title: "Đeo khẩu trang",
                  ),
                  PreventCard(
                    text:
                    "Since the start of the coronavirus outbreak some places have fully embraced wearing facemasks",
                    image: "assets/images/wash_hands.png",
                    title: "Rửa tay bằng dung dịch sát khuẩn",
                  ),
                  SizedBox(height: 50),
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: const BottomNav(
      activeButtonIndex: 1,
    ),
    );
  }
}
