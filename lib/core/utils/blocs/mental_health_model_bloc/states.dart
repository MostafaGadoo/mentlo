abstract class MentalHealthStates {}

class MentalHealthInitial extends MentalHealthStates {}

class MentalHealthLoading extends MentalHealthStates {}

class MentalHealthSuccess extends MentalHealthStates{}

class MentalHealthError extends MentalHealthStates {
  final String result;

  MentalHealthError(this.result);
}

