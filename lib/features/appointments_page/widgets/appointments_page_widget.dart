import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mentlo/core/utils/blocs/appointment_bloc/cubit.dart';
import 'package:mentlo/core/utils/blocs/appointment_bloc/state.dart';

class AppointmentsWidget extends StatelessWidget {
  const AppointmentsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppointmentBloc(),
      child: BlocConsumer<AppointmentBloc, AppointmentStates>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          AppointmentBloc cubit = AppointmentBloc.get(context);
          return Scaffold(
            appBar: AppBar(
              title: const Text('Appointments',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              centerTitle: true,
            ),
            body: Column(
              children: [
                MaterialButton(onPressed: () {
                  cubit.getAppointmentsByUserId('Z6nyJKVX3VlYc561451g');
                  debugPrint('Button 1');
                }, child: const Text('Button 1')),
              ],
            ),
          );
        },
      ),
    );
  }
}
