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
        // if(state is SignUpErrorState){
        //   showToast(
        //       msg: state.error,
        //       state: ToastState.ERROR
        //   );
        // }
      },
      builder: (context, state) {
        AuthenticationBloc cubit = AuthenticationBloc.get(context);
        TextEditingController usernameController = TextEditingController();
        TextEditingController emailController = TextEditingController();
        TextEditingController passwordController = TextEditingController();
        TextEditingController confirmPasswordController = TextEditingController();
        TextEditingController phoneController = TextEditingController();
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
                  DefaultFormField(
                    controller: usernameController,
                    keyboardType: TextInputType.name,
                    validate: 'Please enter your username',
                    suffix: Icons.person,
                    hintText: 'Username',
                    suffixPressed: null,

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
                  DefaultFormField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    validate: 'Please enter your email',
                    suffix: Icons.email,
                    hintText: 'example@email.com',
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
                  DefaultFormField(
                    controller: passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    validate: 'Please enter a valid password',
                    suffix: Icons.visibility_off,
                    hintText: 'min. 8 characters',
                    isPassword: true,
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
                  DefaultFormField(
                    controller: confirmPasswordController,
                    keyboardType: TextInputType.visiblePassword,
                    validate: 'Please enter a valid password',
                    suffix: Icons.visibility_off,
                    hintText: 'min. 8 characters',
                    isPassword: true,
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
                  DefaultFormField(
                    controller: phoneController,
                    keyboardType: TextInputType.phone,
                    validate: 'enter a valid phone number',
                    suffix: Icons.phone,
                    hintText: '1234567890',
                    isPassword: true,
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
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const SignInScreen()));
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
                        if(passwordController.text != confirmPasswordController.text){
                          showToast(msg: 'Passwords does\'t match', state: ToastState.ERROR);
                          debugPrint('error');
                        }else{
                          showToast(msg: 'Thank you for signing up', state: ToastState.SUCCESS);
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
        );
      },
    );
  }
}
