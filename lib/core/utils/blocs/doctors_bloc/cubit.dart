import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mentlo/core/models/cardiothoracic_model.dart';
import 'package:mentlo/core/models/dentist_model.dart';
import 'package:mentlo/core/models/doctors_model.dart';
import 'package:mentlo/core/models/surgery_model.dart';
import 'package:mentlo/core/utils/blocs/doctors_bloc/states.dart';

class DoctorsBloc extends Cubit<DoctorsStates> {
  DoctorsBloc() : super(DoctorsInitialState());

  static DoctorsBloc get(context) => BlocProvider.of(context);

  List<SurgeryModel> surgeryDoctorsList = [];

  // void getSurgeryDoctors() {
  //   FirebaseFirestore.instance.collection('doctors')
  //       .where('specialization', isEqualTo: 'surgery')
  //       .get().then((value) {
  //     value.docs.forEach((element) {
  //       surgeryDoctorsList.add(SurgeryModel.fromJson(element.data()));
  //     });
  //     emit(DoctorsSuccessState());
  //   }).catchError((error) {
  //     debugPrint(error.toString());
  //     emit(DoctorsErrorState(error.toString()));
  //   });
  // }
  void getSurgeryDoctors() {
    emit(DoctorsLoadingState());
    FirebaseFirestore.instance.collection('doctors')
        .where('specialization', isEqualTo: 'surgery')
        .get().then((value) {
      value.docs.forEach((element) {
        surgeryDoctorsList.add(SurgeryModel.fromJson(element.data()));
      });
      emit(GetSurgerySuccessState());
    }).catchError((error) {
      debugPrint(error.toString());
      emit(GetSurgeryErrorState(error.toString()));
    });
  }
  List<CardiothoracicModel> cardiothoracicDoctorsList = [];

  void getCardiothoracicDoctors() {
    emit(GetCardiothoracicLoadingState());
    FirebaseFirestore.instance.collection('doctors')
        .where('specialization', isEqualTo: 'cardiothoracic')
        .get().then((value) {
      value.docs.forEach((element) {
        cardiothoracicDoctorsList.add(CardiothoracicModel.fromJson(element.data()));
      });
      emit(GetCardiothoracicSuccessState());
    }).catchError((error) {
      debugPrint(error.toString());
      emit(GetCardiothoracicErrorState(error.toString()));
    });
  }

  List<DentistModel> dentistDoctorsList = [];

  void getDentistDoctors() {
    emit(GetDentistLoadingState());
    FirebaseFirestore.instance.collection('doctors')
        .where('specialization', isEqualTo: 'Dentistry')
        .get().then((value) {
      value.docs.forEach((element) {
        dentistDoctorsList.add(DentistModel.fromJson(element.data()));
      });
      emit(GetDentistSuccessState());
    }).catchError((error) {
      debugPrint(error.toString());
      emit(GetDentistErrorState(error.toString()));
    });
  }

  late TabController tabController;


  void getDoctorById({
  required String doctorId,
}){
    FirebaseFirestore.instance.collection('doctors')
        .where('specialization', isEqualTo: 'Dentistry')
        .get().then((value) {
      value.docs.forEach((element) {
        dentistDoctorsList.add(DentistModel.fromJson(element.data()));
      });
      emit(GetDentistSuccessState());
    }).catchError((error) {
      debugPrint(error.toString());
      emit(GetDentistErrorState(error.toString()));
    });
  }
}
