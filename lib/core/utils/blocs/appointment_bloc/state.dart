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

class AppointmentDaySelectionState extends AppointmentStates {}

class AppointmentCalendarFormatState extends AppointmentStates {}

class GetPatientAppointmentsLoadingState extends AppointmentStates {}

class GetPatientAppointmentSuccessState extends AppointmentStates {}

class GetPatientAppointmentErrorState extends AppointmentStates {
  final String error;

  GetPatientAppointmentErrorState(this.error);
}

class GetPatientAppointmentsDoctorDataLoadingState extends AppointmentStates {}

class GetPatientAppointmentDoctorDataSuccessState extends AppointmentStates {}

class GetPatientAppointmentDoctorDataErrorState extends AppointmentStates {
  final String error;

  GetPatientAppointmentDoctorDataErrorState(this.error);
}

class SaveFeedbackLoadingState extends AppointmentStates {}

class SaveFeedbackSuccessState extends AppointmentStates {}

class SaveFeedbackErrorState extends AppointmentStates {
  final String error;

  SaveFeedbackErrorState(this.error);
}

class SaveComplainLoadingState extends AppointmentStates {}

class SaveComplainSuccessState extends AppointmentStates {}

class SaveComplainErrorState extends AppointmentStates {
  final String error;

  SaveComplainErrorState(this.error);
}

class SaveMedicineDataLoadingState extends AppointmentStates {}

class SaveMedicineDataSuccessState extends AppointmentStates {}

class SaveMedicineDataErrorState extends AppointmentStates {
  final String error;

  SaveMedicineDataErrorState(this.error);
}