abstract class AppointmentStates {}

class AppointmentInitialState extends AppointmentStates {}

class AppointmentLoadingState extends AppointmentStates {}

class AppointmentSuccessState extends AppointmentStates {}

class AppointmentErrorState extends AppointmentStates {
  final String error;

  AppointmentErrorState(this.error);
}

class AppointmentSaveSuccessState extends AppointmentStates {}

class AppointmentSaveErrorState extends AppointmentStates {
  final String error;

  AppointmentSaveErrorState(this.error);
}