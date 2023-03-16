import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:mentlo/core/models/appointments_model.dart';
import 'package:mentlo/core/utils/blocs/appointment_bloc/state.dart';
import 'package:table_calendar/table_calendar.dart';

class AppointmentBloc extends Cubit<AppointmentStates> {
  AppointmentBloc() : super(AppointmentInitialState());

  static AppointmentBloc get(context) => BlocProvider.of(context);

  AppointmentModel? appointments;
  void getAppointmentsByUserId(String userId) {
    emit(AppointmentLoadingState());
    FirebaseFirestore.instance
        .collection('appointments')
        .doc(userId)
        .get()
        .then((value) {
          appointments = AppointmentModel.fromJson(value.data()!);
          debugPrint(appointments!.date);
          emit(AppointmentSuccessState());
    }).catchError((error) {
      emit(AppointmentErrorState(error.toString()));
    });
  }

  int appointmentID = 0;
  void bookAppointment({
    required String date,
    required String time,
    required String userId,
    required String doctorId,
  }){
    AppointmentModel appointmentModel = AppointmentModel(
      date: date,
      time: time,
      userId: userId,
      doctorId: doctorId,
      appointmentId: appointmentID+1,
    );
    FirebaseFirestore.instance
        .collection('appointments')
        .doc()
        .set(appointmentModel.toJson())
        .then((value){
      emit(AppointmentSaveSuccessState());
      appointmentID = appointmentID+1;
      debugPrint('Appointment Booked');
    }).catchError((error){
      emit(AppointmentSaveErrorState(error.toString()));
      debugPrint('Appointment Error');
    });
  }

  DateTime today = DateTime.now();
  // var dateFormat = DateFormat('ar');
  DateTime? dayFocused = DateTime.now();
  // DateTime? daySelected;
  void selectedDay(DateTime selectedDay, DateTime focusedDay){
    dayFocused = selectedDay;
    // daySelected = selectedDay;
    debugPrint(dayFocused.toString().split(' ')[0]);
    // debugPrint(daySelected.toString().split(' ')[0]);
    emit(AppointmentDaySelectionState());
  }

  List<dynamic> dayAppointments(DateTime day){
    // write the logic to get the appointments for a specific day
    return [];
  }

  CalendarFormat? calendarFormat;
  void changeCalendarFormat(CalendarFormat format){
    calendarFormat = format;
    emit(AppointmentCalendarFormatState());
  }
}
