import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mentlo/features/admin_side/admin_feedback/pages/admin_feedback_page.dart';
import 'package:mentlo/features/admin_side/admin_layout/layout_bloc/states.dart';
import 'package:mentlo/features/admin_side/admin_settings_screen/pages/settings_page.dart';

class AdminNavigationBloc extends Cubit<AdminNavigationState> {
  AdminNavigationBloc() :super(AdminNavigationInitial());

  static AdminNavigationBloc get(context) => BlocProvider.of(context);


  List<Widget> screens=[
    const Center(child: Text('Home'),),
    const AdminViewFeedbacks(),
    const Center(child: Text('Appointments'),),
    const AdminSettingsScreen(),
  ];

  int currentIndex = 0;
  void changeBottomNav(int index){
    currentIndex = index;
    debugPrint(currentIndex.toString());
    emit(AdminAppChangeBottomNavState());
  }


}