import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mentlo/core/models/user_model.dart';
import 'package:mentlo/core/utils/authentication_bloc/states.dart';

class AuthenticationBloc extends Cubit<AuthenticationState>{
  AuthenticationBloc():super(SignUpInitialState());
  static AuthenticationBloc get(context) => BlocProvider.of(context);



  UserModel userModel = UserModel();

  void getUserData({required String uId}){
    emit(GetUserLoadingState());
    FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then((value){
      emit(GetUserSuccessState());
      debugPrint(value.data().toString());
      userModel = UserModel.fromJson(value.data()!);
    }).catchError((error){
      emit(GetUserErrorState(error.toString()));
    });
  }

  void userRegister({
    required String? name,
    required String? email,
    required String? password,
    required String? phone,
      }
    ){
        emit(SignUpLoadingState());

        FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: email!,
            password: password!,
      ).then((value){
        debugPrint(value.user!.email);
        debugPrint(value.user!.uid);
        getUserData(uId: value.user!.uid);
        userCreate(
          name: name,
          email: email,
          phone: phone,
          uId: value.user!.uid,
        );
        emit(SignUpSuccessState());
        }).catchError((error){
          emit(SignUpErrorState(error.toString()));
        });
      }

   void userCreate({
     required String? name,
     required String? email,
     required String? phone,
     required String? uId,
    }){
    UserModel user = UserModel(
      name: name,
      email: email,
      phone: phone,
      uId: uId,
    );
    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .set(user.toMap())
        .then((value){
      emit(SignUpCreateUserSuccessState());
      debugPrint('user created');
    }).catchError((error){
      emit(SignUpCreateUserErrorState(error.toString()));
      debugPrint('Error');
    });
   }


  void userSignIn({
    required String? email,
    required String? password,
  }) {
    emit(SignInLoadingState());
    FirebaseAuth.instance
        .signInWithEmailAndPassword(
      email: email!,
      password: password!,
    )
        .then((value) {
          debugPrint(value.user.toString());
      debugPrint(value.user!.email);
      debugPrint(value.user!.uid);
      debugPrint('login success');
      emit(SignInSuccessState());
    })
        .catchError((error) {
      debugPrint('login error');
      emit(SignInErrorState(error.toString()));
    });
  }


  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;

  void changePasswordVisibility(){
    isPassword = !isPassword;
    suffix = isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(ShowPasswordState());


  }

  void updateUserData({ required String name,required String email,required String phone}){
    emit(UpdateUserDataLoadingState());
    FirebaseFirestore.instance
        .collection('users').doc(FirebaseAuth.instance.currentUser!.uid)
        .update({
      'name': name,
      'email': email,
      'phone': phone,
    }).then((value) {
      emit(UpdateUserDataLoadingState());
      debugPrint('user updated');
    })
        .catchError((error){
          emit(UpdateUserDataErrorState(error.toString()));
    });
  }

  void userLogOut(){
    emit(SignOutLoadingState());
    FirebaseAuth.instance.signOut().then((value){
      emit(SignInSuccessState());
    }).catchError((error){
      emit(SignUpErrorState(error.toString()));
    });
  }
}