import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mentlo/core/utils/blocs/navigation_bloc/states.dart';
import 'package:mentlo/core/utils/styles/colors.dart';
import 'package:mentlo/features/appointments_page/page/appointments_screen_page.dart';
import 'package:mentlo/features/chat_page/pages/chat_screen.dart';
import 'package:mentlo/features/doctors_list/page/doctors_list_screen.dart';
import 'package:mentlo/features/home_page/page/home_page_screen.dart';
import 'package:mentlo/features/settings_page/pages/settings_screen.dart';
import 'package:overlay_support/overlay_support.dart';

class NavigationBloc extends Cubit<NavigationStates>{
  NavigationBloc():super(AppInitialState());
  static NavigationBloc get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<Widget> screens=[
    const HomePageScreen(),
    const DoctorsListScreen(),
    const AppointmentsScreen(),
    // const ChatScreen(),
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

  bool hasInternet = false;
  void checkInternet()async{
    hasInternet = await InternetConnectionChecker().hasConnection;
    debugPrint(hasInternet.toString());
    showSimpleNotification(
      Text(
        hasInternet ? 'Connected' : 'No Internet Connection',
        style: const TextStyle(color: Colors.white),
      ),
      background: hasInternet ? Colors.green : Colors.red,
    );
  }

  bool isDark = false;
  void changeAppMode(){
    isDark = !isDark;
    debugPrint(isDark.toString());
    emit(AppChangeModeState());
  }

  void changeAppColor(String color){
    if(color == 'Red'){
      defaultColor = Colors.red;
      emit(AppChangeColorState());
    }else if(color == 'Blue'){
      defaultColor = Colors.blue;
      emit(AppChangeColorState());
    }else if(color == 'Light blue'){
      defaultColor = Colors.lightBlue;
      emit(AppChangeColorState());
    }else{
      defaultColor = Colors.teal;
      emit(AppChangeColorState());
    }
  }
  
}