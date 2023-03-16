abstract class DoctorsStates {}

class DoctorsInitialState extends DoctorsStates {}

class DoctorsLoadingState extends DoctorsStates {}

class DoctorsSuccessState extends DoctorsStates {}

class DoctorsErrorState extends DoctorsStates {
  final String error;

  DoctorsErrorState(this.error);
}

class DoctorsBySpecializationLoadingState extends DoctorsStates {}

class DoctorsBySpecializationSuccessState extends DoctorsStates {}

class DoctorsBySpecializationErrorState extends DoctorsStates {
  final String error;

  DoctorsBySpecializationErrorState(this.error);
}