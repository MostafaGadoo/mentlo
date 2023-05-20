class AppointmentModel {
  final String date;
  final String time;
  final String Uid;
  final String doctorId;
  final String appointmentId;
  final String doctorName;
  final String doctorSpecialization;

  AppointmentModel({
    required this.date,
    required this.time,
    required this.Uid,
    required this.doctorId,
    required this.appointmentId,
    required this.doctorName,
    required this.doctorSpecialization,
  });

  factory AppointmentModel.fromJson(Map<String, dynamic> json) {
    return AppointmentModel(
      date: json['date'],
      time: json['time'],
      Uid: json['Uid'],
      doctorId: json['doctorId'],
      appointmentId: json['appointmentId'],
      doctorName: json['doctorName'],
      doctorSpecialization: json['doctorSpecialization'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'date': date,
      'time': time,
      'Uid': Uid,
      'doctorId': doctorId,
      'appointmentId': appointmentId,
      'doctorName': doctorName,
      'doctorSpecialization': doctorSpecialization,
    };
  }
}
