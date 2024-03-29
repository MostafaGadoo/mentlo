import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mentlo/core/utils/authentication_bloc/cubit.dart';
import 'package:mentlo/core/utils/authentication_bloc/states.dart';
import 'package:mentlo/core/utils/constants/contstants.dart';
import 'package:mentlo/core/utils/shared_widgets/components.dart';
import 'package:mentlo/core/utils/shared_widgets/defaultTextFormField.dart';
import 'package:mentlo/features/home_page/page/home_page_screen.dart';
import 'package:mentlo/features/layouts/main_layout.dart';

import 'package:mentlo/features/sign_up/page/sigin_up_screen.dart';

class SignInWidget extends StatelessWidget {
  const SignInWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        if (state is SignInErrorState) {
          showToast(
              msg: 'Please enter valid user name or password',
              state: ToastState.ERROR);
        } else if (state is SignInSuccessState) {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const MainLayOut()),
              (Route<dynamic> route) => false);
        }
      },
      builder: (context, state) {
        AuthenticationBloc cubit = AuthenticationBloc.get(context);
        TextEditingController emailController = TextEditingController();
        TextEditingController passwordController = TextEditingController();
        var formKey = GlobalKey<FormState>();
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              'Sign In',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            centerTitle: true,
            backgroundColor: Colors.white,
          ),
          body: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                  children: [
                const Image(
                  image: AssetImage('assets/images/Chatbot.png'),
                  width: 250,
                  height: 250,
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Email',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your email';
                          }else if(!value.contains('@')){
                            debugPrint('ana hena');
                            return 'Please enter valid email containing @';
                          }
                          return null;
                        },
                        controller: emailController,
                        obscureText: false,
                        decoration: InputDecoration(
                            hintText: 'Enter your email',
                            border: const OutlineInputBorder(
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(18),
                                topRight: Radius.circular(18),
                                topLeft: Radius.circular(8),
                                bottomLeft: Radius.circular(8),
                              ),
                            ),
                            suffixIcon: IconButton(
                                    onPressed: () {

                                    },
                                    icon: const Icon(Icons.email_outlined),
                                  ),

                                ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        'Password',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your password';
                          }else if(value.length < 8){
                            return 'Password must be at least 8 characters';
                          }
                          return null;
                        },
                        controller: passwordController,
                        obscureText: cubit.isPassword,
                        decoration: InputDecoration(
                          hintText: 'password must be at least 8 characters',
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(18),
                              topRight: Radius.circular(18),
                              topLeft: Radius.circular(8),
                              bottomLeft: Radius.circular(8),
                            ),
                          ),
                          suffixIcon: IconButton(
                              onPressed: (){
                                cubit.changePasswordVisibility();
                              },
                              icon: Icon(cubit.suffix),
                          ),

                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Don\'t have an account?',
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const SignUpScreen()));
                            },
                            child: const Text('Sign Up'),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 1,
                              color: Colors.grey,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(
                            'or',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Container(
                              height: 1,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      GestureDetector(
                        onTap: () {
                          GoogleSignIn().signIn();
                          debugPrint('Sign Up with Google');
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(
                              color: Colors.grey,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Image(
                                  image: AssetImage('assets/icons/google.png'),
                                  width: 16,
                                  height: 16,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'Sign In with Google',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),

                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: MaterialButton(
                          onPressed: () {
                              if (formKey.currentState!.validate()) {
                                cubit.userSignIn(
                                    email: emailController.text,
                                    password: passwordController.text);
                                cubit.getUserData(uId: FirebaseAuth.instance.currentUser!.uid);
                                showToast(
                                    msg: 'Signed in successfully',
                                    state: ToastState.SUCCESS);

                              }else{
                                showToast(
                                    msg: 'PLease enter valid credentials',
                                    state: ToastState.ERROR,
                                );
                              }

                          },
                          child: state is SignInLoadingState ? const CircularProgressIndicator(
                            color: Colors.white,
                          ) : const Text(
                            'Sign In',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ]),
            ),
          ),
        );
      },
    );
  }
}
