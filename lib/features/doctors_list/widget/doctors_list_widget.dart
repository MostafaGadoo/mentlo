import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:mentlo/core/utils/blocs/doctors_bloc/cubit.dart';
import 'package:mentlo/core/utils/blocs/doctors_bloc/states.dart';

class DoctorsListWidget extends StatelessWidget {
  const DoctorsListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DoctorsBloc, DoctorsStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        DoctorsBloc cubit = DoctorsBloc.get(context);
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              'Doctors List',
              style: TextStyle(
                color: Colors.black,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            centerTitle: true,
            // bottom: const TabBar(
            //   controller: ,
            //   tabs: [
            //     Tab( child: Text('Sports Medicine'),),
            //     Tab( child: Text('Sports Medicine'),),
            //     Tab( child: Text('Sports Medicine'),),
            //   ]
            // ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: HexColor('#F1F0F3'),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                radius: 45,
                                // backgroundColor: Colors.blue,
                                backgroundImage: NetworkImage(cubit.doctors[0].imageUrl),
                              ),
                              const SizedBox(height: 25),
                              Text(
                                cubit.doctors[0].name.split('L.').first,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                cubit.doctors[2].specialization,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              const SizedBox(height: 15),
                              Container(
                                height: 54,
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: MaterialButton(
                                  onPressed: () {
                                    debugPrint(cubit.doctors[0].description);
                                  },
                                  child: const Text(
                                    'Appointment',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: HexColor('#F1F0F3'),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                radius: 45,
                                backgroundColor: Colors.blue,
                                backgroundImage: NetworkImage(cubit.doctors[1].imageUrl),
                              ),
                              const SizedBox(height: 25),
                              Text(
                                cubit.doctors[1].name.split('J.').first,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                cubit.doctors[1].specialization,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              const SizedBox(height: 15),
                              Container(
                                height: 54,
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: MaterialButton(
                                  onPressed: () {
                                    // debugPrint(cubit.doctors[1].description);
                                  },
                                  child: const Text(
                                    'Appointment',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
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
        );
      },
    );
  }
}
