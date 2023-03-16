import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:mentlo/core/utils/blocs/appointment_bloc/cubit.dart';
import 'package:mentlo/core/utils/blocs/doctors_bloc/cubit.dart';
import 'package:mentlo/core/utils/shared_widgets/topDoctorsWidget.dart';
import 'package:mentlo/features/dentistry/pages/dentistry_home_screen.dart';
import 'package:mentlo/features/doctors_list/page/doctors_list_screen.dart';

class HomePageWidget extends StatelessWidget {
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('#f0f4f7'),
      appBar: AppBar(
        // backgroundColor: HexColor('#DCFCFB'),
        title: const Text(
          'Home',
          style: TextStyle(
            color: Colors.black,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Row(
                children: [
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
                              // backgroundColor: Colors.white,
                              backgroundImage: AssetImage('assets/images/doctor_visit.jpg'),
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
                              backgroundImage: AssetImage('assets/images/doctor_chat.jpg'),
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
                              backgroundImage: AssetImage('assets/images/mental_help.jpg'),
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
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 20,
                          horizontal: 10,
                        ),
                        child: Text(
                          'Let\'s find your Doctor',
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: HexColor('00008B'),
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => const DentistryHomeScreen(),),);
                              },
                              child: const CircleAvatar(
                                radius: 40,
                                backgroundColor: Colors.white,
                                backgroundImage: AssetImage(
                                  'assets/icons/teeth.png',
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: (){
                                debugPrint(DoctorsBloc.get(context).doctors[1].name);
                              },
                              child: const CircleAvatar(
                                radius: 40,
                                backgroundColor: Colors.white,
                                backgroundImage: AssetImage(
                                  'assets/icons/heart.png',
                                ),
                              ),
                            ),
                          ),
                          const Expanded(
                            child: CircleAvatar(
                              radius: 40,
                              backgroundColor: Colors.white,
                              backgroundImage: AssetImage(
                                'assets/icons/eye.png',
                              ),
                            ),
                          ),
                          const Expanded(
                            child: CircleAvatar(
                              radius: 40,
                              backgroundColor: Colors.white,
                              backgroundImage: AssetImage(
                                'assets/icons/syring.png',
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 20,
                        ),
                        child: TextFormField(
                          keyboardType: TextInputType.text,
                          decoration: const InputDecoration(
                            labelText: 'Search for all you medical tips',
                            prefixIcon: Icon(Icons.search),
                            border: OutlineInputBorder(),
                            filled: true,
                            fillColor: Colors.white,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white,
                                width: 2,
                              ),
                            ),
                          ),
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
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: HexColor('#F3F3F4'),
                ),
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Expanded(
                            child: Text(
                              'Top Doctors',
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          TextButton(
                              onPressed: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => const DoctorsListScreen()));
                              },
                              child: const Text(
                                'See All',
                                style: TextStyle(
                                  color: Colors.lightBlue,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Container(
                        height: 200,
                        child: ListView.separated(
                          physics: const BouncingScrollPhysics(),
                            itemBuilder: (context, index) =>  TopDoctorsWidget(
                                  name: DoctorsBloc.get(context).doctors[index].name,
                                  specification: DoctorsBloc.get(context).doctors[index].specialization,
                                  expYears: 5,
                                  image: DoctorsBloc.get(context).doctors[index].imageUrl,
                            ),
                            separatorBuilder: (context, builder) => const SizedBox(
                              height: 15,
                            ),
                            itemCount: DoctorsBloc.get(context).doctors.length,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
