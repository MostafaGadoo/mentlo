import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mentlo/core/utils/blocs/navigation_bloc/cubit.dart';
import 'package:mentlo/core/utils/blocs/navigation_bloc/states.dart';
import 'package:mentlo/core/utils/styles/colors.dart';

class MainLayOut extends StatelessWidget {
  const MainLayOut({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NavigationBloc, NavigationStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        NavigationBloc cubit = NavigationBloc.get(context);
        return Scaffold(
            // appBar: AppBar(
            //   centerTitle: true,
            //   // title: Text(
            //   //     cubit.titles[cubit.currentIndex],
            //   //     style: const TextStyle(
            //   //         color: Colors.black,
            //   //     ),
            //   // ),
            // ),
            body: cubit.screens[cubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              onTap: (index) {
                cubit.changeBottomNav(index);
                debugPrint(index.toString());
              },
              currentIndex: cubit.currentIndex,
              type: BottomNavigationBarType.fixed,
              selectedItemColor: defaultColor,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.medical_information),
                  label: 'Doctors',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.calendar_month),
                  label: 'Appointments',
                ),
                // BottomNavigationBarItem(
                //   icon: Icon(Icons.chat),
                //   label: 'Chat',
                // ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.settings),
                  label: 'Settings',
                ),
              ],
            )
        );
      },
    );
  }
}
