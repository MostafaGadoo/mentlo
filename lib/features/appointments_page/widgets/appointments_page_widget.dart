import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:mentlo/core/utils/blocs/appointment_bloc/cubit.dart';
import 'package:mentlo/core/utils/blocs/appointment_bloc/state.dart';
import 'package:mentlo/core/utils/shared_widgets/MyDivider.dart';
import 'package:mentlo/core/utils/shared_widgets/default_appointment_data_widget.dart';
import 'package:table_calendar/table_calendar.dart';

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
                  // calendarFormat: cubit.calendarFormat = CalendarFormat.month,
                  // onFormatChanged: (format){
                  //   cubit.calendarFormat = format;
                  //   debugPrint(format.toString());
                  // },
                  // availableCalendarFormats: const {
                  //   CalendarFormat.week: 'Week',
                  //   CalendarFormat.month: 'Month',
                  //   CalendarFormat.twoWeeks: '2 Weeks',
                  // },
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
                  },
                  // onPageChanged: (focusedDay) {
                  //   cubit.dayFocused = focusedDay;
                  //   debugPrint(focusedDay.toString());
                  // },
                  selectedDayPredicate: (day) {
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
                    child: ListView.separated(
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) => const DefaultAppointmentDataWidget(
                          doctorName: 'Dr. Ahmed',
                          time: '10:00 AM',
                          date: '12/12/2021',
                          specialization: 'Dentist',
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
                        itemCount: 10,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
