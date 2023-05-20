import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mentlo/core/utils/authentication_bloc/cubit.dart';
import 'package:mentlo/core/utils/blocs/appointment_bloc/cubit.dart';
import 'package:mentlo/core/utils/blocs/doctors_bloc/cubit.dart';
import 'package:mentlo/core/utils/blocs/mental_health_model_bloc/cubit.dart';
import 'package:mentlo/core/utils/blocs/navigation_bloc/cubit.dart';
import 'package:mentlo/features/admin_side/admin_home_page/page/admin_home_page.dart';
import 'package:mentlo/features/admin_side/admin_layout/admin_main_layout.dart';
import 'package:mentlo/features/admin_side/admin_layout/layout_bloc/cubit.dart';
import 'package:mentlo/features/doctors_list/page/doctors_list_screen.dart';
import 'package:mentlo/features/home_page/page/home_page_screen.dart';
import 'package:mentlo/features/layouts/main_layout.dart';
import 'package:mentlo/features/onboarding/widgets/onboarding_widget.dart';
import 'package:mentlo/features/settings_page/pages/edit_account_page.dart';
import 'package:mentlo/features/settings_page/pages/settings_screen.dart';
import 'package:mentlo/features/sign_in/page/signin_page.dart';
import 'package:mentlo/features/sign_up/page/sigin_up_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthenticationBloc()),
        BlocProvider(create: (context) => NavigationBloc()),
        BlocProvider(create: (context) => DoctorsBloc()..getDentistDoctors()..getSurgeryDoctors()..getCardiothoracicDoctors()),
        BlocProvider(create: (context) => AppointmentBloc()..getPatientAppointments(uid: AuthenticationBloc.get(context).userModel.uId!)),
        BlocProvider(create: (context) => MentalHealthBloc()),
        BlocProvider(create: (context) => AdminNavigationBloc()),
      ],
      child: MaterialApp(
        title: 'Mentlo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          appBarTheme: const AppBarTheme(
            iconTheme: IconThemeData(color: Colors.black),
            backgroundColor: Colors.white,
            elevation: 0,
          ),
        ),
        home: const OnBoardingWidget(),
      ),
    );
  }
}


