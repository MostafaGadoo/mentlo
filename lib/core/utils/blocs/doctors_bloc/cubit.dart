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

  List<DoctorModel> doctors = [];

  void getDoctors() {
    FirebaseFirestore.instance.collection('doctors').get().then((value) {
      value.docs.forEach((element) {
        doctors.add(DoctorModel.fromJson(element.data()));
      });
      emit(DoctorsSuccessState());
    }).catchError((error) {
      debugPrint(error.toString());
      emit(DoctorsErrorState(error.toString()));
    });
  }

  List<DoctorModel> doctorsSpecialization = [];

  void getDoctorsByCategory(String category) {
    FirebaseFirestore.instance
        .collection('doctors')
        .where('specialization', isEqualTo: category)
        .get()
        .then((value) {
      value.docs.forEach((element) {
        doctorsSpecialization.add(DoctorModel.fromJson(element.data()));
      });
          emit(DoctorsBySpecializationSuccessState());
    })
        .catchError((error) {
      debugPrint(error.toString());
      emit(DoctorsBySpecializationErrorState(error));
    });
  }

  late TabController tabController;

  List<DentistModel> dentistList = [];
  // DentistModel? dentistModel;
  void getDentists(){
    FirebaseFirestore.instance
        .collection('dentist')
        .get()
        .then((value)
    {
      value.docs.forEach((element) {
        // dentistModel = DentistModel.fromJson(element.data());
        dentistList.add(DentistModel.fromJson(element.data()));
      });
      emit(DentistGetSuccessState());
    })
        .catchError((error){
      emit(DentistGetErrorState(error.toString()));
    });
  }

  List<CardiothoracicModel> cardiothoracicList = [];
  // CardiothoracicModel? cardiothoracicModel;
  void getCardiothoracic(){
    FirebaseFirestore.instance
        .collection('cardiothoracic')
        .get()
        .then((value)
    {
      value.docs.forEach((element) {
        // cardiothoracicModel = CardiothoracicModel.fromJson(element.data());
        cardiothoracicList.add(CardiothoracicModel.fromJson(element.data()));
      });
      emit(CardiothoracicGetSuccessState());
    })
        .catchError((error){
      emit(CardiothoracicGetErrorState(error.toString()));
    });
  }

  List<SurgeryModel> surgeryList = [];
  // SurgeryModel? surgeryModel;
  void getSurgery(){
    FirebaseFirestore.instance
        .collection('surgery')
        .get()
        .then((value)
    {
      value.docs.forEach((element) {
        // surgeryModel = SurgeryModel.fromJson(element.data());
        surgeryList.add(SurgeryModel.fromJson(element.data()));
      });
      emit(SurgeryGetSuccessState());
    })
        .catchError((error){
      emit(SurgeryGetErrorState(error.toString()));
    });
  }
}
