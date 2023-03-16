import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mentlo/core/utils/blocs/navigation_bloc/states.dart';
import 'package:mentlo/features/appointments_page/page/appointments_screen_page.dart';
import 'package:mentlo/features/chat_page/pages/chat_screen.dart';
import 'package:mentlo/features/doctors_list/page/doctors_list_screen.dart';
import 'package:mentlo/features/home_page/page/home_page_screen.dart';
import 'package:mentlo/features/settings_page/pages/settings_screen.dart';

class NavigationBloc extends Cubit<NavigationStates>{
  NavigationBloc():super(AppInitialState());
  static NavigationBloc get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<Widget> screens=[
    const HomePageScreen(),
    const DoctorsListScreen(),
    const AppointmentsScreen(),
    const ChatScreen(),
    const SettingsScreen(),
  ];

  // List<String> titles=[
  //   'Home',
  //   'Doctors',
  //   'Chat',
  //   'Settings',
  // ];


  void changeBottomNav(int index){
    currentIndex = index;
    debugPrint(currentIndex.toString());
    emit(AppChangeBottomNavState());
  }

  // TabController tabController = TabController(length: 2, vsync: const ScrollableState());
}