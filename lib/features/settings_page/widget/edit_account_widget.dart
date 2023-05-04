import 'package:flutter/material.dart';
import 'package:mentlo/core/utils/authentication_bloc/cubit.dart';
import 'package:mentlo/core/utils/styles/colors.dart';

class EditAccountWidget extends StatelessWidget {
  const EditAccountWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                initialValue: AuthenticationBloc
                    .get(context)
                    .userModel
                    .name,
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
                initialValue: AuthenticationBloc
                    .get(context)
                    .userModel
                    .email,
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
                initialValue: AuthenticationBloc
                    .get(context)
                    .userModel
                    .phone,
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
                child: MaterialButton(onPressed: () {},
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
    );
  }
}
