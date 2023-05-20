import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mentlo/core/utils/authentication_bloc/cubit.dart';
import 'package:mentlo/core/utils/authentication_bloc/states.dart';
import 'package:mentlo/core/utils/constants/contstants.dart';
import 'package:mentlo/core/utils/shared_widgets/components.dart';
import 'package:mentlo/core/utils/styles/colors.dart';
import 'package:mentlo/features/settings_page/pages/settings_screen.dart';
import 'package:mentlo/features/settings_page/widget/settings_widget.dart';

class EditAccountWidget extends StatelessWidget {
  const EditAccountWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController(text: AuthenticationBloc.get(context).userModel.name);
    TextEditingController emailController = TextEditingController(text: AuthenticationBloc.get(context).userModel.email);
    TextEditingController phoneController = TextEditingController(text: AuthenticationBloc.get(context).userModel.phone);
    GlobalKey<FormState> formKey = GlobalKey();
    return BlocConsumer<AuthenticationBloc, AuthenticationState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    return Form(
      key: formKey,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Edit account',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Image(
                width: double.infinity,
                height: 250,
                image: AssetImage('assets/images/editAccount.jpg'),),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  const Text(
                  'Name',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10,),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your name';
                    }else if(value.length < 3){
                      return 'Name must be at least 3 characters';
                    }
                    return null;
                  },
                  controller: nameController,
                  // initialValue: AuthenticationBloc
                  //     .get(context)
                  //     .userModel
                  //     .name,
                  keyboardType: TextInputType.name,
                  decoration: const InputDecoration(
                    labelText: 'Name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                ),
                const SizedBox(height: 20,),
                const Text(
                  'Email',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10,),
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
                  // initialValue: AuthenticationBloc
                  //     .get(context)
                  //     .userModel
                  //     .email,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                ),
                const SizedBox(height: 20,),
                const Text(
                  'Phone Number',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10,),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your phone number';
                    }else if(value.length < 11){
                      return 'Phone number must be at least 11 characters';
                    }
                    return null;
                  },
                  controller: phoneController,
                  // initialValue: AuthenticationBloc
                  //     .get(context)
                  //     .userModel
                  //     .phone,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                    labelText: 'Phone Number',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                ),
                const SizedBox(height: 20,),
                Container(
                  width: double.infinity,
                  height: 54,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    color: defaultColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: MaterialButton(
                    onPressed: () {
                      if(formKey.currentState!.validate()){
                        AuthenticationBloc.get(context).updateUserData(
                          name: nameController.text,
                          email: emailController.text,
                          phone: phoneController.text,
                        );
                        showToast(
                            msg: 'Your data is updated',
                            state: ToastState.SUCCESS,
                        );
                      }
                      // Navigator.push(context, MaterialPageRoute(builder: (context) => const SettingsScreen()));
                    },
                    textColor: Colors.white,
                    child: const Text(
                        'Save Changes',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  },
);
  }
}
