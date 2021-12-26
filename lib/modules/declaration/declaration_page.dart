import 'package:flutter/material.dart';
import 'package:vncovi/components/bottomnav.dart';
import 'package:vncovi/modules/declaration/widgets/declaration_test.dart';

class DeclarationPage extends StatelessWidget {
  const DeclarationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Khai báo'),
        automaticallyImplyLeading: false,
      ),
      body: Theme(
        data: Theme.of(context).copyWith(
          colorScheme: ColorScheme.light(primary: Colors.indigoAccent),
        ),
        child: DeclarationTest(),
      ),
      bottomNavigationBar: const BottomNav(
        activeButtonIndex: 3,
      ),
    );
  }
}
