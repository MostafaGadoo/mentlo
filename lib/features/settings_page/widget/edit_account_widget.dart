import 'package:flutter/material.dart';

class EditAccountWidget extends StatelessWidget {
  const EditAccountWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Edit account',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: const [

        ],
      ),
    );
  }
}
