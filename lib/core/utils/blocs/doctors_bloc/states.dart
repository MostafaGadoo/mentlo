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

class GetDentistLoadingState extends DoctorsStates {}

class GetDentistSuccessState extends DoctorsStates {}

class GetDentistErrorState extends DoctorsStates {
  final String error;
  GetDentistErrorState(this.error);
}


class GetCardiothoracicLoadingState extends DoctorsStates {}

class GetCardiothoracicSuccessState extends DoctorsStates {}

class GetCardiothoracicErrorState extends DoctorsStates {
  final String error;
  GetCardiothoracicErrorState(this.error);
}

class GetSugaryLoadingState extends DoctorsStates {}

class GetSurgerySuccessState extends DoctorsStates {}

class GetSurgeryErrorState extends DoctorsStates {
  final String error;
  GetSurgeryErrorState(this.error);
}

