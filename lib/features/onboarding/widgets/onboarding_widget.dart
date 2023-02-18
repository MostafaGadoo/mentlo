import 'package:flutter/material.dart';
import 'package:mentlo/features/sign_up/page/sigin_up_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BoardingModel {
  // final String image;
  final String title;
  final String body;

  BoardingModel({
    // required this.image,
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
  List<BoardingModel> boarding = [
    BoardingModel(
      // image: 'assets/images/Mental_illness.jpg',
      body:
          'It is during our darkest moments that we must focus to see the light',
      title: 'Get help to analysis your mental problem',
    ),
    BoardingModel(
      // image: 'assets/images/Doctors3.jpg',
      body:
          'We think that it is possible for ordinary people to choose to be extraordinary',
      title:
          'Doctors all over the world stated that mental illness can be treated easily',
    ),
    BoardingModel(
      // image: 'assets/images/Chatbot.jpg',
      body: 'Mentlo will be your new best friend to help all your problems',
      title: 'Chat Bots can help in solving the problem',
    ),
  ];

  @override
  Widget build(BuildContext context) {

    PageController scrollController = PageController();
    bool isLast = false;
    String buttonTitle = 'Next';
    return Scaffold(
      // backgroundColor: Colors.grey[300],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          'Mentlo',
          style: TextStyle(
            color:Colors.black,
          )
        ),
        centerTitle: true,
        actions: [
          TextButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const SignUpScreen()), (Route<dynamic> route) => false);
              },
              child: const Text(
                'Skip',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
              ))
        ],
      ),
      body: Column(
        // alignment: Alignment.bottomCenter,
        // overflow: Overflow.visible,
        children: [
          Container(
            height: 390,
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/Doctor.jpg'),
                fit: BoxFit.cover,
              )
            ),
          ),
          Container(
          // color: Colors.white,
          // height: 350,
          decoration:  const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40.0),
              topRight: Radius.circular(40.0),
            ),
            color: Colors.white,
          ),
          child: Column(
            children:  [
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 22.0,
                ),
                child: SmoothPageIndicator(
                    controller: scrollController,
                    count: boarding.length,
                    effect: const ExpandingDotsEffect(
                      dotColor: Colors.grey,
                      activeDotColor: Colors.blue,
                      dotHeight: 10,
                      expansionFactor: 4,
                      dotWidth: 10,
                      spacing: 5.0,
                    )
                ),
              ),
              SizedBox(
                height: 150,
                // width: 200,
                child: PageView.builder(
                  onPageChanged: (index) {
                    if (index == boarding.length - 1) {
                        isLast = true;
                        buttonTitle = 'Get Started';
                    } else {

                        isLast = false;
                    }
                  },
                  controller: scrollController,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) =>buildBoardingItem(boarding[index]),
                  itemCount: boarding.length,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 20.0,
                ),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.blue,
                  ),
                  child: MaterialButton(
                    onPressed: () {
                      if (isLast == true){
                        debugPrint('last');
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const SignUpScreen(),),);
                      } else {
                        scrollController.nextPage(
                          duration: const Duration(milliseconds: 750),
                          curve: Curves.fastLinearToSlowEaseIn,
                        );
                      }
                    },
                    height: 54,
                    child: Text(
                      buttonTitle.toString(),
                      style: const TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          ),
        ],

      ),
    );
  }

  Widget buildBoardingItem(BoardingModel model) => Column(
        children: [
          // Image(
          //   width: double.infinity,
          //   height: 250.0,
          //   image: AssetImage(
          //     model.image,
          //   ),
          // ),
          const SizedBox(
            height: 15.0,
          ),
          Text(
            model.title,
            style: const TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.bold,
                ),
                 textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
            ),
          const SizedBox(
            height: 20.0,
          ),
          Text(
            model.body,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      );
}
