import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mentlo/core/utils/authentication_bloc/cubit.dart';
import 'package:mentlo/core/utils/authentication_bloc/states.dart';
import 'package:mentlo/core/utils/constants/contstants.dart';
import 'package:mentlo/core/utils/shared_widgets/components.dart';
import 'package:mentlo/core/utils/shared_widgets/defaultTextFormField.dart';
import 'package:mentlo/features/sign_in/page/signin_page.dart';

class SignUpWidget extends StatelessWidget {
  const SignUpWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        if (state is SignUpErrorState) {
          showToast(
              msg: 'Please check the entered data', state: ToastState.ERROR);
        } else if (state is SignUpCreateUserSuccessState) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const SignInScreen()));
        }
      },
      builder: (context, state) {
        AuthenticationBloc cubit = AuthenticationBloc.get(context);
        TextEditingController usernameController = TextEditingController();
        TextEditingController emailController = TextEditingController();
        TextEditingController passwordController = TextEditingController();
        TextEditingController confirmPasswordController =
            TextEditingController();
        TextEditingController phoneController = TextEditingController();
        var formKey = GlobalKey<FormState>();
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: const Text(
              'Sign Up',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Image(
                          image: AssetImage('assets/images/SignUpchatbot.png'),
                          width: 250,
                          height: 250,
                        ),
                      ],
                    ),
                    const Text(
                      'Username',
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
                          return 'Please enter your username';
                        }
                        return null;
                      },
                      controller: usernameController,
                      obscureText: false,
                      decoration: const InputDecoration(
                        hintText: 'Enter your username',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(18),
                            topRight: Radius.circular(18),
                            topLeft: Radius.circular(8),
                            bottomLeft: Radius.circular(8),
                          ),
                        ),
                        suffixIcon: Icon(Icons.person),
                      ),
                    ),
                    const SizedBox(height: 20),
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
                          return 'Please enter a valid email';
                        }
                        return null;
                      },
                      controller: emailController,
                      obscureText: false,
                      decoration: const InputDecoration(
                        hintText: 'example@mail.com',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(18),
                            topRight: Radius.circular(18),
                            topLeft: Radius.circular(8),
                            bottomLeft: Radius.circular(8),
                          ),
                        ),
                        suffixIcon: Icon(Icons.email_outlined),
                      ),
                    ),
                    const SizedBox(height: 20),
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
                      obscureText: false,
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
                            onPressed: () {},
                            icon: const Icon(
                              Icons.visibility,
                              color: Colors.grey,
                            )),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Confirm Password',
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
                          return 'Please enter your confirmation password';
                        }else if(value != passwordController.text){
                          return 'Password does not match';
                        }
                        return null;
                      },
                      controller: confirmPasswordController,
                      obscureText: false,
                      decoration:  InputDecoration(
                        hintText: 'password mus be at least 8 characters',
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(18),
                            topRight: Radius.circular(18),
                            topLeft: Radius.circular(8),
                            bottomLeft: Radius.circular(8),
                          ),
                        ),
                        suffixIcon: IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.visibility_off),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const SizedBox(height: 20),
                    const Text(
                      'Phone Number',
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
                          return 'Please enter your Phone number';
                        }else if(value.length < 10){
                          return 'Phone number must be at least 11 characters';
                        }
                        return null;
                      },
                      controller: phoneController,
                      obscureText: false,
                      decoration: const InputDecoration(
                        hintText: 'number must be at least 11 characters',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(18),
                            topRight: Radius.circular(18),
                            topLeft: Radius.circular(8),
                            bottomLeft: Radius.circular(8),
                          ),
                        ),
                        suffixIcon: Icon(Icons.phone),

                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Already Have an account?',
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const SignInScreen()));
                          },
                          child: const Text('Sign In'),
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
                                'Sign Up with Google',
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
                          if(formKey.currentState!.validate()){
                            debugPrint('Sign Up');
                            showToast(
                                msg: 'Thank you for signing up',
                                state: ToastState.SUCCESS);
                            cubit.userRegister(
                              email: emailController.text,
                              password: passwordController.text,
                              name: usernameController.text,
                              phone: phoneController.text,
                            );
                          }
                        },
                        child: const Text(
                          'Sign up',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
