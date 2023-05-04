import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mentlo/core/utils/blocs/appointment_bloc/cubit.dart';
import 'package:mentlo/core/utils/blocs/appointment_bloc/cubit.dart';
import 'package:mentlo/core/utils/blocs/appointment_bloc/state.dart';
import 'package:mentlo/core/utils/constants/contstants.dart';
import 'package:mentlo/core/utils/shared_widgets/components.dart';
import 'package:mentlo/core/utils/shared_widgets/defaultTextFormField.dart';
import 'package:mentlo/core/utils/styles/colors.dart';

class ComplainsWidget extends StatelessWidget {
  const ComplainsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController appointmentID = TextEditingController();
    TextEditingController doctorsNameController = TextEditingController();
    TextEditingController complainController = TextEditingController();
    final formKey = GlobalKey<FormState>();
    return BlocConsumer<AppointmentBloc, AppointmentStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        AppointmentBloc cubit = AppointmentBloc.get(context);
        return Scaffold(
          appBar: AppBar(),
          body: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Image(
                      image: AssetImage('assets/images/complains.jpg'),
                      height: 250,
                      width: double.infinity,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Appointment ID:',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    DefaultFormField(
                      controller: appointmentID,
                      keyboardType: TextInputType.text,
                      validate: 'Please enter the Appointment ID',
                      hintText: 'Appointment ID',
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text(
                      'Doctor\'s Name:',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    DefaultFormField(
                      controller: doctorsNameController,
                      keyboardType: TextInputType.text,
                      validate: 'Please enter the Doctor\'s Name',
                      hintText: 'Doctor\'s Name',
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text(
                      'Complain:',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    DefaultFormField(
                      controller: complainController,
                      keyboardType: TextInputType.text,
                      validate: 'Please enter the Complain',
                      hintText: 'Complain',
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                        width: double.infinity,
                        height: 54,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          color: defaultColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: MaterialButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              cubit.sendComplain(
                                complain: complainController.text,
                                doctorName: doctorsNameController.text,
                                userId: appointmentID.text,
                              );
                              showToast(
                                msg: 'Complain Sent Successfully',
                                state: ToastState.SUCCESS,
                              );
                            }
                          },
                          child: const Text(
                            'Submit Complain',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        )),
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
