import 'package:flutter/material.dart';
import 'package:vncovi/components/bottomnav.dart';
import 'package:vncovi/modules/vaccination/widgets/vaccination.dart';
class VaccinationPage extends StatelessWidget {
  const VaccinationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Đăng ký tiêm Vaccine'),
        automaticallyImplyLeading: false,
      ),
      body: Theme(
        data: Theme.of(context).copyWith(
          colorScheme: const ColorScheme.light(primary: Colors.indigoAccent),
        ),
        child: const Vaccination(),
      ),
      bottomNavigationBar: const BottomNav(
        activeButtonIndex: 4,
      ),
    );
  }
}
