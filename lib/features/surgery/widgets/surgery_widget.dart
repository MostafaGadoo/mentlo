import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mentlo/core/utils/blocs/appointment_bloc/cubit.dart';
import 'package:mentlo/core/utils/blocs/doctors_bloc/cubit.dart';
import 'package:mentlo/core/utils/blocs/doctors_bloc/states.dart';
import 'package:mentlo/core/utils/constants/contstants.dart';
import 'package:mentlo/core/utils/shared_widgets/components.dart';
import 'package:mentlo/core/utils/shared_widgets/default_doctor_list_item.dart';

class SurgeryWidget extends StatelessWidget {
  const SurgeryWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DoctorsBloc, DoctorsStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        DoctorsBloc cubit = DoctorsBloc.get(context);
        AppointmentBloc appointmentCubit = AppointmentBloc.get(context);
        TextEditingController dateController = TextEditingController();
        TextEditingController timeController = TextEditingController();
        bool isBottomSheetShown = false;
        var scaffoldKey = GlobalKey<ScaffoldState>();
        return ConditionalBuilder(
            condition: state is! GetSugaryLoadingState,
            builder: (context)=> Scaffold(
              key: scaffoldKey,
              body: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) => DefaultDoctorsListItem(
                    profileImage: cubit.surgeryList[index].imageURL,
                    doctorName: cubit.surgeryList[index].name,
                    doctorEmail: cubit.surgeryList[index].email,
                    from: cubit.surgeryList[index].from,
                    to: cubit.surgeryList[index].to,
                    workingDays: cubit.surgeryList[index].workingDays,
                    appointmentBooked: () {
                      debugPrint('Appointment Booked');
                      isBottomSheetShown = true;
                      scaffoldKey.currentState!.showBottomSheet(
                            (context) => Container(
                          height: 300,
                          width: double.infinity,
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 8,
                              right: 8,
                              top: 8,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Icon(Icons.drag_handle),
                                  ],
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                const Text(
                                  'Time',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                TextFormField(
                                  controller: timeController,
                                  keyboardType: TextInputType.none,
                                  decoration: const InputDecoration(
                                    labelText: 'Time',
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.teal,
                                      ),
                                    ),
                                    filled: true,
                                    fillColor: Colors.white,
                                  ),
                                  onTap: () async {
                                    final TimeOfDay? picked =
                                    await showTimePicker(
                                      context: context,
                                      initialTime: TimeOfDay.now(),
                                    );
                                    if (picked != null) {
                                      timeController.text =
                                          picked.toString().substring(10, 15);
                                      debugPrint(timeController.text);
                                    }
                                  },
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                const Text(
                                  'Date',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                TextFormField(
                                  controller: dateController,
                                  keyboardType: TextInputType.none,
                                  decoration: const InputDecoration(
                                    labelText: 'Date',
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.teal,
                                      ),
                                    ),
                                    filled: true,
                                    fillColor: Colors.white,
                                  ),
                                  onTap: () async {
                                    final DateTime? picked =
                                    await showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(2020, 8),
                                      lastDate: DateTime(2032, 8),
                                    );
                                    if (picked != null) {
                                      dateController.text =
                                          picked.toString().substring(0, 10);
                                      debugPrint(dateController.text);
                                    }
                                  },
                                ),
                                const SizedBox(
                                  height: 14,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Container(
                                      height: 54,
                                      decoration: BoxDecoration(
                                        color: Colors.teal,
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: MaterialButton(
                                        onPressed: () {
                                          if (dateController.text.isNotEmpty &&
                                              timeController.text.isNotEmpty) {
                                            appointmentCubit.bookAppointment(
                                                date: dateController.text,
                                                time: timeController.text,
                                                userId: '1',
                                                doctorId: cubit
                                                    .dentistList[index]
                                                    .doctorId);
                                            Navigator.pop(context);
                                            isBottomSheetShown = false;
                                            dateController.clear();
                                            timeController.clear();
                                            showToast(
                                                msg: 'Appointment Booked',
                                                state: ToastState.SUCCESS);
                                          } else {
                                            showToast(
                                                msg:
                                                'Please enter the appointment data',
                                                state: ToastState.ERROR);
                                          }
                                        },
                                        child: const Text(
                                          'Book',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 8,
                  ),
                  itemCount: cubit.surgeryList.length),
            ),
            fallback: (context)=>  Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    CircularProgressIndicator(
                      color: Colors.teal,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      'Loading...',
                    ),
                  ],
                )),
        );
      },
    );
  }
}
