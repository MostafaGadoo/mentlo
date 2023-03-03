import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mentlo/core/models/doctors_model.dart';
import 'package:mentlo/core/utils/blocs/doctors_bloc/states.dart';

class DoctorsBloc extends Cubit<DoctorsStates> {
  DoctorsBloc() :super(DoctorsInitialState());

  static DoctorsBloc get(context) => BlocProvider.of(context);

  List <DoctorsModel> doctors = [];

  void getDoctors() {
    FirebaseFirestore.instance.collection('doctors').get()
        .then((value) {
          value.docs.forEach((element) {
            doctors.add(DoctorsModel.fromJson(element.data()));
          });
          emit(DoctorsSuccessState());
    })
        .catchError((error) {
        debugPrint(error.toString());
        emit(DoctorsErrorState(error.toString()));
    });
  }

}