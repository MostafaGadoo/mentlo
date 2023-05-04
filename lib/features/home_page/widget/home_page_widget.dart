import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:mentlo/core/utils/authentication_bloc/cubit.dart';
import 'package:mentlo/core/utils/blocs/appointment_bloc/cubit.dart';
import 'package:mentlo/core/utils/blocs/doctors_bloc/cubit.dart';
import 'package:mentlo/core/utils/shared_widgets/topDoctorsWidget.dart';
import 'package:mentlo/core/utils/styles/colors.dart';
import 'package:mentlo/core/utils/styles/icon_broken.dart';
import 'package:mentlo/features/dentistry/pages/dentistry_home_screen.dart';
import 'package:mentlo/features/doctors_list/page/doctors_list_screen.dart';
import 'package:mentlo/features/medicine_timing/page/medicine_timing_page.dart';

class HomePageWidget extends StatelessWidget {
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: HexColor('#f0f4f7'),
        // appBar: AppBar(
        //   // backgroundColor: HexColor('#DCFCFB'),
        //   title: const Text(
        //     'Home',
        //     style: TextStyle(
        //       color: Colors.black,
        //       fontSize: 22,
        //       fontWeight: FontWeight.bold,
        //     ),
        //   ),
        //   centerTitle: true,
        // ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Hello, ${AuthenticationBloc.get(context).userModel.name}',
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        const Text('Thank you for choosing Mentlo',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Ways to reduce mental illness',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const Text(
                          'View ways to reduce the mental illness',
                          style: TextStyle(
                            fontSize: 14,
                            // fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                children: const [
                                  Image(
                                      width: 80,
                                      height: 80,
                                      image: AssetImage('assets/images/yoga.jpg')
                                  ),
                                  SizedBox(height: 5,),
                                  Text(
                                    'Yoga',
                                    style: TextStyle(
                                      fontSize: 14,
                                      // fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Column(
                                children: const [
                                  Image(
                                      width: 80,
                                      height: 80,
                                      image: AssetImage('assets/images/Pilates.jpg')
                                  ),
                                  SizedBox(height: 5,),
                                  Text(
                                    'Pilates',
                                    style: TextStyle(
                                      fontSize: 14,
                                      // fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Column(
                                children: const [
                                  Image(
                                      width: 80,
                                      height: 80,
                                      image: AssetImage('assets/images/meditation.jpg')
                                  ),
                                  SizedBox(height: 5,),
                                  Text(
                                    'Meditation',
                                    style: TextStyle(
                                      fontSize: 14,
                                      // fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Column(
                                children: const [
                                  Image(
                                      width: 80,
                                      height: 80,
                                      image: AssetImage('assets/images/Walking.jpg')
                                  ),
                                  SizedBox(height: 5,),
                                  Text(
                                    'Walking',
                                    style: TextStyle(
                                      fontSize: 14,
                                      // fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          debugPrint(DoctorsBloc.get(context).doctors[0].name);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              children: const [
                                CircleAvatar(
                                  radius: 38,
                                  // backgroundColor: Colors.white,
                                  backgroundImage: AssetImage(
                                      'assets/images/doctor_visit.jpg'),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'Clinic visit',
                                  style: TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            children: const [
                              CircleAvatar(
                                radius: 38,
                                backgroundColor: Colors.blue,
                                backgroundImage:
                                    AssetImage('assets/images/doctor_chat.jpg'),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Doctor Chat',
                                textAlign: TextAlign.left,
                                maxLines: 1,
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            children: const [
                              CircleAvatar(
                                radius: 38,
                                backgroundColor: Colors.blue,
                                backgroundImage:
                                    AssetImage('assets/images/mental_help.jpg'),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Mental Help',
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(
                            bottom: 10,
                          ),
                          child: Text(
                            'Our services',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  debugPrint('Henaa');
                                },
                                child: Container(
                                  height: 100,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: HexColor('#a4f5ec'),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Icon(
                                        Icons.phone,
                                        size: 42,
                                      ),
                                      SizedBox(
                                        height: 4,
                                      ),
                                      Text(
                                        'Contact Doctor',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  debugPrint('Hennnaaa');
                                },
                                child: Container(
                                  height: 100,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: HexColor('#a4f5ec'),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Icon(
                                        Icons.note_alt_sharp,
                                        size: 42,
                                      ),
                                      SizedBox(
                                        height: 4,
                                      ),
                                      Text(
                                        'Prescription picture',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  debugPrint('Hennnaaa');
                                },
                                child: Container(
                                  height: 100,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: HexColor('#a4f5ec'),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Icon(
                                        Icons.photo_camera_outlined,
                                        size: 42,
                                      ),
                                      SizedBox(
                                        height: 4,
                                      ),
                                      Text(
                                        'Product Picture',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Add your medicine timings',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Expanded(
                              child: Text(
                                'Add reminder for your medicine',
                                style: TextStyle(
                                  fontSize: 18,
                                  // fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            Container(
                                clipBehavior: Clip.antiAlias,
                                height: 45,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: defaultColor,
                                ),
                                child: MaterialButton(
                                  onPressed: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => const MedicineTimingPage()));
                                  },
                                  child: const Text(
                                    'Add',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ))
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Have any medical question?',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            const Image(
                              width: 100,
                              height: 70,
                              fit: BoxFit.cover,
                              image: AssetImage('assets/images/Chat_icon.png'),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    'Send your question and get the response withing 24 hours.',
                                    style: TextStyle(
                                      fontSize: 16,
                                      // fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 5,
                              ),
                              child: Container(
                                clipBehavior: Clip.antiAlias,
                                height: 45,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.teal,
                                ),
                                child: MaterialButton(
                                  onPressed: () {},
                                  color: defaultColor,
                                  child: const Text(
                                    'Ask Now',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
