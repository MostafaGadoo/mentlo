import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mentlo/core/models/appointments_model.dart';
import 'package:mentlo/core/utils/blocs/appointment_bloc/state.dart';

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

  void bookAppointment({
    required String date,
    required String time,
    required String userId,
    required String doctorId,
    required String appointmentId,
  }){
    AppointmentModel appointmentModel = AppointmentModel(
      date: date,
      time: time,
      userId: userId,
      doctorId: doctorId,
      appointmentId: appointmentId,
    );
    FirebaseFirestore.instance
        .collection('appointments')
        .doc(appointmentId)
        .set(appointmentModel.toJson())
        .then((value){
      emit(AppointmentSaveSuccessState());
      debugPrint('Appointment Booked');
    }).catchError((error){
      emit(AppointmentSaveErrorState(error.toString()));
      debugPrint('Appointment Error');
    });
  }


}
