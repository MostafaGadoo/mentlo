import 'package:flutter/material.dart';


class BoardingModel {
  final String image;
  final String title;
  final String body;

  BoardingModel({
    required this.image,
    required this.title,
    required this.body,
  });
}



class OnBoardingWidget extends StatefulWidget {
  const OnBoardingWidget({Key? key}) : super(key: key);

  @override
  State<OnBoardingWidget> createState() => _OnBoardingWidgetState();
}

class _OnBoardingWidgetState extends State<OnBoardingWidget> {

  List<BoardingModel> boarding =[
    BoardingModel(
      image: 'assets/images/Mental_illness.jpg',
      body: 'It is during our darkest moments that we must focus to see the light',
      title: 'Get help to analysis your mental problem',
    ),
    BoardingModel(
      image: 'assets/images/Doctors.jpg',
      body: 'We think that it is possible for ordinary people to choose to be extraordinary',
      title: 'Doctors all over the world stated that mental illness can be treated easily',
    ),
    BoardingModel(
      image: 'assets/images/Chatbot.jpg',
      body: 'Mentlo will be your new best friend to help all your problems',
      title: 'Chat Bots can help in solving the problem',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      // appBar: AppBar(
      //
      // ),
    );
  }
}
