import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mentlo/core/utils/styles/colors.dart';
import 'package:mentlo/features/admin_side/admin_layout/layout_bloc/cubit.dart';
import 'package:mentlo/features/admin_side/admin_layout/layout_bloc/states.dart';

class AdminNavigationLayout extends StatelessWidget {
  const AdminNavigationLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AdminNavigationBloc, AdminNavigationState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        AdminNavigationBloc cubit = AdminNavigationBloc.get(context);
        return Scaffold(
            appBar: AppBar(
              centerTitle: true,
            ),
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
                  icon: Icon(Icons.info_rounded),
                  label: 'Complains',
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


