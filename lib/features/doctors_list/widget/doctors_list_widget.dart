import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:mentlo/core/utils/blocs/doctors_bloc/cubit.dart';
import 'package:mentlo/core/utils/blocs/doctors_bloc/states.dart';
import 'package:mentlo/features/cardiothoracic/pages/cardiothoracic_page.dart';
import 'package:mentlo/features/dentistry/pages/dentistry_home_screen.dart';
import 'package:mentlo/features/surgery/pages/surgery_page.dart';

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
        return DefaultTabController(
          length: 3,
          child: Scaffold(
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
              bottom: const TabBar(
                physics: BouncingScrollPhysics(),
                isScrollable: true,
                indicatorColor: Colors.teal,
                indicatorSize: TabBarIndicatorSize.label,
                unselectedLabelStyle: TextStyle(
                  color: Colors.grey,
                ),
                labelColor: Colors.black,
                tabs: [
                  Tab( child: Text('Dentist',),),
                  Tab( child: Text('Cardiothoracic',),),
                  Tab( child: Text('surgery',),),
                ]
              ),
            ),
            body: const Padding(
              padding: EdgeInsets.only(
                top: 16,
                left: 16,
                right: 16,
              ),
              child: TabBarView(
                physics: BouncingScrollPhysics(),
                children: [
                  DentistryHomeScreen(),
                  CardiothoracicPage(),
                  SurgeryPage(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}