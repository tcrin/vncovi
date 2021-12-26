import 'package:flutter/material.dart';
import 'package:vncovi/components/bottomnav.dart';
class QRPage extends StatelessWidget {
  const QRPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QR'),
      ),
      bottomNavigationBar: const BottomNav(
      activeButtonIndex: 2,
    ),
    );
  }
}
