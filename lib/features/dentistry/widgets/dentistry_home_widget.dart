import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:mentlo/core/utils/blocs/appointment_bloc/cubit.dart';
import 'package:mentlo/core/utils/blocs/doctors_bloc/cubit.dart';
import 'package:mentlo/core/utils/blocs/doctors_bloc/states.dart';

class DentistryHomeWidget extends StatelessWidget {
  const DentistryHomeWidget({Key? key}) : super(key: key);

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
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              'Dentistry Doctors',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            centerTitle: true,
          ),
          body: ListView.separated(
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: HexColor('#cbe3d9'),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              right: 15,
                            ),
                            child: CircleAvatar(
                              radius: 38,
                              // backgroundColor: Colors.blue,
                              backgroundImage:
                                  NetworkImage(cubit.doctors[0].imageUrl),
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 8,
                                  ),
                                  child: Text(
                                    cubit.doctorsSpecialization[0].name,
                                    style: const TextStyle(fontSize: 18),
                                  ),
                                ),
                                Text(
                                  cubit.doctorsSpecialization[0].email,
                                  style: const TextStyle(fontSize: 16),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'from: ',
                                      style: TextStyle(
                                        fontSize: 17,
                                      ),
                                    ),
                                    Text(
                                      cubit.doctorsSpecialization[0].from,
                                      style: const TextStyle(fontSize: 16),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    const Text(
                                      ' to: ',
                                      style: TextStyle(
                                        fontSize: 17,
                                      ),
                                    ),
                                    Text(
                                      cubit.doctorsSpecialization[0].to,
                                      style: const TextStyle(fontSize: 16),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          // MaterialButton(onPressed: (){}, child: Text(),)
                          Container(
                              width: 58,
                              // height: 54,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: HexColor('#c14953'),
                              ),
                              child: TextButton(
                                  onPressed: () {
                                    showBottomSheet(
                                        context: context,
                                        builder: (context) => Container(
                                              height: 350,
                                              width: double.infinity,
                                              color: HexColor('#cbe3d9'),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: const [
                                                      Icon(Icons.drag_handle),
                                                    ],
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            16.0),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        const Text(
                                                          'Date',
                                                          style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 20,
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          height: 10,
                                                        ),
                                                        TextFormField(
                                                          onTap: () {
                                                            showDatePicker(
                                                              context: context,
                                                              initialDate:
                                                                  DateTime
                                                                      .now(),
                                                              firstDate:
                                                                  DateTime
                                                                      .now(),
                                                              lastDate:
                                                                  DateTime(
                                                                      2032),
                                                            ).then((value) {
                                                              dateController
                                                                      .text =
                                                                  value!
                                                                      .toString()
                                                                      .split(
                                                                          ' ')
                                                                      .first;
                                                              debugPrint(value
                                                                  .toString());
                                                            });
                                                          },
                                                          keyboardType:
                                                              TextInputType
                                                                  .none,
                                                          controller:
                                                              dateController,
                                                          decoration:
                                                              const InputDecoration(
                                                            labelText: 'Date',
                                                            border:
                                                                OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .all(
                                                                Radius.circular(
                                                                    10.0),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          height: 20,
                                                        ),
                                                        const Text(
                                                          'Time',
                                                          style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 20,
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          height: 10,
                                                        ),
                                                        TextFormField(
                                                          onTap: () {
                                                            showTimePicker(
                                                              context: context,
                                                              initialTime:
                                                                  TimeOfDay
                                                                      .now(),
                                                            ).then((value) {
                                                              timeController
                                                                      .text =
                                                                  value!
                                                                      .format(
                                                                          context)
                                                                      .toString();
                                                              debugPrint(value
                                                                  .format(
                                                                      context)
                                                                  .toString());
                                                            });
                                                          },
                                                          keyboardType:
                                                              TextInputType
                                                                  .none,
                                                          controller:
                                                              timeController,
                                                          decoration:
                                                              const InputDecoration(
                                                            labelText: 'Time',
                                                            border:
                                                                OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .all(
                                                                Radius.circular(
                                                                    10.0),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          height: 20,
                                                        ),
                                                        Container(
                                                          width:double.infinity,
                                                          height: 54,
                                                          decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                            color:
                                                                HexColor('#c14953'),
                                                          ),
                                                          child: TextButton(
                                                            onPressed: () {
                                                              appointmentCubit.bookAppointment(date: dateController.text, time: timeController.text, userId: 'FzwWU95tRvRaQTHBjGvbyGrnGAA3', doctorId: 'EOuOGvrebNtIXqDOElzL', appointmentId: '2');
                                                              debugPrint('done');
                                                            },
                                                            child: const Text(
                                                              'Book',
                                                              style: TextStyle(
                                                                color:
                                                                    Colors.white,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ));
                                  },
                                  child: const Text(
                                    'Book',
                                    style: TextStyle(color: Colors.white),
                                  ))),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            separatorBuilder: (context, index) => Container(
              height: 1,
              color: Colors.grey,
            ),
            itemCount: cubit.doctorsSpecialization.length,
          ),
        );
      },
    );
  }
}
