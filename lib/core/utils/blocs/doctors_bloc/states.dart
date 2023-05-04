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

class DentistGetSuccessState extends DoctorsStates {}

class DentistGetErrorState extends DoctorsStates {
  final String error;
  DentistGetErrorState(this.error);
}


class GetCardiothoracicLoadingState extends DoctorsStates {}

class CardiothoracicGetSuccessState extends DoctorsStates {}

class CardiothoracicGetErrorState extends DoctorsStates {
  final String error;
  CardiothoracicGetErrorState(this.error);
}

class GetSugaryLoadingState extends DoctorsStates {}

class SurgeryGetSuccessState extends DoctorsStates {}

class SurgeryGetErrorState extends DoctorsStates {
  final String error;
  SurgeryGetErrorState(this.error);
}

