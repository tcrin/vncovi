import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:vncovi/modules/home/blocs/state_of_dropdownbutton.dart';
import 'package:vncovi/modules/home/component/list_countries_covid_expansiontile.dart';
import 'package:vncovi/modules/home_test/widgets/monitor_covid.dart';
import 'package:vncovi/themes/app_colors.dart';
import 'package:vncovi/themes/app_styles.dart';

class DropdownBtn extends StatefulWidget {
  const DropdownBtn({Key? key}) : super(key: key);

  @override
  _DropdownBtnState createState() => _DropdownBtnState();
}

class _DropdownBtnState extends State<DropdownBtn> {
  late StateOfDropdown _state;
  @override
  void initState() {
    _state = StateOfDropdown();
    super.initState();
    _state.getItemCountry();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<StateOfDropdown>(
        create: (_)=>_state,
        child: Consumer<StateOfDropdown>(
          builder: (context, model, child){
             String value = model.selected;
            // print(value);
            // _state.getCovidCountry1();
            return Center(
              child: Column(
                children: [
                  Container(
                    height: 60,
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(
                        color: const Color(0xFFE5E5E5),
                      ),
                    ),
                    child: Row(
                      children: [
                        SvgPicture.asset('assets/icons/maps-and-flags.svg'),
                        const SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: DropdownButton(
                            hint: const Text("Not selected"),
                            isExpanded: true,
                            underline: const SizedBox(),
                            icon: SvgPicture.asset('assets/icons/dropdown.svg'),
                            value: value,
                            items: model.items!
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                model.setselected(newValue!);
                                model.getCovidCountry1();
                              });
                            },
                          ),
                        ),
                      ], //////////////////////////
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20,left: 20,right: 20),
                    child: Row(
                      children: <Widget>[
                        RichText(
                          text: const TextSpan(
                            children: [
                              TextSpan(
                                text: "Thông tin dịch bệnh\n",
                                style: AppStyle.kTitleTextStyle,
                              ),
                              TextSpan(
                                text: "Dữ liệu COVID-19 lấy từ Worldometers",
                                style: TextStyle(
                                  color: AppColor.kTextLightColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Spacer(),
                        InkWell(
                          onTap: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => ListCovidCountriesExpansionTile(),
                              ),
                            );
                          },
                          child: const Text(
                            "Xem chi tiết",
                            style: TextStyle(
                              color: AppColor.kPrimaryColor,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10,),
                  SizedBox(
                    child: MonitorCovid(
                      cases: model.caseCovid,
                      active: model.activeCovid,
                      recovered: model.recoverCovid,
                      deaths: model.dealtCovid,
                    ),
                  )
                ],
              ),
            );
          },
        ),
      );
  }
}
