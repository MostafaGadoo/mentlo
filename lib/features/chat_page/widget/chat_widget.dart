import 'package:flutter/material.dart';
import 'package:mentlo/core/utils/shared_widgets/ChatWidget.dart';
import 'package:mentlo/core/utils/styles/colors.dart';

class ChatWidget extends StatelessWidget {
  const ChatWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Chat',
          style: TextStyle(
            color: Colors.black,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, builder) => const DefaultChatWidget(),
              separatorBuilder: (context, builder) => Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 25,
                ),
                child: Container(
                  height: 1,
                  color: Colors.grey,
                  width: double.infinity,
                ),
              ),
              itemCount: 15,
            ),
          ),

        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          debugPrint('Pressed');
        },
        backgroundColor: defaultColor,
        child: const Icon(
          Icons.message_outlined,
          color: Colors.white,
        ),
      ),
    );
  }
}
