import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:mentlo/core/models/appointments_model.dart';
import 'package:mentlo/core/models/complains_model.dart';
import 'package:mentlo/core/models/feedback_model.dart';
import 'package:mentlo/core/models/medicine_model.dart';
import 'package:mentlo/core/utils/authentication_bloc/cubit.dart';
import 'package:mentlo/core/utils/blocs/appointment_bloc/state.dart';
import 'package:path/path.dart';
import 'package:table_calendar/table_calendar.dart';

class AppointmentBloc extends Cubit<AppointmentStates> {
  AppointmentBloc() : super(AppointmentInitialState());

  // static AppointmentBloc get(context) => BlocProvider.of(context);
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
    required String doctorName,
    required String doctorSpeciality,
  }){
    AppointmentModel appointmentModel = AppointmentModel(
      date: date,
      time: time,
      Uid: userId,
      doctorId: doctorId,
      doctorName: doctorName,
      doctorSpecialization: doctorSpeciality,
      appointmentId: FirebaseFirestore.instance.collection('appointments').doc().id,
    );
    FirebaseFirestore.instance
        .collection('appointments')
        .doc()
        .set(appointmentModel.toJson())
        .then((value){
          // appointmentID = (appointmentModel.appointmentId+1.toString()) as int;
      emit(AppointmentSaveSuccessState());

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
    // getPatientAppointments(uid: AuthenticationBloc.get(context).userModel.uId!);
    debugPrint(dayFocused.toString().split(' ')[0]);
    // debugPrint(daySelected.toString().split(' ')[0]);

    emit(AppointmentDaySelectionState());
  }

  List<dynamic> dayAppointments(DateTime day){
    // write the logic to get the appointments for a specific day
    return patientAppointments.where((element) => element.date == day.toString().split(' ')[0]).toList();
  }

  CalendarFormat? calendarFormat;
  void changeCalendarFormat(CalendarFormat format){
    calendarFormat = format;
    emit(AppointmentCalendarFormatState());
  }


  AppointmentModel? patientAppointment;
  List<AppointmentModel> patientAppointments = [];
    void getPatientAppointments({
  required String uid,
}){

    emit(GetPatientAppointmentsLoadingState());
    
    FirebaseFirestore.instance.collection('appointments')
    .where('Uid', isEqualTo: uid)
    .get().then((value){
      debugPrint(value.docs.length.toString());
      value.docs.forEach((element) {
        patientAppointments.add(AppointmentModel.fromJson(element.data()));
        patientAppointment = AppointmentModel.fromJson(element.data());
        // debugPrint(element.data().toString());
        // patientAppointments =[];
      });
      emit(GetPatientAppointmentSuccessState());
    }).catchError((error){
      emit(GetPatientAppointmentErrorState(error.toString()));
    });
  }

  void sendFeedback({
    required String userId,
    required String msg,
    required double rating,
}){
    FeedbackModel feedbackModel = FeedbackModel(
      userId: userId,
      message: msg,
      rating: rating,
    );
    emit(SaveFeedbackLoadingState());
    FirebaseFirestore.instance
        .collection('feedback')
        .doc()
        .set(feedbackModel.toJson())
        .then((value){
      emit(SaveFeedbackSuccessState());
      debugPrint('Feedback Sent');
    }).catchError((error){
      emit(SaveFeedbackErrorState(

          error.toString()));
      debugPrint('Feedback Error');
    });
  }

  void sendComplain({
    required String userId,
    required String doctorName,
    required String complain ,
  }){
      ComplainsModel complainsModel = ComplainsModel(
      userId: userId,
      doctorsName: doctorName,
      complains: complain,
    );
    emit(SaveComplainLoadingState());
    FirebaseFirestore.instance
        .collection('complains')
        .doc()
        .set(complainsModel.toJson())
        .then((value){
      emit(SaveComplainSuccessState());
      debugPrint('Complain Sent');
    }).catchError((error){
      emit(SaveComplainErrorState(

          error.toString()));
      debugPrint('Complains Error');
    });
  }

  void saveMedicineData({
    required String userID,
    required String medicineName,
    required String medicineTime,
    required String medicineFrom,
    required String medicineTo,
    required String repetition,
  }){
    MedicineModel medicineModel = MedicineModel(
      userId: userID,
      medicineName: medicineName,
      medicineTime: medicineTime,
      medicineFrom: medicineFrom,
      medicineTo: medicineTo,
      repetition: repetition,
    );
    emit(SaveMedicineDataLoadingState());
    FirebaseFirestore.instance
        .collection('medicineTiming')
        .doc()
        .set(medicineModel.toJson())
        .then((value){
      emit(SaveMedicineDataSuccessState());
      debugPrint('Medicine Data Sent');
    }).catchError((error){
      emit(SaveMedicineDataErrorState(

          error.toString()));
      debugPrint('Medicine Error');
    });
  }

  void editAppointment(
  {
  required String date,
    required String time,
    }
      ){
      emit(EditAppointmentLoadingState());
      FirebaseFirestore.instance
          .collection('appointments')
          .doc()
          .update({
        'date': date,
        'time': time,
      }).then((value){
        emit(EditAppointmentSuccessState());
        debugPrint('Appointment Edited');
      }).catchError((error){
        emit(EditAppointmentErrorState(error.toString()));
        debugPrint('Appointment Error');
      });
  }

  List<AppointmentModel> dayPatientAppointments = [];
  void getAppointmentOnSpecificDate({
  required String userId,
}){
    emit(GetAppointmentOnSpecificDateLoadingState());
    FirebaseFirestore.instance
        .collection('appointments')
        .where('date', isEqualTo: dayFocused.toString().split(' ')[0])
        .where('Uid', isEqualTo: userId)
        .get().then((value){
          value.docs.forEach((element) {
            dayPatientAppointments.add(AppointmentModel.fromJson(element.data()));
            // patientAppointment = AppointmentModel.fromJson(element.data());
            // debugPrint(element.data().toString());
            // patientAppointments =[];
          });
      emit(GetAppointmentOnSpecificDateSuccessState());
    }).catchError((error){
      emit(GetAppointmentOnSpecificDateErrorState(error.toString()));
    });
  }
  // void deleteAppointment(){
  // emit(DeleteAppointmentLoadingState());
  //   FirebaseFirestore.instance
  //       .collection('appointments').where()
  //       .delete()
  //       .then((value){
  //     emit(DeleteAppointmentSuccessState());
  //     debugPrint('Appointment Deleted');
  //   }).catchError((error){
  //     emit(DeleteAppointmentErrorState(
  //         error.toString()));
  //     debugPrint('Appointment Error');
  //   });
  // }

  // List<MedicineModel> medicineTimings = [];
  // void getMedicineData(){
  //   emit(GetMedicineTimingLoadingState());
  //
  //   FirebaseFirestore.instance
  //       .collection('medicineTiming')
  //       .doc()
  //       .get()
  //       .then((value) {
  //     medicineTimings =
  //     debugPrint(appointments!.date);
  //     emit(GetMedicineTimingSuccessState());
  //   }).catchError((error) {
  //     emit(GetMedicineTimingErrorState(error.toString()));
  //   });
  // }
}

