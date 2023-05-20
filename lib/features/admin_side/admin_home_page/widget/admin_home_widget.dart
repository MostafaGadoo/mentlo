import 'package:flutter/material.dart';

class AdminHomeWidget extends StatelessWidget {
  const AdminHomeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(child: Text('Admin Home Page')),
    );
  }
}
