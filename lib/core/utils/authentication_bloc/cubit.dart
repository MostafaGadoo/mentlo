import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mentlo/core/utils/authentication_bloc/states.dart';

class AuthenticationBloc extends Cubit<AuthenticationState>{
  AuthenticationBloc():super(SignUpInitialState());
  static AuthenticationBloc get(context) => BlocProvider.of(context);



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
        emit(SignUpSuccessState());
        }).catchError((error){
          emit(SignUpErrorState(error.toString()));
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


}