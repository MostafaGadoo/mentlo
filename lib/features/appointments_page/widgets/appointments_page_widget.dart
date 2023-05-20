import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:mentlo/core/utils/authentication_bloc/cubit.dart';
import 'package:mentlo/core/utils/blocs/appointment_bloc/cubit.dart';
import 'package:mentlo/core/utils/blocs/appointment_bloc/state.dart';
import 'package:mentlo/core/utils/shared_widgets/MyDivider.dart';
import 'package:mentlo/core/utils/shared_widgets/default_appointment_data_widget.dart';
import 'package:mentlo/core/utils/styles/colors.dart';
import 'package:table_calendar/table_calendar.dart';

class AppointmentsWidget extends StatelessWidget {
  const AppointmentsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppointmentBloc, AppointmentStates>(
      listener: (context, state) {
        // TODO: implement listener
        // if(AppointmentBloc.get(context).dayPatientAppointments.toString().isEmpty){
        //   const CircularProgressIndicator();
        // }
      },
      builder: (context, state) {
        AppointmentBloc cubit = AppointmentBloc.get(context);
        TextEditingController dateController = TextEditingController();
        TextEditingController timeController = TextEditingController();
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              'Appointments',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            centerTitle: true,
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TableCalendar(
                headerStyle: const HeaderStyle(
                  titleCentered: true,
                  formatButtonVisible: false,

                ),
                weekendDays: const [
                  DateTime.friday,
                  DateTime.saturday,
                ],
                rowHeight: 44,
                focusedDay: cubit.today,
                firstDay: DateTime.utc(2022, 03, 13),
                lastDay: DateTime.utc(2032, 03, 13),
                onDaySelected: (day, focusedDay) {
                  cubit.selectedDay(day, focusedDay);
                  cubit.dayPatientAppointments.clear();
                  cubit.getAppointmentOnSpecificDate(
                    userId: AuthenticationBloc.get(context).userModel.uId!,
                  );
                  debugPrint(cubit.dayPatientAppointments.length.toString());
                },
                selectedDayPredicate: (day) {
                  // debugPrint('hena');
                  return isSameDay(cubit.dayFocused, day);

                },
                eventLoader: (day) {
                  return cubit.dayAppointments(day);
                },
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: Container(
                  // height: 300,
                  child: ConditionalBuilder(
                    builder: (context) => ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) =>  DefaultAppointmentDataWidget(
                        doctorName: cubit.dayPatientAppointments[index].doctorName,
                        time: cubit.dayPatientAppointments[index].time,
                        date: cubit.dayPatientAppointments[index].date,
                        specialization: cubit.dayPatientAppointments[index].doctorSpecialization,
                        editAppointment: (){
                          showBottomSheet(context: context, builder: (context) => Container(
                            width: double.infinity,
                            height: MediaQuery.of(context).size.height * 0.44,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Icon(
                                        Icons.drag_handle,
                                        color: Colors.black,
                                        size: 26,
                                      ),
                                    ],
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.symmetric(
                                      vertical: 8,
                                    ),
                                    child: Text(
                                      'Edit Appointment',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.symmetric(
                                      vertical: 8,
                                    ),
                                    child: Text(
                                      'Time:',
                                      style: TextStyle(
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                  TextFormField(
                                    controller: timeController,
                                    keyboardType: TextInputType.none,
                                    decoration: InputDecoration(

                                      labelText: 'Doctor Name',
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
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
                                  const Padding(
                                    padding: EdgeInsets.symmetric(
                                      vertical: 8,
                                    ),
                                    child: Text(
                                      'Date:',
                                      style: TextStyle(
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                  TextFormField(
                                    controller: dateController,
                                    keyboardType: TextInputType.none,
                                    decoration: InputDecoration(

                                      labelText: 'Doctor Name',
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
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
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        FloatingActionButton(
                                            onPressed: (){
                                              cubit.editAppointment(date: dateController.text, time: timeController.text);
                                            },
                                          backgroundColor: defaultColor,

                                          child: const Icon(Icons.edit),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ));
                        },
                      ),
                      separatorBuilder:(context, index)=> const Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 22.0,
                        ),
                        child: MyDivider(
                          height: 1,
                          width: double.infinity,
                        ),
                      ),
                      itemCount: cubit.dayPatientAppointments.length,
                    ),
                    condition: cubit.dayPatientAppointments.isNotEmpty,
                    fallback: (context) => const Center(
                      child: Text(
                        'No Appointments Today',
                      ),
                    ),
                  ),
                ),
              ),
              // Expanded(
              //   child: Stack(
              //     children: [
              //       Offstage(
              //         offstage: state is GetPatientAppointmentSuccessState,
              //         child: ListView.separated(
              //           physics: const BouncingScrollPhysics(),
              //           itemBuilder: (context, index) =>  DefaultAppointmentDataWidget(
              //             doctorName: cubit.patientAppointments[index].doctorName,
              //             time: cubit.patientAppointments[index].time,
              //             date: cubit.patientAppointments[index].date,
              //             specialization: cubit.patientAppointments[index].doctorSpecialization,
              //             editAppointment: (){
              //               showBottomSheet(context: context, builder: (context) => Container(
              //                 width: double.infinity,
              //                 height: MediaQuery.of(context).size.height * 0.44,
              //                 child: Padding(
              //                   padding: const EdgeInsets.all(8.0),
              //                   child: Column(
              //                     crossAxisAlignment: CrossAxisAlignment.start,
              //                     children: [
              //                       Row(
              //                         mainAxisAlignment: MainAxisAlignment.center,
              //                         children: const [
              //                           Icon(
              //                             Icons.drag_handle,
              //                             color: Colors.black,
              //                             size: 26,
              //                           ),
              //                         ],
              //                       ),
              //                       const Padding(
              //                         padding: EdgeInsets.symmetric(
              //                           vertical: 8,
              //                         ),
              //                         child: Text(
              //                           'Edit Appointment',
              //                           style: TextStyle(
              //                             fontSize: 20,
              //                             fontWeight: FontWeight.bold,
              //                           ),
              //                         ),
              //                       ),
              //                       const Padding(
              //                         padding: EdgeInsets.symmetric(
              //                           vertical: 8,
              //                         ),
              //                         child: Text(
              //                           'Time:',
              //                           style: TextStyle(
              //                             fontSize: 18,
              //                           ),
              //                         ),
              //                       ),
              //                       TextFormField(
              //                         controller: timeController,
              //                         keyboardType: TextInputType.none,
              //                         decoration: InputDecoration(
              //
              //                           labelText: 'Doctor Name',
              //                           border: OutlineInputBorder(
              //                             borderRadius: BorderRadius.circular(10),
              //                           ),
              //                         ),
              //                         onTap: () async {
              //                           final TimeOfDay? picked =
              //                           await showTimePicker(
              //                             context: context,
              //                             initialTime: TimeOfDay.now(),
              //                           );
              //                           if (picked != null) {
              //                             timeController.text =
              //                                 picked.toString().substring(10, 15);
              //                             debugPrint(timeController.text);
              //                           }
              //                         },
              //                       ),
              //                       const Padding(
              //                         padding: EdgeInsets.symmetric(
              //                           vertical: 8,
              //                         ),
              //                         child: Text(
              //                           'Date:',
              //                           style: TextStyle(
              //                             fontSize: 18,
              //                           ),
              //                         ),
              //                       ),
              //                       TextFormField(
              //                         controller: dateController,
              //                         keyboardType: TextInputType.none,
              //                         decoration: InputDecoration(
              //
              //                           labelText: 'Doctor Name',
              //                           border: OutlineInputBorder(
              //                             borderRadius: BorderRadius.circular(10),
              //                           ),
              //                         ),
              //                         onTap: () async {
              //                           final DateTime? picked =
              //                           await showDatePicker(
              //                             context: context,
              //                             initialDate: DateTime.now(),
              //                             firstDate: DateTime(2020, 8),
              //                             lastDate: DateTime(2032, 8),
              //                           );
              //                           if (picked != null) {
              //                             dateController.text =
              //                                 picked.toString().substring(0, 10);
              //                             debugPrint(dateController.text);
              //                           }
              //                         },
              //                       ),
              //                       Padding(
              //                         padding: const EdgeInsets.only(top: 8.0),
              //                         child: Row(
              //                           mainAxisAlignment: MainAxisAlignment.end,
              //                           children: [
              //                             FloatingActionButton(
              //                               onPressed: (){
              //                                 cubit.editAppointment(date: dateController.text, time: timeController.text);
              //                               },
              //                               backgroundColor: defaultColor,
              //
              //                               child: const Icon(Icons.edit),
              //                             ),
              //                           ],
              //                         ),
              //                       )
              //                     ],
              //                   ),
              //                 ),
              //               ));
              //             },
              //           ),
              //           separatorBuilder:(context, index)=> const Padding(
              //             padding: EdgeInsets.symmetric(
              //               horizontal: 22.0,
              //             ),
              //             child: MyDivider(
              //               height: 1,
              //               width: double.infinity,
              //             ),
              //           ),
              //           itemCount: cubit.patientAppointments.length,
              //         ),
              //       ),
              //       Offstage(
              //         offstage: state is GetAppointmentOnSpecificDateSuccessState,
              //         child: ListView.separated(
              //           physics: const BouncingScrollPhysics(),
              //           itemBuilder: (context, index) =>  DefaultAppointmentDataWidget(
              //             doctorName: cubit.dayPatientAppointments[index].doctorName,
              //             time: cubit.dayPatientAppointments[index].time,
              //             date: cubit.dayPatientAppointments[index].date,
              //             specialization: cubit.dayPatientAppointments[index].doctorSpecialization,
              //             editAppointment: (){
              //               showBottomSheet(context: context, builder: (context) => Container(
              //                 width: double.infinity,
              //                 height: MediaQuery.of(context).size.height * 0.44,
              //                 child: Padding(
              //                   padding: const EdgeInsets.all(8.0),
              //                   child: Column(
              //                     crossAxisAlignment: CrossAxisAlignment.start,
              //                     children: [
              //                       Row(
              //                         mainAxisAlignment: MainAxisAlignment.center,
              //                         children: const [
              //                           Icon(
              //                             Icons.drag_handle,
              //                             color: Colors.black,
              //                             size: 26,
              //                           ),
              //                         ],
              //                       ),
              //                       const Padding(
              //                         padding: EdgeInsets.symmetric(
              //                           vertical: 8,
              //                         ),
              //                         child: Text(
              //                           'Edit Appointment',
              //                           style: TextStyle(
              //                             fontSize: 20,
              //                             fontWeight: FontWeight.bold,
              //                           ),
              //                         ),
              //                       ),
              //                       const Padding(
              //                         padding: EdgeInsets.symmetric(
              //                           vertical: 8,
              //                         ),
              //                         child: Text(
              //                           'Time:',
              //                           style: TextStyle(
              //                             fontSize: 18,
              //                           ),
              //                         ),
              //                       ),
              //                       TextFormField(
              //                         controller: timeController,
              //                         keyboardType: TextInputType.none,
              //                         decoration: InputDecoration(
              //
              //                           labelText: 'Doctor Name',
              //                           border: OutlineInputBorder(
              //                             borderRadius: BorderRadius.circular(10),
              //                           ),
              //                         ),
              //                         onTap: () async {
              //                           final TimeOfDay? picked =
              //                           await showTimePicker(
              //                             context: context,
              //                             initialTime: TimeOfDay.now(),
              //                           );
              //                           if (picked != null) {
              //                             timeController.text =
              //                                 picked.toString().substring(10, 15);
              //                             debugPrint(timeController.text);
              //                           }
              //                         },
              //                       ),
              //                       const Padding(
              //                         padding: EdgeInsets.symmetric(
              //                           vertical: 8,
              //                         ),
              //                         child: Text(
              //                           'Date:',
              //                           style: TextStyle(
              //                             fontSize: 18,
              //                           ),
              //                         ),
              //                       ),
              //                       TextFormField(
              //                         controller: dateController,
              //                         keyboardType: TextInputType.none,
              //                         decoration: InputDecoration(
              //
              //                           labelText: 'Doctor Name',
              //                           border: OutlineInputBorder(
              //                             borderRadius: BorderRadius.circular(10),
              //                           ),
              //                         ),
              //                         onTap: () async {
              //                           final DateTime? picked =
              //                           await showDatePicker(
              //                             context: context,
              //                             initialDate: DateTime.now(),
              //                             firstDate: DateTime(2020, 8),
              //                             lastDate: DateTime(2032, 8),
              //                           );
              //                           if (picked != null) {
              //                             dateController.text =
              //                                 picked.toString().substring(0, 10);
              //                             debugPrint(dateController.text);
              //                           }
              //                         },
              //                       ),
              //                       Padding(
              //                         padding: const EdgeInsets.only(top: 8.0),
              //                         child: Row(
              //                           mainAxisAlignment: MainAxisAlignment.end,
              //                           children: [
              //                             FloatingActionButton(
              //                               onPressed: (){
              //                                 cubit.editAppointment(date: dateController.text, time: timeController.text);
              //                               },
              //                               backgroundColor: defaultColor,
              //
              //                               child: const Icon(Icons.edit),
              //                             ),
              //                           ],
              //                         ),
              //                       )
              //                     ],
              //                   ),
              //                 ),
              //               ));
              //             },
              //           ),
              //           separatorBuilder:(context, index)=> const Padding(
              //             padding: EdgeInsets.symmetric(
              //               horizontal: 22.0,
              //             ),
              //             child: MyDivider(
              //               height: 1,
              //               width: double.infinity,
              //             ),
              //           ),
              //           itemCount: cubit.patientAppointments.length,
              //         ),
              //       ),
              //     ],
              //   ),
              // )
            ],
          ),
        );
      },
    );
  }

  Widget buildSwipeActionLeft() => Container(
    alignment: Alignment.centerLeft,
    padding: const EdgeInsets.symmetric(horizontal: 20),
    color: Colors.green,
    child: const Icon(Icons.edit, color: Colors.white),
  );

  Widget buildSwipeActionRight() => Container(
    alignment: Alignment.centerRight,
    padding: const EdgeInsets.symmetric(horizontal: 20),
    color: Colors.red,
    child: const Icon(Icons.delete, color: Colors.white),
  );
}
